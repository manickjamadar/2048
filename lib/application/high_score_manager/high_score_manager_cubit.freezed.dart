// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'high_score_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HighScoreManagerStateTearOff {
  const _$HighScoreManagerStateTearOff();

// ignore: unused_element
  _HighScoreManagerState call({@required BoardScore score}) {
    return _HighScoreManagerState(
      score: score,
    );
  }
}

// ignore: unused_element
const $HighScoreManagerState = _$HighScoreManagerStateTearOff();

mixin _$HighScoreManagerState {
  BoardScore get score;

  $HighScoreManagerStateCopyWith<HighScoreManagerState> get copyWith;
}

abstract class $HighScoreManagerStateCopyWith<$Res> {
  factory $HighScoreManagerStateCopyWith(HighScoreManagerState value,
          $Res Function(HighScoreManagerState) then) =
      _$HighScoreManagerStateCopyWithImpl<$Res>;
  $Res call({BoardScore score});
}

class _$HighScoreManagerStateCopyWithImpl<$Res>
    implements $HighScoreManagerStateCopyWith<$Res> {
  _$HighScoreManagerStateCopyWithImpl(this._value, this._then);

  final HighScoreManagerState _value;
  // ignore: unused_field
  final $Res Function(HighScoreManagerState) _then;

  @override
  $Res call({
    Object score = freezed,
  }) {
    return _then(_value.copyWith(
      score: score == freezed ? _value.score : score as BoardScore,
    ));
  }
}

abstract class _$HighScoreManagerStateCopyWith<$Res>
    implements $HighScoreManagerStateCopyWith<$Res> {
  factory _$HighScoreManagerStateCopyWith(_HighScoreManagerState value,
          $Res Function(_HighScoreManagerState) then) =
      __$HighScoreManagerStateCopyWithImpl<$Res>;
  @override
  $Res call({BoardScore score});
}

class __$HighScoreManagerStateCopyWithImpl<$Res>
    extends _$HighScoreManagerStateCopyWithImpl<$Res>
    implements _$HighScoreManagerStateCopyWith<$Res> {
  __$HighScoreManagerStateCopyWithImpl(_HighScoreManagerState _value,
      $Res Function(_HighScoreManagerState) _then)
      : super(_value, (v) => _then(v as _HighScoreManagerState));

  @override
  _HighScoreManagerState get _value => super._value as _HighScoreManagerState;

  @override
  $Res call({
    Object score = freezed,
  }) {
    return _then(_HighScoreManagerState(
      score: score == freezed ? _value.score : score as BoardScore,
    ));
  }
}

class _$_HighScoreManagerState implements _HighScoreManagerState {
  const _$_HighScoreManagerState({@required this.score})
      : assert(score != null);

  @override
  final BoardScore score;

  @override
  String toString() {
    return 'HighScoreManagerState(score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HighScoreManagerState &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(score);

  @override
  _$HighScoreManagerStateCopyWith<_HighScoreManagerState> get copyWith =>
      __$HighScoreManagerStateCopyWithImpl<_HighScoreManagerState>(
          this, _$identity);
}

abstract class _HighScoreManagerState implements HighScoreManagerState {
  const factory _HighScoreManagerState({@required BoardScore score}) =
      _$_HighScoreManagerState;

  @override
  BoardScore get score;
  @override
  _$HighScoreManagerStateCopyWith<_HighScoreManagerState> get copyWith;
}
