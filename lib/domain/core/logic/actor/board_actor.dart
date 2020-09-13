import 'package:twozerofoureight/domain/core/logic/actor/actor.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';

/// Board actor responsible for acting on board and return modified board
abstract class BoardActor extends Actor<Board> {
  final Board board;
  const BoardActor(this.board) : super(board);
  Board act();
}
