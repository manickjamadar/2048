// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'board_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BoardOptionTearOff {
  const _$BoardOptionTearOff();

// ignore: unused_element
  _BoardOption call({@required String title, @required BoardSize size}) {
    return _BoardOption(
      title: title,
      size: size,
    );
  }
}

// ignore: unused_element
const $BoardOption = _$BoardOptionTearOff();

mixin _$BoardOption {
  String get title;
  BoardSize get size;

  $BoardOptionCopyWith<BoardOption> get copyWith;
}

abstract class $BoardOptionCopyWith<$Res> {
  factory $BoardOptionCopyWith(
          BoardOption value, $Res Function(BoardOption) then) =
      _$BoardOptionCopyWithImpl<$Res>;
  $Res call({String title, BoardSize size});
}

class _$BoardOptionCopyWithImpl<$Res> implements $BoardOptionCopyWith<$Res> {
  _$BoardOptionCopyWithImpl(this._value, this._then);

  final BoardOption _value;
  // ignore: unused_field
  final $Res Function(BoardOption) _then;

  @override
  $Res call({
    Object title = freezed,
    Object size = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      size: size == freezed ? _value.size : size as BoardSize,
    ));
  }
}

abstract class _$BoardOptionCopyWith<$Res>
    implements $BoardOptionCopyWith<$Res> {
  factory _$BoardOptionCopyWith(
          _BoardOption value, $Res Function(_BoardOption) then) =
      __$BoardOptionCopyWithImpl<$Res>;
  @override
  $Res call({String title, BoardSize size});
}

class __$BoardOptionCopyWithImpl<$Res> extends _$BoardOptionCopyWithImpl<$Res>
    implements _$BoardOptionCopyWith<$Res> {
  __$BoardOptionCopyWithImpl(
      _BoardOption _value, $Res Function(_BoardOption) _then)
      : super(_value, (v) => _then(v as _BoardOption));

  @override
  _BoardOption get _value => super._value as _BoardOption;

  @override
  $Res call({
    Object title = freezed,
    Object size = freezed,
  }) {
    return _then(_BoardOption(
      title: title == freezed ? _value.title : title as String,
      size: size == freezed ? _value.size : size as BoardSize,
    ));
  }
}

class _$_BoardOption implements _BoardOption {
  const _$_BoardOption({@required this.title, @required this.size})
      : assert(title != null),
        assert(size != null);

  @override
  final String title;
  @override
  final BoardSize size;

  @override
  String toString() {
    return 'BoardOption(title: $title, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BoardOption &&
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
  _$BoardOptionCopyWith<_BoardOption> get copyWith =>
      __$BoardOptionCopyWithImpl<_BoardOption>(this, _$identity);
}

abstract class _BoardOption implements BoardOption {
  const factory _BoardOption(
      {@required String title, @required BoardSize size}) = _$_BoardOption;

  @override
  String get title;
  @override
  BoardSize get size;
  @override
  _$BoardOptionCopyWith<_BoardOption> get copyWith;
}
