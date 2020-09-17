import 'package:flutter/foundation.dart';
import 'package:twozerofoureight/domain/core/logic/actor/board_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/core/value_objects/unique_id.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';

class LineMergeActor extends BoardActor {
  final BoardDirection direction;
  final BlockIndex startIndex;

  const LineMergeActor(Board board,
      {@required this.direction, @required this.startIndex})
      : super(board);
  @override
  Board act() {
    if (!board.isValid || startIndex.value >= board.size.totalSize) {
      return board;
    }
    final blocks = board.blocks;
    final size = board.size;
    final nextDirection = direction.opposite;
    final newBlocks = [...blocks];
    BlockIndex currentIndex = startIndex;
    while (true) {
      final currentBlock = newBlocks[currentIndex.value];

      if (!currentBlock.isEmpty &&
          currentBlock.isDetached(currentIndex.value)) {
        final actualPositionBlock = newBlocks[currentBlock.index.value];
        if (actualPositionBlock.isEmpty) {
          newBlocks[actualPositionBlock.index.value] = actualPositionBlock
              .copyWith(point: currentBlock.point, id: UniqueId());
          newBlocks[currentIndex.value] =
              Block.empty(index: currentIndex.value, boardSize: size.value);
        } else {
          if (actualPositionBlock.point.value == currentBlock.point.value) {
            newBlocks[actualPositionBlock.index.value] =
                actualPositionBlock.toMerged();
            newBlocks[currentIndex.value] =
                Block.empty(index: currentIndex.value, boardSize: size.value);
          }
        }
      }

      //at the end
      if (currentIndex.hasNext(nextDirection)) {
        currentIndex = currentIndex.next(nextDirection);
      } else {
        return Board(blocks: newBlocks);
      }
    }
  }
}
