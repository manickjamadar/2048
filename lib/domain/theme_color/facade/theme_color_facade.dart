import 'package:dartz/dartz.dart';

abstract class IThemeColorFacade {
  Future<Either<Error, Unit>> saveIndex(int index);
  Future<Either<Error, int>> getCurrentIndex();
}
