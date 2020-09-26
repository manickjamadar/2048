import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/puzzle/models/puzzle/puzzle.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';
import 'package:twozerofoureight/infrastructure/puzzle/entities/board_entity.dart';
part 'puzzle_entity.freezed.dart';

@freezed
abstract class PuzzleEntity implements _$PuzzleEntity {
  const PuzzleEntity._();
  const factory PuzzleEntity({
    @required int score,
    @required bool isGameOver,
    @required BoardEntity boardEntity,
    BoardEntity previousBoardEntity,
  }) = _PuzzleEntity;

  factory PuzzleEntity.fromModel(Puzzle puzzle) {
    return PuzzleEntity(
        score: puzzle.score.value,
        isGameOver: puzzle.isGameOver,
        boardEntity: BoardEntity.fromModel(puzzle.board),
        previousBoardEntity: puzzle.previousBoard
            .fold(() => null, (board) => BoardEntity.fromModel(board)));
  }
  Puzzle toModel() {
    return Puzzle(
        score: BoardScore(score),
        isGameOver: isGameOver,
        board: boardEntity.toModel(),
        previousBoard: optionOf(previousBoardEntity?.toModel()));
  }
}
