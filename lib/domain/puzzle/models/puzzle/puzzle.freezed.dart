// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'puzzle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PuzzleTearOff {
  const _$PuzzleTearOff();

// ignore: unused_element
  _Puzzle call(
      {@required Board board,
      @required BoardScore score,
      @required Option<Board> previousBoard,
      @required bool isGameOver,
      @required BoardScore previousScore}) {
    return _Puzzle(
      board: board,
      score: score,
      previousBoard: previousBoard,
      isGameOver: isGameOver,
      previousScore: previousScore,
    );
  }
}

// ignore: unused_element
const $Puzzle = _$PuzzleTearOff();

mixin _$Puzzle {
  Board get board;
  BoardScore get score;
  Option<Board> get previousBoard;
  bool get isGameOver;
  BoardScore get previousScore;

  $PuzzleCopyWith<Puzzle> get copyWith;
}

abstract class $PuzzleCopyWith<$Res> {
  factory $PuzzleCopyWith(Puzzle value, $Res Function(Puzzle) then) =
      _$PuzzleCopyWithImpl<$Res>;
  $Res call(
      {Board board,
      BoardScore score,
      Option<Board> previousBoard,
      bool isGameOver,
      BoardScore previousScore});

  $BoardCopyWith<$Res> get board;
}

class _$PuzzleCopyWithImpl<$Res> implements $PuzzleCopyWith<$Res> {
  _$PuzzleCopyWithImpl(this._value, this._then);

  final Puzzle _value;
  // ignore: unused_field
  final $Res Function(Puzzle) _then;

  @override
  $Res call({
    Object board = freezed,
    Object score = freezed,
    Object previousBoard = freezed,
    Object isGameOver = freezed,
    Object previousScore = freezed,
  }) {
    return _then(_value.copyWith(
      board: board == freezed ? _value.board : board as Board,
      score: score == freezed ? _value.score : score as BoardScore,
      previousBoard: previousBoard == freezed
          ? _value.previousBoard
          : previousBoard as Option<Board>,
      isGameOver:
          isGameOver == freezed ? _value.isGameOver : isGameOver as bool,
      previousScore: previousScore == freezed
          ? _value.previousScore
          : previousScore as BoardScore,
    ));
  }

  @override
  $BoardCopyWith<$Res> get board {
    if (_value.board == null) {
      return null;
    }
    return $BoardCopyWith<$Res>(_value.board, (value) {
      return _then(_value.copyWith(board: value));
    });
  }
}

abstract class _$PuzzleCopyWith<$Res> implements $PuzzleCopyWith<$Res> {
  factory _$PuzzleCopyWith(_Puzzle value, $Res Function(_Puzzle) then) =
      __$PuzzleCopyWithImpl<$Res>;
  @override
  $Res call(
      {Board board,
      BoardScore score,
      Option<Board> previousBoard,
      bool isGameOver,
      BoardScore previousScore});

  @override
  $BoardCopyWith<$Res> get board;
}

class __$PuzzleCopyWithImpl<$Res> extends _$PuzzleCopyWithImpl<$Res>
    implements _$PuzzleCopyWith<$Res> {
  __$PuzzleCopyWithImpl(_Puzzle _value, $Res Function(_Puzzle) _then)
      : super(_value, (v) => _then(v as _Puzzle));

  @override
  _Puzzle get _value => super._value as _Puzzle;

  @override
  $Res call({
    Object board = freezed,
    Object score = freezed,
    Object previousBoard = freezed,
    Object isGameOver = freezed,
    Object previousScore = freezed,
  }) {
    return _then(_Puzzle(
      board: board == freezed ? _value.board : board as Board,
      score: score == freezed ? _value.score : score as BoardScore,
      previousBoard: previousBoard == freezed
          ? _value.previousBoard
          : previousBoard as Option<Board>,
      isGameOver:
          isGameOver == freezed ? _value.isGameOver : isGameOver as bool,
      previousScore: previousScore == freezed
          ? _value.previousScore
          : previousScore as BoardScore,
    ));
  }
}

class _$_Puzzle implements _Puzzle {
  const _$_Puzzle(
      {@required this.board,
      @required this.score,
      @required this.previousBoard,
      @required this.isGameOver,
      @required this.previousScore})
      : assert(board != null),
        assert(score != null),
        assert(previousBoard != null),
        assert(isGameOver != null),
        assert(previousScore != null);

  @override
  final Board board;
  @override
  final BoardScore score;
  @override
  final Option<Board> previousBoard;
  @override
  final bool isGameOver;
  @override
  final BoardScore previousScore;

  @override
  String toString() {
    return 'Puzzle(board: $board, score: $score, previousBoard: $previousBoard, isGameOver: $isGameOver, previousScore: $previousScore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Puzzle &&
            (identical(other.board, board) ||
                const DeepCollectionEquality().equals(other.board, board)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.previousBoard, previousBoard) ||
                const DeepCollectionEquality()
                    .equals(other.previousBoard, previousBoard)) &&
            (identical(other.isGameOver, isGameOver) ||
                const DeepCollectionEquality()
                    .equals(other.isGameOver, isGameOver)) &&
            (identical(other.previousScore, previousScore) ||
                const DeepCollectionEquality()
                    .equals(other.previousScore, previousScore)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(previousBoard) ^
      const DeepCollectionEquality().hash(isGameOver) ^
      const DeepCollectionEquality().hash(previousScore);

  @override
  _$PuzzleCopyWith<_Puzzle> get copyWith =>
      __$PuzzleCopyWithImpl<_Puzzle>(this, _$identity);
}

abstract class _Puzzle implements Puzzle {
  const factory _Puzzle(
      {@required Board board,
      @required BoardScore score,
      @required Option<Board> previousBoard,
      @required bool isGameOver,
      @required BoardScore previousScore}) = _$_Puzzle;

  @override
  Board get board;
  @override
  BoardScore get score;
  @override
  Option<Board> get previousBoard;
  @override
  bool get isGameOver;
  @override
  BoardScore get previousScore;
  @override
  _$PuzzleCopyWith<_Puzzle> get copyWith;
}
