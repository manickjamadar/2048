part of 'puzzle_cubit.dart';

@freezed
abstract class PuzzleState with _$PuzzleState {
  const factory PuzzleState({
    @required BoardSize boardSize,
    @required Board mainBoard,
    @required Board mergeOnlyBoard,
    @Default(false) isGameOver,
    @required Option<Board> previousBoard,
    @Default(BoardScore(0)) previousScore,
    @Default(true) slidable,
    @required BoardScore score,
  }) = _PuzzleState;

  factory PuzzleState.initial() {
    final boardSize = BoardSize(3);
    return PuzzleState(
        boardSize: boardSize,
        mainBoard: Board.empty(boardSize),
        mergeOnlyBoard: Board.empty(boardSize),
        previousBoard: None(),
        score: BoardScore(0));
  }
}
