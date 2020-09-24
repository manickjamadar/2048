import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:twozerofoureight/domain/board_option/facade/board_option_facade.dart';

class BoardOptionFacade extends IBoardOptionFacade {
  static const String _indexKey = "index";
  final Box<int> box;
  BoardOptionFacade(this.box);
  @override
  Future<Either<Error, int>> getCurrentIndex() async {
    try {
      final index = box.get(_indexKey, defaultValue: 0);
      return Right(index);
    } catch (_) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, Unit>> saveIndex(int index) async {
    try {
      await box.put(_indexKey, index);
      return Right(unit);
    } catch (_) {
      return Left(Error());
    }
  }
}
