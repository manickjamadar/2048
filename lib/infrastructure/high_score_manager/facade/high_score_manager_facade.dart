import 'package:hive/hive.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:dartz/dartz.dart';
import 'package:twozerofoureight/domain/high_score_manager/facade/high_score_manager_facade.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';

class HighScoreManagerFacade extends IHighScoreManagerFacade {
  static const String _boxKey = "high_score_manager";
  Box<int> _box;

  Future<Box<int>> get getBox async {
    if (_box == null || !_box.isOpen) {
      _box = await Hive.openBox(_boxKey);
    }
    return _box;
  }

  @override
  Future<Either<Error, Unit>> save(BoardScore score, BoardOption option) async {
    try {
      final box = await getBox;
      await box.put(option.size.value, score.value);
      return Right(unit);
    } catch (_) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, BoardScore>> get(BoardOption option) async {
    final box = await getBox;
    final scoreValue = box.get(option.size.value, defaultValue: 0);
    return Right(BoardScore(scoreValue));
  }
}
