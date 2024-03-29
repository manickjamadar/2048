// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'board_option_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BoardOptionStateTearOff {
  const _$BoardOptionStateTearOff();

// ignore: unused_element
  _BoardOptionState call(
      {@required int currentOptionIndex,
      @required bool isLoading,
      @required List<BoardOption> options}) {
    return _BoardOptionState(
      currentOptionIndex: currentOptionIndex,
      isLoading: isLoading,
      options: options,
    );
  }
}

// ignore: unused_element
const $BoardOptionState = _$BoardOptionStateTearOff();

mixin _$BoardOptionState {
  int get currentOptionIndex;
  bool get isLoading;
  List<BoardOption> get options;

  $BoardOptionStateCopyWith<BoardOptionState> get copyWith;
}

abstract class $BoardOptionStateCopyWith<$Res> {
  factory $BoardOptionStateCopyWith(
          BoardOptionState value, $Res Function(BoardOptionState) then) =
      _$BoardOptionStateCopyWithImpl<$Res>;
  $Res call(
      {int currentOptionIndex, bool isLoading, List<BoardOption> options});
}

class _$BoardOptionStateCopyWithImpl<$Res>
    implements $BoardOptionStateCopyWith<$Res> {
  _$BoardOptionStateCopyWithImpl(this._value, this._then);

  final BoardOptionState _value;
  // ignore: unused_field
  final $Res Function(BoardOptionState) _then;

  @override
  $Res call({
    Object currentOptionIndex = freezed,
    Object isLoading = freezed,
    Object options = freezed,
  }) {
    return _then(_value.copyWith(
      currentOptionIndex: currentOptionIndex == freezed
          ? _value.currentOptionIndex
          : currentOptionIndex as int,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      options:
          options == freezed ? _value.options : options as List<BoardOption>,
    ));
  }
}

abstract class _$BoardOptionStateCopyWith<$Res>
    implements $BoardOptionStateCopyWith<$Res> {
  factory _$BoardOptionStateCopyWith(
          _BoardOptionState value, $Res Function(_BoardOptionState) then) =
      __$BoardOptionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int currentOptionIndex, bool isLoading, List<BoardOption> options});
}

class __$BoardOptionStateCopyWithImpl<$Res>
    extends _$BoardOptionStateCopyWithImpl<$Res>
    implements _$BoardOptionStateCopyWith<$Res> {
  __$BoardOptionStateCopyWithImpl(
      _BoardOptionState _value, $Res Function(_BoardOptionState) _then)
      : super(_value, (v) => _then(v as _BoardOptionState));

  @override
  _BoardOptionState get _value => super._value as _BoardOptionState;

  @override
  $Res call({
    Object currentOptionIndex = freezed,
    Object isLoading = freezed,
    Object options = freezed,
  }) {
    return _then(_BoardOptionState(
      currentOptionIndex: currentOptionIndex == freezed
          ? _value.currentOptionIndex
          : currentOptionIndex as int,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      options:
          options == freezed ? _value.options : options as List<BoardOption>,
    ));
  }
}

class _$_BoardOptionState extends _BoardOptionState {
  const _$_BoardOptionState(
      {@required this.currentOptionIndex,
      @required this.isLoading,
      @required this.options})
      : assert(currentOptionIndex != null),
        assert(isLoading != null),
        assert(options != null),
        super._();

  @override
  final int currentOptionIndex;
  @override
  final bool isLoading;
  @override
  final List<BoardOption> options;

  @override
  String toString() {
    return 'BoardOptionState(currentOptionIndex: $currentOptionIndex, isLoading: $isLoading, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BoardOptionState &&
            (identical(other.currentOptionIndex, currentOptionIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentOptionIndex, currentOptionIndex)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentOptionIndex) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(options);

  @override
  _$BoardOptionStateCopyWith<_BoardOptionState> get copyWith =>
      __$BoardOptionStateCopyWithImpl<_BoardOptionState>(this, _$identity);
}

abstract class _BoardOptionState extends BoardOptionState {
  const _BoardOptionState._() : super._();
  const factory _BoardOptionState(
      {@required int currentOptionIndex,
      @required bool isLoading,
      @required List<BoardOption> options}) = _$_BoardOptionState;

  @override
  int get currentOptionIndex;
  @override
  bool get isLoading;
  @override
  List<BoardOption> get options;
  @override
  _$BoardOptionStateCopyWith<_BoardOptionState> get copyWith;
}
