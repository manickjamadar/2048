import 'package:flutter/foundation.dart';
import 'package:twozerofoureight/domain/core/logic/actor/board_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';

class LineSlideActor extends BoardActor {
  final BoardDirection direction;
  final BlockIndex startIndex;

  const LineSlideActor(Board board,
      {@required this.direction, @required this.startIndex})
      : super(board);
  @override
  Board act() {
    if (!board.isValid || startIndex.value >= board.size.totalSize) {
      return board;
    }
    final blocks = board.blocks;
    final nextDirection = direction.opposite;
    final newBlocks = [...blocks];
    BlockIndex currentIndex = startIndex;
    //checking has next block
    while (currentIndex.hasNext(nextDirection)) {
      Block holdingBlock = newBlocks[currentIndex.value];
      BlockIndex nextIndex = currentIndex.next(nextDirection);
      //getting the next comparable block
      Block comparableBlock = newBlocks[nextIndex.value];
      //checking is comparable block is empty
      while (comparableBlock.isPositionEmpty(nextIndex.value)) {
        //has next block of comparable block
        if (nextIndex.hasNext(nextDirection)) {
          //getting next block of comparable block
          nextIndex = nextIndex.next(nextDirection);
          comparableBlock = newBlocks[nextIndex.value];
        } else {
          return Board(blocks: newBlocks);
        }
      }
      //got comparable block which is not empty
      if (holdingBlock.isPositionEmpty(currentIndex.value)) {
        newBlocks[nextIndex.value] =
            comparableBlock.copyWith(index: currentIndex.copy());
        final referentPointValue = comparableBlock.point.value;
        if (nextIndex.hasNext(nextDirection)) {
          BlockIndex nextNextIndex = nextIndex.next(nextDirection);
          Block nextOfComparableBlock = newBlocks[nextNextIndex.value];

          while (nextOfComparableBlock.isPositionEmpty(nextNextIndex.value)) {
            if (nextNextIndex.hasNext(nextDirection)) {
              nextNextIndex = nextNextIndex.next(nextDirection);
              nextOfComparableBlock = newBlocks[nextNextIndex.value];
            } else {
              return Board(blocks: newBlocks);
            }
          }

          if (nextOfComparableBlock.point.value == referentPointValue) {
            newBlocks[nextNextIndex.value] =
                nextOfComparableBlock.copyWith(index: currentIndex.copy());
          }
          currentIndex = currentIndex.next(nextDirection);
        } else {
          return Board(blocks: newBlocks);
        }
      } else {
        if (comparableBlock.point.value == holdingBlock.point.value) {
          newBlocks[nextIndex.value] =
              comparableBlock.copyWith(index: currentIndex.copy());
        }
        currentIndex = currentIndex.next(nextDirection);
      }
    }
    return Board(blocks: newBlocks);
  }
}
