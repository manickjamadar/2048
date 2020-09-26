// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'puzzle_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PuzzleEntityTearOff {
  const _$PuzzleEntityTearOff();

// ignore: unused_element
  _PuzzleEntity call(
      {@required int score,
      @required bool isGameOver,
      @required BoardEntity boardEntity,
      BoardEntity previousBoardEntity}) {
    return _PuzzleEntity(
      score: score,
      isGameOver: isGameOver,
      boardEntity: boardEntity,
      previousBoardEntity: previousBoardEntity,
    );
  }
}

// ignore: unused_element
const $PuzzleEntity = _$PuzzleEntityTearOff();

mixin _$PuzzleEntity {
  int get score;
  bool get isGameOver;
  BoardEntity get boardEntity;
  BoardEntity get previousBoardEntity;

  $PuzzleEntityCopyWith<PuzzleEntity> get copyWith;
}

abstract class $PuzzleEntityCopyWith<$Res> {
  factory $PuzzleEntityCopyWith(
          PuzzleEntity value, $Res Function(PuzzleEntity) then) =
      _$PuzzleEntityCopyWithImpl<$Res>;
  $Res call(
      {int score,
      bool isGameOver,
      BoardEntity boardEntity,
      BoardEntity previousBoardEntity});

  $BoardEntityCopyWith<$Res> get boardEntity;
  $BoardEntityCopyWith<$Res> get previousBoardEntity;
}

class _$PuzzleEntityCopyWithImpl<$Res> implements $PuzzleEntityCopyWith<$Res> {
  _$PuzzleEntityCopyWithImpl(this._value, this._then);

  final PuzzleEntity _value;
  // ignore: unused_field
  final $Res Function(PuzzleEntity) _then;

  @override
  $Res call({
    Object score = freezed,
    Object isGameOver = freezed,
    Object boardEntity = freezed,
    Object previousBoardEntity = freezed,
  }) {
    return _then(_value.copyWith(
      score: score == freezed ? _value.score : score as int,
      isGameOver:
          isGameOver == freezed ? _value.isGameOver : isGameOver as bool,
      boardEntity: boardEntity == freezed
          ? _value.boardEntity
          : boardEntity as BoardEntity,
      previousBoardEntity: previousBoardEntity == freezed
          ? _value.previousBoardEntity
          : previousBoardEntity as BoardEntity,
    ));
  }

  @override
  $BoardEntityCopyWith<$Res> get boardEntity {
    if (_value.boardEntity == null) {
      return null;
    }
    return $BoardEntityCopyWith<$Res>(_value.boardEntity, (value) {
      return _then(_value.copyWith(boardEntity: value));
    });
  }

  @override
  $BoardEntityCopyWith<$Res> get previousBoardEntity {
    if (_value.previousBoardEntity == null) {
      return null;
    }
    return $BoardEntityCopyWith<$Res>(_value.previousBoardEntity, (value) {
      return _then(_value.copyWith(previousBoardEntity: value));
    });
  }
}

abstract class _$PuzzleEntityCopyWith<$Res>
    implements $PuzzleEntityCopyWith<$Res> {
  factory _$PuzzleEntityCopyWith(
          _PuzzleEntity value, $Res Function(_PuzzleEntity) then) =
      __$PuzzleEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int score,
      bool isGameOver,
      BoardEntity boardEntity,
      BoardEntity previousBoardEntity});

  @override
  $BoardEntityCopyWith<$Res> get boardEntity;
  @override
  $BoardEntityCopyWith<$Res> get previousBoardEntity;
}

class __$PuzzleEntityCopyWithImpl<$Res> extends _$PuzzleEntityCopyWithImpl<$Res>
    implements _$PuzzleEntityCopyWith<$Res> {
  __$PuzzleEntityCopyWithImpl(
      _PuzzleEntity _value, $Res Function(_PuzzleEntity) _then)
      : super(_value, (v) => _then(v as _PuzzleEntity));

  @override
  _PuzzleEntity get _value => super._value as _PuzzleEntity;

  @override
  $Res call({
    Object score = freezed,
    Object isGameOver = freezed,
    Object boardEntity = freezed,
    Object previousBoardEntity = freezed,
  }) {
    return _then(_PuzzleEntity(
      score: score == freezed ? _value.score : score as int,
      isGameOver:
          isGameOver == freezed ? _value.isGameOver : isGameOver as bool,
      boardEntity: boardEntity == freezed
          ? _value.boardEntity
          : boardEntity as BoardEntity,
      previousBoardEntity: previousBoardEntity == freezed
          ? _value.previousBoardEntity
          : previousBoardEntity as BoardEntity,
    ));
  }
}

class _$_PuzzleEntity extends _PuzzleEntity {
  const _$_PuzzleEntity(
      {@required this.score,
      @required this.isGameOver,
      @required this.boardEntity,
      this.previousBoardEntity})
      : assert(score != null),
        assert(isGameOver != null),
        assert(boardEntity != null),
        super._();

  @override
  final int score;
  @override
  final bool isGameOver;
  @override
  final BoardEntity boardEntity;
  @override
  final BoardEntity previousBoardEntity;

  @override
  String toString() {
    return 'PuzzleEntity(score: $score, isGameOver: $isGameOver, boardEntity: $boardEntity, previousBoardEntity: $previousBoardEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PuzzleEntity &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.isGameOver, isGameOver) ||
                const DeepCollectionEquality()
                    .equals(other.isGameOver, isGameOver)) &&
            (identical(other.boardEntity, boardEntity) ||
                const DeepCollectionEquality()
                    .equals(other.boardEntity, boardEntity)) &&
            (identical(other.previousBoardEntity, previousBoardEntity) ||
                const DeepCollectionEquality()
                    .equals(other.previousBoardEntity, previousBoardEntity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(isGameOver) ^
      const DeepCollectionEquality().hash(boardEntity) ^
      const DeepCollectionEquality().hash(previousBoardEntity);

  @override
  _$PuzzleEntityCopyWith<_PuzzleEntity> get copyWith =>
      __$PuzzleEntityCopyWithImpl<_PuzzleEntity>(this, _$identity);
}

abstract class _PuzzleEntity extends PuzzleEntity {
  const _PuzzleEntity._() : super._();
  const factory _PuzzleEntity(
      {@required int score,
      @required bool isGameOver,
      @required BoardEntity boardEntity,
      BoardEntity previousBoardEntity}) = _$_PuzzleEntity;

  @override
  int get score;
  @override
  bool get isGameOver;
  @override
  BoardEntity get boardEntity;
  @override
  BoardEntity get previousBoardEntity;
  @override
  _$PuzzleEntityCopyWith<_PuzzleEntity> get copyWith;
}
