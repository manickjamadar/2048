// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_board_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedBoardEntity _$_$_SavedBoardEntityFromJson(Map<String, dynamic> json) {
  return _$_SavedBoardEntity(
    id: json['id'] as String,
    boardOptionEntity: json['board_option_entity'] == null
        ? null
        : BoardOptionEntity.fromJson(
            json['board_option_entity'] as Map<String, dynamic>),
    puzzleEntity: json['puzzle_entity'] == null
        ? null
        : PuzzleEntity.fromJson(json['puzzle_entity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_SavedBoardEntityToJson(
        _$_SavedBoardEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'board_option_entity': instance.boardOptionEntity?.toJson(),
      'puzzle_entity': instance.puzzleEntity?.toJson(),
    };
