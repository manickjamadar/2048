import 'package:twozerofoureight/infrastructure/saved_board/entities/saved_board_entity.dart';

abstract class ISavedBoardDataSource {
  Future<void> delete(String id);
  Future<void> create(SavedBoardEntity entity);
  Future<List<SavedBoardEntity>> findAll();
}
