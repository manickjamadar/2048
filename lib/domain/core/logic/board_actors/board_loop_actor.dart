import 'package:flutter/foundation.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/actor/board_actor.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/get_blocks_size.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';

///Board Loop actor used for looping boards all lines in specified direction and modify the board with specified board actor
class BoardLoopActor extends BoardActor {
  final BoardDirection direction;
  final BoardActor Function(Board newBoard, BlockIndex startIndex) actor;

  const BoardLoopActor(Board board,
      {@required this.direction, @required this.actor})
      : super(board);

  @override
  Board act() {
    if (!board.isValid) {
      return board;
    }
    final blocks = board.blocks;
    final size = getBlocksSize(blocks).fold(() => null, (a) => a);
    BlockIndex loopStartIndex = BlockIndex(
        size: size,
        value: direction.when(
          right: () => size.value - 1,
          left: () => 0,
          down: () => size.value * (size.value - 1),
          up: () => 0,
        ));
    final BoardDirection loopNextDirection = direction.when(
      right: () => BoardDirection.down(),
      left: () => BoardDirection.down(),
      down: () => BoardDirection.right(),
      up: () => BoardDirection.right(),
    );
    List<Block> newBlocks = [...blocks];
    while (true) {
      newBlocks = ActionRunner(actor(Board(blocks: newBlocks), loopStartIndex))
          .run()
          .blocks;
      if (loopStartIndex.hasNext(loopNextDirection)) {
        loopStartIndex = loopStartIndex.next(loopNextDirection);
      } else {
        break;
      }
    }

    return Board(blocks: newBlocks);
  }
}
