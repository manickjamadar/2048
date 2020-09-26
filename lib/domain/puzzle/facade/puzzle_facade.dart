import 'package:dartz/dartz.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/domain/puzzle/models/puzzle/puzzle.dart';

abstract class IPuzzleFacade {
  Future<Either<Error, Unit>> save(Puzzle puzzle, BoardOption option);
  Future<Either<Error, Puzzle>> get(BoardOption option);
}
