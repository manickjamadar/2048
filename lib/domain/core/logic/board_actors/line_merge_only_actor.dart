import 'package:flutter/foundation.dart';
import 'package:twozerofoureight/domain/core/logic/actor/board_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';

class LineMergeOnlyActor extends BoardActor {
  final BoardDirection direction;
  final BlockIndex startIndex;

  const LineMergeOnlyActor(Board board,
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
      Block holdingBlock = newBlocks[currentIndex.value];
      //getting non empty holding block
      while (holdingBlock.isEmpty) {
        if (currentIndex.hasNext(nextDirection)) {
          currentIndex = currentIndex.next(nextDirection);
          holdingBlock = newBlocks[currentIndex.value];
        } else {
          return Board(blocks: newBlocks);
        }
      }

      if (!currentIndex.hasNext(nextDirection)) {
        newBlocks[currentIndex.value] =
            Block.empty(index: currentIndex.value, boardSize: size.value);
        return Board(blocks: newBlocks);
      } else {
        BlockIndex nextIndex = currentIndex.next(nextDirection);
        Block nextBlock = newBlocks[nextIndex.value];
        //getting non empty next block
        while (nextBlock.isEmpty) {
          if (!nextIndex.hasNext(nextDirection)) {
            newBlocks[currentIndex.value] =
                Block.empty(index: currentIndex.value, boardSize: size.value);
            return Board(blocks: newBlocks);
          } else {
            nextIndex = nextIndex.next(nextDirection);
            nextBlock = newBlocks[nextIndex.value];
          }
        }

        if (nextBlock.isDetached(nextIndex.value) &&
            holdingBlock.hasSamePoint(nextBlock)) {
          if (holdingBlock.isDetached(currentIndex.value)) {
            newBlocks[currentIndex.value] =
                Block.empty(index: currentIndex.value, boardSize: size.value);
          }
          newBlocks[holdingBlock.index.value] = holdingBlock.toMerged();
          newBlocks[nextIndex.value] =
              Block.empty(index: nextIndex.value, boardSize: size.value);

          if (nextIndex.hasNext(nextDirection)) {
            currentIndex = nextIndex.next(nextDirection);
          } else {
            return Board(blocks: newBlocks);
          }
        } else {
          newBlocks[currentIndex.value] =
              Block.empty(index: currentIndex.value, boardSize: size.value);
          currentIndex = nextIndex.copy();
        }
      }
    }
  }
}
