import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/block_actors/generate_random_block_actor.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/get_empty_blocks.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/generate_random_board_actor.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';

void main() {
  group("generate random board test => ", () {
    List<Block> testBlocks;
    Board testBoard;
    setUp(() {
      testBlocks = [
        Block.random(index: 3, boardSize: 4),
        Block.random(index: 4, boardSize: 4),
        Block.empty(index: 6, boardSize: 4),
        Block.random(index: 7, boardSize: 4),
        Block.empty(index: 10, boardSize: 4),
        Block.empty(index: 8, boardSize: 4),
        Block.empty(index: 9, boardSize: 4),
        Block.random(index: 2, boardSize: 4),
        Block.random(index: 1, boardSize: 4),
      ];
      testBoard = Board(blocks: testBlocks);
    });
    test("should return same board if count is 0", () {
      expect(ActionRunner(GenerateRandomBoardActor(testBoard, count: 0)).run(),
          equals(testBoard));
    });
    test("should return same board if there is no empty blocks", () {
      final filledBlocks = [
        Block.random(index: 3, boardSize: 4),
        Block.random(index: 4, boardSize: 4),
        Block.random(index: 5, boardSize: 4),
        Block.random(index: 8, boardSize: 4),
      ];
      final filledBoard = Board(blocks: filledBlocks);
      expect(ActionRunner(GenerateRandomBoardActor(filledBoard)).run(),
          equals(filledBoard));
    });

    test("should generate one random block correctly", () {
      final emptyBlocks = getEmptyBlocks(testBlocks);
      final modifiedBoard =
          ActionRunner(GenerateRandomBoardActor(testBoard)).run();
      final modifiedEmptyBlocks = getEmptyBlocks(modifiedBoard.blocks);

      expect(emptyBlocks.length - 1, equals(modifiedEmptyBlocks.length));
    });

    test("should filled with random block for last remaning empty block", () {
      final blocks = [
        Block.random(index: 5, boardSize: 4),
        Block.empty(index: 8, boardSize: 4),
        Block.random(index: 0, boardSize: 4),
        Block.random(index: 10, boardSize: 4),
      ];

      final modifiedBlocks =
          ActionRunner(GenerateRandomBoardActor(Board(blocks: blocks)))
              .run()
              .blocks;

      expect(modifiedBlocks[1].isEmpty, isFalse);
      expect(modifiedBlocks[1].index, equals(blocks[1].index));
      expect(modifiedBlocks[1].id, isNot(equals(blocks[1].id)));
    });

    test("should filled all empty blocks with random blocks", () {
      final int emptyBlocksSize = getEmptyBlocks(testBlocks).length;
      final modifiedBlocks = ActionRunner(
              GenerateRandomBoardActor(testBoard, count: emptyBlocksSize))
          .run()
          .blocks;

      expect(getEmptyBlocks(modifiedBlocks).length, equals(0));
    });
    test("should filled 4 random block correctly", () {
      final emptyBlocks = [
        Block.empty(index: 18, boardSize: 5),
        Block.empty(index: 3, boardSize: 4),
        Block.empty(index: 4, boardSize: 3),
        Block.empty(index: 2, boardSize: 5),
        Block.empty(index: 9, boardSize: 5),
      ];
      final count = 4;
      final modifiedBlocks = ActionRunner(GenerateRandomBoardActor(
              Board(blocks: emptyBlocks),
              count: count))
          .run()
          .blocks;
      expect(getEmptyBlocks(modifiedBlocks).length, equals(1));
    });
    test("should filled with random blocks in different position", () {
      final emptyBlocks = [
        Block.empty(index: 18, boardSize: 5),
        Block.empty(index: 3, boardSize: 4),
        Block.empty(index: 4, boardSize: 3),
        Block.empty(index: 2, boardSize: 5),
        Block.empty(index: 9, boardSize: 5),
      ];
      while (true) {
        final modifiedBlocks1 =
            ActionRunner(GenerateRandomBoardActor(Board(blocks: emptyBlocks)))
                .run()
                .blocks;
        final modifiedBlocks2 =
            ActionRunner(GenerateRandomBoardActor(Board(blocks: emptyBlocks)))
                .run()
                .blocks;
        final randomBlockIndex1 =
            modifiedBlocks1.indexWhere((block) => block.isEmpty);
        final randomBlockIndex2 =
            modifiedBlocks2.indexWhere((block) => block.isEmpty);
        if (randomBlockIndex1 == randomBlockIndex2) {
          continue;
        } else {
          expect(randomBlockIndex1, isNot(equals(randomBlockIndex2)));
          return;
        }
      }
    });
  });
}
