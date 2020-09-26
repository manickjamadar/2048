// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'saved_board_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SavedBoardEntity _$SavedBoardEntityFromJson(Map<String, dynamic> json) {
  return _SavedBoardEntity.fromJson(json);
}

class _$SavedBoardEntityTearOff {
  const _$SavedBoardEntityTearOff();

// ignore: unused_element
  _SavedBoardEntity call(
      {@required
          String id,
      @required
      @JsonKey(name: 'board_option_entity')
          BoardOptionEntity boardOptionEntity,
      @required
      @JsonKey(name: 'puzzle_entity')
          PuzzleEntity puzzleEntity}) {
    return _SavedBoardEntity(
      id: id,
      boardOptionEntity: boardOptionEntity,
      puzzleEntity: puzzleEntity,
    );
  }
}

// ignore: unused_element
const $SavedBoardEntity = _$SavedBoardEntityTearOff();

mixin _$SavedBoardEntity {
  String get id;
  @JsonKey(name: 'board_option_entity')
  BoardOptionEntity get boardOptionEntity;
  @JsonKey(name: 'puzzle_entity')
  PuzzleEntity get puzzleEntity;

  Map<String, dynamic> toJson();
  $SavedBoardEntityCopyWith<SavedBoardEntity> get copyWith;
}

abstract class $SavedBoardEntityCopyWith<$Res> {
  factory $SavedBoardEntityCopyWith(
          SavedBoardEntity value, $Res Function(SavedBoardEntity) then) =
      _$SavedBoardEntityCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'board_option_entity') BoardOptionEntity boardOptionEntity,
      @JsonKey(name: 'puzzle_entity') PuzzleEntity puzzleEntity});

  $BoardOptionEntityCopyWith<$Res> get boardOptionEntity;
  $PuzzleEntityCopyWith<$Res> get puzzleEntity;
}

class _$SavedBoardEntityCopyWithImpl<$Res>
    implements $SavedBoardEntityCopyWith<$Res> {
  _$SavedBoardEntityCopyWithImpl(this._value, this._then);

  final SavedBoardEntity _value;
  // ignore: unused_field
  final $Res Function(SavedBoardEntity) _then;

  @override
  $Res call({
    Object id = freezed,
    Object boardOptionEntity = freezed,
    Object puzzleEntity = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      boardOptionEntity: boardOptionEntity == freezed
          ? _value.boardOptionEntity
          : boardOptionEntity as BoardOptionEntity,
      puzzleEntity: puzzleEntity == freezed
          ? _value.puzzleEntity
          : puzzleEntity as PuzzleEntity,
    ));
  }

  @override
  $BoardOptionEntityCopyWith<$Res> get boardOptionEntity {
    if (_value.boardOptionEntity == null) {
      return null;
    }
    return $BoardOptionEntityCopyWith<$Res>(_value.boardOptionEntity, (value) {
      return _then(_value.copyWith(boardOptionEntity: value));
    });
  }

  @override
  $PuzzleEntityCopyWith<$Res> get puzzleEntity {
    if (_value.puzzleEntity == null) {
      return null;
    }
    return $PuzzleEntityCopyWith<$Res>(_value.puzzleEntity, (value) {
      return _then(_value.copyWith(puzzleEntity: value));
    });
  }
}

abstract class _$SavedBoardEntityCopyWith<$Res>
    implements $SavedBoardEntityCopyWith<$Res> {
  factory _$SavedBoardEntityCopyWith(
          _SavedBoardEntity value, $Res Function(_SavedBoardEntity) then) =
      __$SavedBoardEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'board_option_entity') BoardOptionEntity boardOptionEntity,
      @JsonKey(name: 'puzzle_entity') PuzzleEntity puzzleEntity});

  @override
  $BoardOptionEntityCopyWith<$Res> get boardOptionEntity;
  @override
  $PuzzleEntityCopyWith<$Res> get puzzleEntity;
}

class __$SavedBoardEntityCopyWithImpl<$Res>
    extends _$SavedBoardEntityCopyWithImpl<$Res>
    implements _$SavedBoardEntityCopyWith<$Res> {
  __$SavedBoardEntityCopyWithImpl(
      _SavedBoardEntity _value, $Res Function(_SavedBoardEntity) _then)
      : super(_value, (v) => _then(v as _SavedBoardEntity));

  @override
  _SavedBoardEntity get _value => super._value as _SavedBoardEntity;

  @override
  $Res call({
    Object id = freezed,
    Object boardOptionEntity = freezed,
    Object puzzleEntity = freezed,
  }) {
    return _then(_SavedBoardEntity(
      id: id == freezed ? _value.id : id as String,
      boardOptionEntity: boardOptionEntity == freezed
          ? _value.boardOptionEntity
          : boardOptionEntity as BoardOptionEntity,
      puzzleEntity: puzzleEntity == freezed
          ? _value.puzzleEntity
          : puzzleEntity as PuzzleEntity,
    ));
  }
}

@JsonSerializable(explicitToJson: true)
class _$_SavedBoardEntity extends _SavedBoardEntity {
  const _$_SavedBoardEntity(
      {@required this.id,
      @required @JsonKey(name: 'board_option_entity') this.boardOptionEntity,
      @required @JsonKey(name: 'puzzle_entity') this.puzzleEntity})
      : assert(id != null),
        assert(boardOptionEntity != null),
        assert(puzzleEntity != null),
        super._();

  factory _$_SavedBoardEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_SavedBoardEntityFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'board_option_entity')
  final BoardOptionEntity boardOptionEntity;
  @override
  @JsonKey(name: 'puzzle_entity')
  final PuzzleEntity puzzleEntity;

  @override
  String toString() {
    return 'SavedBoardEntity(id: $id, boardOptionEntity: $boardOptionEntity, puzzleEntity: $puzzleEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SavedBoardEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.boardOptionEntity, boardOptionEntity) ||
                const DeepCollectionEquality()
                    .equals(other.boardOptionEntity, boardOptionEntity)) &&
            (identical(other.puzzleEntity, puzzleEntity) ||
                const DeepCollectionEquality()
                    .equals(other.puzzleEntity, puzzleEntity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(boardOptionEntity) ^
      const DeepCollectionEquality().hash(puzzleEntity);

  @override
  _$SavedBoardEntityCopyWith<_SavedBoardEntity> get copyWith =>
      __$SavedBoardEntityCopyWithImpl<_SavedBoardEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SavedBoardEntityToJson(this);
  }
}

abstract class _SavedBoardEntity extends SavedBoardEntity {
  const _SavedBoardEntity._() : super._();
  const factory _SavedBoardEntity(
      {@required
          String id,
      @required
      @JsonKey(name: 'board_option_entity')
          BoardOptionEntity boardOptionEntity,
      @required
      @JsonKey(name: 'puzzle_entity')
          PuzzleEntity puzzleEntity}) = _$_SavedBoardEntity;

  factory _SavedBoardEntity.fromJson(Map<String, dynamic> json) =
      _$_SavedBoardEntity.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'board_option_entity')
  BoardOptionEntity get boardOptionEntity;
  @override
  @JsonKey(name: 'puzzle_entity')
  PuzzleEntity get puzzleEntity;
  @override
  _$SavedBoardEntityCopyWith<_SavedBoardEntity> get copyWith;
}
