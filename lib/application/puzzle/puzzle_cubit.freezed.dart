// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'puzzle_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PuzzleStateTearOff {
  const _$PuzzleStateTearOff();

// ignore: unused_element
  _PuzzleState call(
      {@required BoardSize boardSize,
      @required Board mainBoard,
      @required Board mergeOnlyBoard,
      dynamic isGameOver = false,
      @required Option<Board> previousBoard,
      dynamic slidable = true,
      @required BoardScore score}) {
    return _PuzzleState(
      boardSize: boardSize,
      mainBoard: mainBoard,
      mergeOnlyBoard: mergeOnlyBoard,
      isGameOver: isGameOver,
      previousBoard: previousBoard,
      slidable: slidable,
      score: score,
    );
  }
}

// ignore: unused_element
const $PuzzleState = _$PuzzleStateTearOff();

mixin _$PuzzleState {
  BoardSize get boardSize;
  Board get mainBoard;
  Board get mergeOnlyBoard;
  dynamic get isGameOver;
  Option<Board> get previousBoard;
  dynamic get slidable;
  BoardScore get score;

  $PuzzleStateCopyWith<PuzzleState> get copyWith;
}

abstract class $PuzzleStateCopyWith<$Res> {
  factory $PuzzleStateCopyWith(
          PuzzleState value, $Res Function(PuzzleState) then) =
      _$PuzzleStateCopyWithImpl<$Res>;
  $Res call(
      {BoardSize boardSize,
      Board mainBoard,
      Board mergeOnlyBoard,
      dynamic isGameOver,
      Option<Board> previousBoard,
      dynamic slidable,
      BoardScore score});

  $BoardCopyWith<$Res> get mainBoard;
  $BoardCopyWith<$Res> get mergeOnlyBoard;
}

class _$PuzzleStateCopyWithImpl<$Res> implements $PuzzleStateCopyWith<$Res> {
  _$PuzzleStateCopyWithImpl(this._value, this._then);

  final PuzzleState _value;
  // ignore: unused_field
  final $Res Function(PuzzleState) _then;

  @override
  $Res call({
    Object boardSize = freezed,
    Object mainBoard = freezed,
    Object mergeOnlyBoard = freezed,
    Object isGameOver = freezed,
    Object previousBoard = freezed,
    Object slidable = freezed,
    Object score = freezed,
  }) {
    return _then(_value.copyWith(
      boardSize:
          boardSize == freezed ? _value.boardSize : boardSize as BoardSize,
      mainBoard: mainBoard == freezed ? _value.mainBoard : mainBoard as Board,
      mergeOnlyBoard: mergeOnlyBoard == freezed
          ? _value.mergeOnlyBoard
          : mergeOnlyBoard as Board,
      isGameOver:
          isGameOver == freezed ? _value.isGameOver : isGameOver as dynamic,
      previousBoard: previousBoard == freezed
          ? _value.previousBoard
          : previousBoard as Option<Board>,
      slidable: slidable == freezed ? _value.slidable : slidable as dynamic,
      score: score == freezed ? _value.score : score as BoardScore,
    ));
  }

  @override
  $BoardCopyWith<$Res> get mainBoard {
    if (_value.mainBoard == null) {
      return null;
    }
    return $BoardCopyWith<$Res>(_value.mainBoard, (value) {
      return _then(_value.copyWith(mainBoard: value));
    });
  }

  @override
  $BoardCopyWith<$Res> get mergeOnlyBoard {
    if (_value.mergeOnlyBoard == null) {
      return null;
    }
    return $BoardCopyWith<$Res>(_value.mergeOnlyBoard, (value) {
      return _then(_value.copyWith(mergeOnlyBoard: value));
    });
  }
}

abstract class _$PuzzleStateCopyWith<$Res>
    implements $PuzzleStateCopyWith<$Res> {
  factory _$PuzzleStateCopyWith(
          _PuzzleState value, $Res Function(_PuzzleState) then) =
      __$PuzzleStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {BoardSize boardSize,
      Board mainBoard,
      Board mergeOnlyBoard,
      dynamic isGameOver,
      Option<Board> previousBoard,
      dynamic slidable,
      BoardScore score});

  @override
  $BoardCopyWith<$Res> get mainBoard;
  @override
  $BoardCopyWith<$Res> get mergeOnlyBoard;
}

class __$PuzzleStateCopyWithImpl<$Res> extends _$PuzzleStateCopyWithImpl<$Res>
    implements _$PuzzleStateCopyWith<$Res> {
  __$PuzzleStateCopyWithImpl(
      _PuzzleState _value, $Res Function(_PuzzleState) _then)
      : super(_value, (v) => _then(v as _PuzzleState));

  @override
  _PuzzleState get _value => super._value as _PuzzleState;

  @override
  $Res call({
    Object boardSize = freezed,
    Object mainBoard = freezed,
    Object mergeOnlyBoard = freezed,
    Object isGameOver = freezed,
    Object previousBoard = freezed,
    Object slidable = freezed,
    Object score = freezed,
  }) {
    return _then(_PuzzleState(
      boardSize:
          boardSize == freezed ? _value.boardSize : boardSize as BoardSize,
      mainBoard: mainBoard == freezed ? _value.mainBoard : mainBoard as Board,
      mergeOnlyBoard: mergeOnlyBoard == freezed
          ? _value.mergeOnlyBoard
          : mergeOnlyBoard as Board,
      isGameOver: isGameOver == freezed ? _value.isGameOver : isGameOver,
      previousBoard: previousBoard == freezed
          ? _value.previousBoard
          : previousBoard as Option<Board>,
      slidable: slidable == freezed ? _value.slidable : slidable,
      score: score == freezed ? _value.score : score as BoardScore,
    ));
  }
}

class _$_PuzzleState with DiagnosticableTreeMixin implements _PuzzleState {
  const _$_PuzzleState(
      {@required this.boardSize,
      @required this.mainBoard,
      @required this.mergeOnlyBoard,
      this.isGameOver = false,
      @required this.previousBoard,
      this.slidable = true,
      @required this.score})
      : assert(boardSize != null),
        assert(mainBoard != null),
        assert(mergeOnlyBoard != null),
        assert(isGameOver != null),
        assert(previousBoard != null),
        assert(slidable != null),
        assert(score != null);

  @override
  final BoardSize boardSize;
  @override
  final Board mainBoard;
  @override
  final Board mergeOnlyBoard;
  @JsonKey(defaultValue: false)
  @override
  final dynamic isGameOver;
  @override
  final Option<Board> previousBoard;
  @JsonKey(defaultValue: true)
  @override
  final dynamic slidable;
  @override
  final BoardScore score;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PuzzleState(boardSize: $boardSize, mainBoard: $mainBoard, mergeOnlyBoard: $mergeOnlyBoard, isGameOver: $isGameOver, previousBoard: $previousBoard, slidable: $slidable, score: $score)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PuzzleState'))
      ..add(DiagnosticsProperty('boardSize', boardSize))
      ..add(DiagnosticsProperty('mainBoard', mainBoard))
      ..add(DiagnosticsProperty('mergeOnlyBoard', mergeOnlyBoard))
      ..add(DiagnosticsProperty('isGameOver', isGameOver))
      ..add(DiagnosticsProperty('previousBoard', previousBoard))
      ..add(DiagnosticsProperty('slidable', slidable))
      ..add(DiagnosticsProperty('score', score));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PuzzleState &&
            (identical(other.boardSize, boardSize) ||
                const DeepCollectionEquality()
                    .equals(other.boardSize, boardSize)) &&
            (identical(other.mainBoard, mainBoard) ||
                const DeepCollectionEquality()
                    .equals(other.mainBoard, mainBoard)) &&
            (identical(other.mergeOnlyBoard, mergeOnlyBoard) ||
                const DeepCollectionEquality()
                    .equals(other.mergeOnlyBoard, mergeOnlyBoard)) &&
            (identical(other.isGameOver, isGameOver) ||
                const DeepCollectionEquality()
                    .equals(other.isGameOver, isGameOver)) &&
            (identical(other.previousBoard, previousBoard) ||
                const DeepCollectionEquality()
                    .equals(other.previousBoard, previousBoard)) &&
            (identical(other.slidable, slidable) ||
                const DeepCollectionEquality()
                    .equals(other.slidable, slidable)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(boardSize) ^
      const DeepCollectionEquality().hash(mainBoard) ^
      const DeepCollectionEquality().hash(mergeOnlyBoard) ^
      const DeepCollectionEquality().hash(isGameOver) ^
      const DeepCollectionEquality().hash(previousBoard) ^
      const DeepCollectionEquality().hash(slidable) ^
      const DeepCollectionEquality().hash(score);

  @override
  _$PuzzleStateCopyWith<_PuzzleState> get copyWith =>
      __$PuzzleStateCopyWithImpl<_PuzzleState>(this, _$identity);
}

abstract class _PuzzleState implements PuzzleState {
  const factory _PuzzleState(
      {@required BoardSize boardSize,
      @required Board mainBoard,
      @required Board mergeOnlyBoard,
      dynamic isGameOver,
      @required Option<Board> previousBoard,
      dynamic slidable,
      @required BoardScore score}) = _$_PuzzleState;

  @override
  BoardSize get boardSize;
  @override
  Board get mainBoard;
  @override
  Board get mergeOnlyBoard;
  @override
  dynamic get isGameOver;
  @override
  Option<Board> get previousBoard;
  @override
  dynamic get slidable;
  @override
  BoardScore get score;
  @override
  _$PuzzleStateCopyWith<_PuzzleState> get copyWith;
}
