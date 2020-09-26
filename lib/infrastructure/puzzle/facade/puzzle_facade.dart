import 'package:flutter/foundation.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:dartz/dartz.dart';
import 'package:twozerofoureight/domain/puzzle/data_source/puzzle_data_source.dart';
import 'package:twozerofoureight/domain/puzzle/facade/puzzle_facade.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/models/puzzle/puzzle.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';
import 'package:twozerofoureight/infrastructure/puzzle/entities/puzzle/puzzle_entity.dart';

class FakePuzzleFacade extends IPuzzleFacade {
  @override
  Future<Either<Error, Puzzle>> get(BoardOption option) async {
    final fakeBoard = Board.empty(option.size);
    fakeBoard.blocks[0] = Block.random(index: 0, boardSize: option.size.value);
    fakeBoard.blocks[1] = Block.random(index: 1, boardSize: option.size.value);
    return Right(Puzzle(
        board: fakeBoard,
        isGameOver: false,
        previousBoard: None(),
        score: BoardScore(option.size.value)));
  }

  @override
  Future<Either<Error, Unit>> save(Puzzle puzzle, BoardOption option) async {
    return Right(unit);
  }
}

class RealPuzzleFacade extends IPuzzleFacade {
  final IPuzzleDataSource dataSource;

  RealPuzzleFacade({@required this.dataSource});
  @override
  Future<Either<Error, Puzzle>> get(BoardOption option) async {
    try {
      final puzzleEntity = await dataSource.get(option);
      return Right(puzzleEntity.toModel());
    } catch (_) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, Unit>> save(Puzzle puzzle, BoardOption option) async {
    try {
      await dataSource.save(PuzzleEntity.fromModel(puzzle), option);
      return Right(unit);
    } catch (_) {
      return Left(Error());
    }
  }
}
