import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/models/puzzle/puzzle.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/domain/saved_board/facade/saved_board_facade.dart';
import 'package:twozerofoureight/domain/saved_board/models/saved_board.dart';

class SavedBoardFacade extends ISavedBoardFacade {
  @override
  Future<Either<Error, Unit>> create(SavedBoard savedBoard) async {
    // TODO: implement create
    return Right(unit);
  }

  @override
  Future<Either<Error, Unit>> delete(UniqueId id) async {
    // TODO: implement delete
    return Right(unit);
  }

  @override
  Future<Either<Error, List<SavedBoard>>> findAll() async {
    // TODO: implement findAll
    // final board = Board.empty(BoardSize(3));
    // board.blocks[0] = Block.random(index: 0, boardSize: 3);
    // board.blocks[1] = Block.random(index: 1, boardSize: 3);
    // final savedBoard = SavedBoard(
    //     id: UniqueId(),
    //     option: BoardOption(size: BoardSize(3), title: "Tiny"),
    //     puzzle: Puzzle(
    //       isGameOver: false,
    //       board: board,
    //       score: BoardScore(2345),
    //       previousBoard: None(),
    //     ));
    return Right([]);
  }
}
