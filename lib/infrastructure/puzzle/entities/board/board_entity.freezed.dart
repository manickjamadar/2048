// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'board_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BoardEntity _$BoardEntityFromJson(Map<String, dynamic> json) {
  return _BoardEntity.fromJson(json);
}

class _$BoardEntityTearOff {
  const _$BoardEntityTearOff();

// ignore: unused_element
  _BoardEntity call({@required List<int> points, @required int size}) {
    return _BoardEntity(
      points: points,
      size: size,
    );
  }
}

// ignore: unused_element
const $BoardEntity = _$BoardEntityTearOff();

mixin _$BoardEntity {
  List<int> get points;
  int get size;

  Map<String, dynamic> toJson();
  $BoardEntityCopyWith<BoardEntity> get copyWith;
}

abstract class $BoardEntityCopyWith<$Res> {
  factory $BoardEntityCopyWith(
          BoardEntity value, $Res Function(BoardEntity) then) =
      _$BoardEntityCopyWithImpl<$Res>;
  $Res call({List<int> points, int size});
}

class _$BoardEntityCopyWithImpl<$Res> implements $BoardEntityCopyWith<$Res> {
  _$BoardEntityCopyWithImpl(this._value, this._then);

  final BoardEntity _value;
  // ignore: unused_field
  final $Res Function(BoardEntity) _then;

  @override
  $Res call({
    Object points = freezed,
    Object size = freezed,
  }) {
    return _then(_value.copyWith(
      points: points == freezed ? _value.points : points as List<int>,
      size: size == freezed ? _value.size : size as int,
    ));
  }
}

abstract class _$BoardEntityCopyWith<$Res>
    implements $BoardEntityCopyWith<$Res> {
  factory _$BoardEntityCopyWith(
          _BoardEntity value, $Res Function(_BoardEntity) then) =
      __$BoardEntityCopyWithImpl<$Res>;
  @override
  $Res call({List<int> points, int size});
}

class __$BoardEntityCopyWithImpl<$Res> extends _$BoardEntityCopyWithImpl<$Res>
    implements _$BoardEntityCopyWith<$Res> {
  __$BoardEntityCopyWithImpl(
      _BoardEntity _value, $Res Function(_BoardEntity) _then)
      : super(_value, (v) => _then(v as _BoardEntity));

  @override
  _BoardEntity get _value => super._value as _BoardEntity;

  @override
  $Res call({
    Object points = freezed,
    Object size = freezed,
  }) {
    return _then(_BoardEntity(
      points: points == freezed ? _value.points : points as List<int>,
      size: size == freezed ? _value.size : size as int,
    ));
  }
}

@JsonSerializable()
class _$_BoardEntity extends _BoardEntity {
  const _$_BoardEntity({@required this.points, @required this.size})
      : assert(points != null),
        assert(size != null),
        super._();

  factory _$_BoardEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_BoardEntityFromJson(json);

  @override
  final List<int> points;
  @override
  final int size;

  @override
  String toString() {
    return 'BoardEntity(points: $points, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BoardEntity &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(points) ^
      const DeepCollectionEquality().hash(size);

  @override
  _$BoardEntityCopyWith<_BoardEntity> get copyWith =>
      __$BoardEntityCopyWithImpl<_BoardEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BoardEntityToJson(this);
  }
}

abstract class _BoardEntity extends BoardEntity {
  const _BoardEntity._() : super._();
  const factory _BoardEntity({@required List<int> points, @required int size}) =
      _$_BoardEntity;

  factory _BoardEntity.fromJson(Map<String, dynamic> json) =
      _$_BoardEntity.fromJson;

  @override
  List<int> get points;
  @override
  int get size;
  @override
  _$BoardEntityCopyWith<_BoardEntity> get copyWith;
}
