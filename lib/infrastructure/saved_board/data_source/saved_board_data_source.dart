import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:twozerofoureight/domain/saved_board/data_source/saved_board_data_source.dart';
import 'package:twozerofoureight/infrastructure/saved_board/entities/saved_board_entity.dart';

class SavedBoardDataSource extends ISavedBoardDataSource {
  final Box<String> box;
  SavedBoardDataSource(this.box);
  @override
  Future<void> create(SavedBoardEntity entity) async {
    final rawJson = entity.toJson();
    final jsonString = jsonEncode(rawJson);
    await box.put(entity.id, jsonString);
  }

  @override
  Future<void> delete(String id) async {
    await box.delete(id);
  }

  @override
  Future<List<SavedBoardEntity>> findAll() async {
    final List<String> jsonStringList = box.values.toList();
    final List<Map<String, dynamic>> rawJsonList = jsonStringList
        .map((String jsonString) =>
            jsonDecode(jsonString) as Map<String, dynamic>)
        .toList();
    final List<SavedBoardEntity> entityList = rawJsonList
        .map((rawJson) => SavedBoardEntity.fromJson(rawJson))
        .toList();
    return entityList;
  }
}
