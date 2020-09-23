import 'package:dartz/dartz.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';

abstract class IHighScoreManagerFacade {
  Future<Either<Error, BoardScore>> get(BoardOption option);
  Future<Either<Error, Unit>> save(BoardScore score, BoardOption option);
}
