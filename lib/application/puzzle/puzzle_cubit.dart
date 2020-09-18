import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/has_any_empty_blocks.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/generate_random_board_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/merge_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/merge_only_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/slide_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

part 'puzzle_state.dart';
part 'puzzle_cubit.freezed.dart';

class PuzzleCubit extends Cubit<PuzzleState> {
  PuzzleCubit() : super(PuzzleState.initial());

  bool _getGameOverStatus(Board board) {
    return !hasAnyEmptyBlocks(board.blocks) && !board.slidable;
  }

  //events
  void init(BoardSize size) {
    final mainBoard = Board.empty(size);
    final mergeOnlyBoard = Board.empty(size);
    emit(PuzzleState(
        isGameOver: false,
        slidable: true,
        previousBoard: None(),
        boardSize: size,
        mainBoard:
            ActionRunner(GenerateRandomBoardActor(mainBoard, count: 2)).run(),
        mergeOnlyBoard: mergeOnlyBoard));
  }

  void initWithBoard(Board board) {
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
        previousBoard: None(),
        slidable: true,
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
    emit(state.copyWith(
        mergeOnlyBoard: Board.empty(state.boardSize), slidable: true));
  }

  void undo() {
    state.previousBoard.fold(() {}, (board) {
      emit(state.copyWith(
        isGameOver: false,
        mainBoard: board,
        previousBoard: None(),
      ));
    });
  }

  void reset() {
    init(state.boardSize);
  }
}
