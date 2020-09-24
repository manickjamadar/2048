// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'theme_color_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeColorStateTearOff {
  const _$ThemeColorStateTearOff();

// ignore: unused_element
  _ThemeColorState call(
      {@required int currentIndex, @required List<ThemeColor> themeColors}) {
    return _ThemeColorState(
      currentIndex: currentIndex,
      themeColors: themeColors,
    );
  }
}

// ignore: unused_element
const $ThemeColorState = _$ThemeColorStateTearOff();

mixin _$ThemeColorState {
  int get currentIndex;
  List<ThemeColor> get themeColors;

  $ThemeColorStateCopyWith<ThemeColorState> get copyWith;
}

abstract class $ThemeColorStateCopyWith<$Res> {
  factory $ThemeColorStateCopyWith(
          ThemeColorState value, $Res Function(ThemeColorState) then) =
      _$ThemeColorStateCopyWithImpl<$Res>;
  $Res call({int currentIndex, List<ThemeColor> themeColors});
}

class _$ThemeColorStateCopyWithImpl<$Res>
    implements $ThemeColorStateCopyWith<$Res> {
  _$ThemeColorStateCopyWithImpl(this._value, this._then);

  final ThemeColorState _value;
  // ignore: unused_field
  final $Res Function(ThemeColorState) _then;

  @override
  $Res call({
    Object currentIndex = freezed,
    Object themeColors = freezed,
  }) {
    return _then(_value.copyWith(
      currentIndex:
          currentIndex == freezed ? _value.currentIndex : currentIndex as int,
      themeColors: themeColors == freezed
          ? _value.themeColors
          : themeColors as List<ThemeColor>,
    ));
  }
}

abstract class _$ThemeColorStateCopyWith<$Res>
    implements $ThemeColorStateCopyWith<$Res> {
  factory _$ThemeColorStateCopyWith(
          _ThemeColorState value, $Res Function(_ThemeColorState) then) =
      __$ThemeColorStateCopyWithImpl<$Res>;
  @override
  $Res call({int currentIndex, List<ThemeColor> themeColors});
}

class __$ThemeColorStateCopyWithImpl<$Res>
    extends _$ThemeColorStateCopyWithImpl<$Res>
    implements _$ThemeColorStateCopyWith<$Res> {
  __$ThemeColorStateCopyWithImpl(
      _ThemeColorState _value, $Res Function(_ThemeColorState) _then)
      : super(_value, (v) => _then(v as _ThemeColorState));

  @override
  _ThemeColorState get _value => super._value as _ThemeColorState;

  @override
  $Res call({
    Object currentIndex = freezed,
    Object themeColors = freezed,
  }) {
    return _then(_ThemeColorState(
      currentIndex:
          currentIndex == freezed ? _value.currentIndex : currentIndex as int,
      themeColors: themeColors == freezed
          ? _value.themeColors
          : themeColors as List<ThemeColor>,
    ));
  }
}

class _$_ThemeColorState extends _ThemeColorState {
  const _$_ThemeColorState(
      {@required this.currentIndex, @required this.themeColors})
      : assert(currentIndex != null),
        assert(themeColors != null),
        super._();

  @override
  final int currentIndex;
  @override
  final List<ThemeColor> themeColors;

  @override
  String toString() {
    return 'ThemeColorState(currentIndex: $currentIndex, themeColors: $themeColors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeColorState &&
            (identical(other.currentIndex, currentIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentIndex, currentIndex)) &&
            (identical(other.themeColors, themeColors) ||
                const DeepCollectionEquality()
                    .equals(other.themeColors, themeColors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentIndex) ^
      const DeepCollectionEquality().hash(themeColors);

  @override
  _$ThemeColorStateCopyWith<_ThemeColorState> get copyWith =>
      __$ThemeColorStateCopyWithImpl<_ThemeColorState>(this, _$identity);
}

abstract class _ThemeColorState extends ThemeColorState {
  const _ThemeColorState._() : super._();
  const factory _ThemeColorState(
      {@required int currentIndex,
      @required List<ThemeColor> themeColors}) = _$_ThemeColorState;

  @override
  int get currentIndex;
  @override
  List<ThemeColor> get themeColors;
  @override
  _$ThemeColorStateCopyWith<_ThemeColorState> get copyWith;
}
