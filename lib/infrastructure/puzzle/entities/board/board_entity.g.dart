// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoardEntity _$_$_BoardEntityFromJson(Map<String, dynamic> json) {
  return _$_BoardEntity(
    points: (json['points'] as List)?.map((e) => e as int)?.toList(),
    size: json['size'] as int,
  );
}

Map<String, dynamic> _$_$_BoardEntityToJson(_$_BoardEntity instance) =>
    <String, dynamic>{
      'points': instance.points,
      'size': instance.size,
    };
