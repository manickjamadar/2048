import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/has_any_empty_blocks.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/generate_random_board_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/merge_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/merge_only_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/slide_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/facade/puzzle_facade.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/models/puzzle/puzzle.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import '../high_score_manager/high_score_manager_cubit.dart';
part 'puzzle_state.dart';
part 'puzzle_cubit.freezed.dart';

class PuzzleCubit extends Cubit<PuzzleState> {
  final BoardOptionCubit boardOptionCubit;
  final HighScoreManagerCubit highScoreManagerCubit;
  final IPuzzleFacade puzzleFacade;
  StreamSubscription<BoardOptionState> boardOptionSub;
  PuzzleCubit(
      {@required this.highScoreManagerCubit,
      @required this.boardOptionCubit,
      @required this.puzzleFacade})
      : super(PuzzleState.initial());

  bool _getGameOverStatus(Board board) {
    return !hasAnyEmptyBlocks(board.blocks) && !board.slidable;
  }

  BoardScore _previousScore = BoardScore(0);

  //events
  void autoInit() {
    _refreshed(boardOptionCubit.state.currentOption);
    boardOptionSub = boardOptionCubit.listen((optionState) {
      _refreshed(optionState.currentOption);
    });
  }

  void _refreshed(BoardOption option) async {
    final puzzleOption = await puzzleFacade.get(option);
    puzzleOption.fold((l) {
      init(option.size);
    }, (puzzle) {
      _initFromModel(puzzle);
    });
  }

  void _save() async {
    final puzzle = Puzzle(
        board: state.mainBoard,
        isGameOver: state.isGameOver,
        previousBoard: state.previousBoard,
        score: state.score);
    await puzzleFacade.save(puzzle, boardOptionCubit.state.currentOption);
  }

  void _initFromModel(Puzzle puzzle) {
    emit(PuzzleState(
        boardSize: puzzle.board.size,
        mainBoard: puzzle.board,
        mergeOnlyBoard: Board.empty(puzzle.board.size),
        previousBoard: puzzle.previousBoard,
        slidable: true,
        score: puzzle.score,
        isGameOver: puzzle.isGameOver));
  }

  void init(BoardSize size) {
    final mainBoard = Board.empty(size);
    final mergeOnlyBoard = Board.empty(size);
    emit(PuzzleState(
        isGameOver: false,
        slidable: true,
        previousBoard: None(),
        boardSize: size,
        score: BoardScore(0),
        mainBoard:
            ActionRunner(GenerateRandomBoardActor(mainBoard, count: 2)).run(),
        mergeOnlyBoard: mergeOnlyBoard));
  }

  void initWithBoard(Board board, BoardScore score, {Board previousBoard}) {
    if (!board.isValid) {
      throw UnsupportedError("Board size is invalid");
    }
    final mergeOnlyBoard = Board.empty(board.size);
    emit(PuzzleState(
        boardSize: board.size,
        mainBoard: ActionRunner(
                GenerateRandomBoardActor(board, count: board.isEmpty ? 2 : 0))
            .run(),
        mergeOnlyBoard: mergeOnlyBoard,
        previousBoard: optionOf(previousBoard),
        slidable: true,
        score: score,
        isGameOver: _getGameOverStatus(board)));
  }

  void slide({
    @required BoardDirection direction,
    @required Duration slideDuration,
    @required Duration mergeDuration,
  }) {
    if (!state.slidable || state.isGameOver) {
      return;
    }
    final slidedBoard =
        ActionRunner(SlideActor(state.mainBoard, direction: direction)).run();
    if (slidedBoard == state.mainBoard) {
      return;
    }
    emit(state.copyWith(
      mainBoard: slidedBoard,
      previousBoard: Some(state.mainBoard),
      slidable: false,
    ));
    Future.delayed(slideDuration, () {
      _slideCompleted(direction);
      Future.delayed(mergeDuration, () {
        _mergeCompleted();
      });
    });
  }

  void _slideCompleted(BoardDirection direction) {
    final mergedBoard =
        ActionRunner(MergeActor(state.mainBoard, direction: direction))
            .chain((mergedBoard) => GenerateRandomBoardActor(mergedBoard))
            .run();
    final mergeOnlyBoard =
        ActionRunner(MergeOnlyActor(state.mainBoard, direction: direction))
            .run();
    final isGameOver = _getGameOverStatus(mergedBoard);
    emit(state.copyWith(
      mainBoard: mergedBoard,
      mergeOnlyBoard: mergeOnlyBoard,
      isGameOver: isGameOver,
    ));
  }

  void _mergeCompleted() {
    _previousScore = state.score;
    final currentScore = state.score.add(state.mergeOnlyBoard);
    emit(state.copyWith(
      mergeOnlyBoard: Board.empty(state.boardSize),
      slidable: true,
      score: currentScore,
    ));
    if (currentScore.value > highScoreManagerCubit.state.score.value) {
      highScoreManagerCubit.save(currentScore);
    }
    _save();
  }

  void undo() {
    state.previousBoard.fold(() {}, (board) {
      emit(state.copyWith(
        isGameOver: false,
        mainBoard: board,
        score: _previousScore,
        previousBoard: None(),
      ));
      _save();
    });
  }

  void reset() {
    init(state.boardSize);
    _save();
  }

  @override
  Future<void> close() {
    boardOptionSub?.cancel();
    return super.close();
  }
}
