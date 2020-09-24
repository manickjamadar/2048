// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'theme_color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeColorTearOff {
  const _$ThemeColorTearOff();

// ignore: unused_element
  _ThemeColor call({@required Color first, @required Color second}) {
    return _ThemeColor(
      first: first,
      second: second,
    );
  }
}

// ignore: unused_element
const $ThemeColor = _$ThemeColorTearOff();

mixin _$ThemeColor {
  Color get first;
  Color get second;

  $ThemeColorCopyWith<ThemeColor> get copyWith;
}

abstract class $ThemeColorCopyWith<$Res> {
  factory $ThemeColorCopyWith(
          ThemeColor value, $Res Function(ThemeColor) then) =
      _$ThemeColorCopyWithImpl<$Res>;
  $Res call({Color first, Color second});
}

class _$ThemeColorCopyWithImpl<$Res> implements $ThemeColorCopyWith<$Res> {
  _$ThemeColorCopyWithImpl(this._value, this._then);

  final ThemeColor _value;
  // ignore: unused_field
  final $Res Function(ThemeColor) _then;

  @override
  $Res call({
    Object first = freezed,
    Object second = freezed,
  }) {
    return _then(_value.copyWith(
      first: first == freezed ? _value.first : first as Color,
      second: second == freezed ? _value.second : second as Color,
    ));
  }
}

abstract class _$ThemeColorCopyWith<$Res> implements $ThemeColorCopyWith<$Res> {
  factory _$ThemeColorCopyWith(
          _ThemeColor value, $Res Function(_ThemeColor) then) =
      __$ThemeColorCopyWithImpl<$Res>;
  @override
  $Res call({Color first, Color second});
}

class __$ThemeColorCopyWithImpl<$Res> extends _$ThemeColorCopyWithImpl<$Res>
    implements _$ThemeColorCopyWith<$Res> {
  __$ThemeColorCopyWithImpl(
      _ThemeColor _value, $Res Function(_ThemeColor) _then)
      : super(_value, (v) => _then(v as _ThemeColor));

  @override
  _ThemeColor get _value => super._value as _ThemeColor;

  @override
  $Res call({
    Object first = freezed,
    Object second = freezed,
  }) {
    return _then(_ThemeColor(
      first: first == freezed ? _value.first : first as Color,
      second: second == freezed ? _value.second : second as Color,
    ));
  }
}

class _$_ThemeColor implements _ThemeColor {
  const _$_ThemeColor({@required this.first, @required this.second})
      : assert(first != null),
        assert(second != null);

  @override
  final Color first;
  @override
  final Color second;

  @override
  String toString() {
    return 'ThemeColor(first: $first, second: $second)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeColor &&
            (identical(other.first, first) ||
                const DeepCollectionEquality().equals(other.first, first)) &&
            (identical(other.second, second) ||
                const DeepCollectionEquality().equals(other.second, second)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(first) ^
      const DeepCollectionEquality().hash(second);

  @override
  _$ThemeColorCopyWith<_ThemeColor> get copyWith =>
      __$ThemeColorCopyWithImpl<_ThemeColor>(this, _$identity);
}

abstract class _ThemeColor implements ThemeColor {
  const factory _ThemeColor({@required Color first, @required Color second}) =
      _$_ThemeColor;

  @override
  Color get first;
  @override
  Color get second;
  @override
  _$ThemeColorCopyWith<_ThemeColor> get copyWith;
}
