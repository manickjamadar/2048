// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PuzzleEntity _$_$_PuzzleEntityFromJson(Map<String, dynamic> json) {
  return _$_PuzzleEntity(
    score: json['score'] as int,
    isGameOver: json['isGameOver'] as bool,
    boardEntity: json['board_entity'] == null
        ? null
        : BoardEntity.fromJson(json['board_entity'] as Map<String, dynamic>),
    previousBoardEntity: json['previous_board_entity'] == null
        ? null
        : BoardEntity.fromJson(
            json['previous_board_entity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PuzzleEntityToJson(_$_PuzzleEntity instance) =>
    <String, dynamic>{
      'score': instance.score,
      'isGameOver': instance.isGameOver,
      'board_entity': instance.boardEntity?.toJson(),
      'previous_board_entity': instance.previousBoardEntity?.toJson(),
    };
