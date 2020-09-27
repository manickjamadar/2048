import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';

part 'puzzle.freezed.dart';

@freezed
abstract class Puzzle with _$Puzzle {
  const factory Puzzle({
    @required Board board,
    @required BoardScore score,
    @required Option<Board> previousBoard,
    @required bool isGameOver,
    @required BoardScore previousScore,
  }) = _Puzzle;
}
