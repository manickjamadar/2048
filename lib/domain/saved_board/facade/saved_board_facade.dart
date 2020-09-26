import 'package:dartz/dartz.dart';
import 'package:twozerofoureight/domain/core/value_objects/unique_id.dart';
import 'package:twozerofoureight/domain/saved_board/models/saved_board.dart';

abstract class ISavedBoardFacade {
  Future<Either<Error, Unit>> delete(UniqueId id);
  Future<Either<Error, Unit>> create(SavedBoard savedBoard);
  Future<Either<Error, List<SavedBoard>>> findAll();
}
