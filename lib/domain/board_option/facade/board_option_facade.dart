import 'package:dartz/dartz.dart';

abstract class IBoardOptionFacade {
  Future<Either<Error, Unit>> saveIndex(int index);
  Future<Either<Error, int>> getCurrentIndex();
}
