part of 'puzzle_cubit.dart';

@freezed
abstract class PuzzleState implements _$PuzzleState {
  const PuzzleState._();
  const factory PuzzleState({
    @required BoardSize boardSize,
    @required Board mainBoard,
    @required Board mergeOnlyBoard,
    @Default(false) isGameOver,
    @required Option<Board> previousBoard,
    @Default(BoardScore(0)) BoardScore previousScore,
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
  factory PuzzleState.fromModel(Puzzle puzzle) {
    return PuzzleState(
      boardSize: puzzle.board.size,
      mainBoard: puzzle.board,
      mergeOnlyBoard: Board.empty(puzzle.board.size),
      previousBoard: puzzle.previousBoard,
      score: puzzle.score,
      isGameOver: puzzle.isGameOver,
      slidable: true,
      previousScore: puzzle.previousScore,
    );
  }

  Puzzle toModel() {
    return Puzzle(
        board: mainBoard,
        isGameOver: isGameOver,
        previousBoard: previousBoard,
        score: score,
        previousScore: previousScore);
  }
}
