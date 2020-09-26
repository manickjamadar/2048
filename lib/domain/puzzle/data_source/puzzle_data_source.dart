import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/infrastructure/puzzle/entities/puzzle/puzzle_entity.dart';

abstract class IPuzzleDataSource {
  Future<void> save(PuzzleEntity entity, BoardOption option);
  Future<PuzzleEntity> get(BoardOption option);
}
