// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'board_option_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BoardOptionEntity _$BoardOptionEntityFromJson(Map<String, dynamic> json) {
  return _BoardOptionEntity.fromJson(json);
}

class _$BoardOptionEntityTearOff {
  const _$BoardOptionEntityTearOff();

// ignore: unused_element
  _BoardOptionEntity call({@required String title, @required int size}) {
    return _BoardOptionEntity(
      title: title,
      size: size,
    );
  }
}

// ignore: unused_element
const $BoardOptionEntity = _$BoardOptionEntityTearOff();

mixin _$BoardOptionEntity {
  String get title;
  int get size;

  Map<String, dynamic> toJson();
  $BoardOptionEntityCopyWith<BoardOptionEntity> get copyWith;
}

abstract class $BoardOptionEntityCopyWith<$Res> {
  factory $BoardOptionEntityCopyWith(
          BoardOptionEntity value, $Res Function(BoardOptionEntity) then) =
      _$BoardOptionEntityCopyWithImpl<$Res>;
  $Res call({String title, int size});
}

class _$BoardOptionEntityCopyWithImpl<$Res>
    implements $BoardOptionEntityCopyWith<$Res> {
  _$BoardOptionEntityCopyWithImpl(this._value, this._then);

  final BoardOptionEntity _value;
  // ignore: unused_field
  final $Res Function(BoardOptionEntity) _then;

  @override
  $Res call({
    Object title = freezed,
    Object size = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      size: size == freezed ? _value.size : size as int,
    ));
  }
}

abstract class _$BoardOptionEntityCopyWith<$Res>
    implements $BoardOptionEntityCopyWith<$Res> {
  factory _$BoardOptionEntityCopyWith(
          _BoardOptionEntity value, $Res Function(_BoardOptionEntity) then) =
      __$BoardOptionEntityCopyWithImpl<$Res>;
  @override
  $Res call({String title, int size});
}

class __$BoardOptionEntityCopyWithImpl<$Res>
    extends _$BoardOptionEntityCopyWithImpl<$Res>
    implements _$BoardOptionEntityCopyWith<$Res> {
  __$BoardOptionEntityCopyWithImpl(
      _BoardOptionEntity _value, $Res Function(_BoardOptionEntity) _then)
      : super(_value, (v) => _then(v as _BoardOptionEntity));

  @override
  _BoardOptionEntity get _value => super._value as _BoardOptionEntity;

  @override
  $Res call({
    Object title = freezed,
    Object size = freezed,
  }) {
    return _then(_BoardOptionEntity(
      title: title == freezed ? _value.title : title as String,
      size: size == freezed ? _value.size : size as int,
    ));
  }
}

@JsonSerializable()
class _$_BoardOptionEntity extends _BoardOptionEntity {
  const _$_BoardOptionEntity({@required this.title, @required this.size})
      : assert(title != null),
        assert(size != null),
        super._();

  factory _$_BoardOptionEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_BoardOptionEntityFromJson(json);

  @override
  final String title;
  @override
  final int size;

  @override
  String toString() {
    return 'BoardOptionEntity(title: $title, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BoardOptionEntity &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(size);

  @override
  _$BoardOptionEntityCopyWith<_BoardOptionEntity> get copyWith =>
      __$BoardOptionEntityCopyWithImpl<_BoardOptionEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BoardOptionEntityToJson(this);
  }
}

abstract class _BoardOptionEntity extends BoardOptionEntity {
  const _BoardOptionEntity._() : super._();
  const factory _BoardOptionEntity(
      {@required String title, @required int size}) = _$_BoardOptionEntity;

  factory _BoardOptionEntity.fromJson(Map<String, dynamic> json) =
      _$_BoardOptionEntity.fromJson;

  @override
  String get title;
  @override
  int get size;
  @override
  _$BoardOptionEntityCopyWith<_BoardOptionEntity> get copyWith;
}
