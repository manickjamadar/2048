import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:dartz/dartz.dart';
import 'package:twozerofoureight/domain/puzzle/facade/puzzle_facade.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/models/puzzle/puzzle.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';

class FakePuzzleFacade extends IPuzzleFacade {
  @override
  Future<Either<Error, Puzzle>> get(BoardOption option) async {
    // TODO: implement get
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
    // TODO: implement save
    return Right(unit);
  }
}
