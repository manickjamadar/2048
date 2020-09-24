import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:twozerofoureight/domain/theme_color/facade/theme_color_facade.dart';

class ThemeColorFacade extends IThemeColorFacade {
  static const String _indexKey = "theme_color_index_key";
  final Box<int> box;

  ThemeColorFacade(this.box);
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
