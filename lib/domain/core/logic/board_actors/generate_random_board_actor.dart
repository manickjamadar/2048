import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/actor/board_actor.dart';
import 'package:twozerofoureight/domain/core/logic/block_actors/generate_random_block_actor.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';

class GenerateRandomBoardActor extends BoardActor {
  final int count;
  const GenerateRandomBoardActor(Board board, {this.count = 1}) : super(board);

  @override
  Board act() {
    return Board(
        blocks:
            ActionRunner(GenerateRandomBlockActor(board.blocks, count: count))
                .run());
  }
}
