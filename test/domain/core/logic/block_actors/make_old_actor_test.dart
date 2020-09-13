import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/block_actors/make_old_actor.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

void main() {
  group("Make old actor test => ", () {
    test("should return same block list if all blocks are already old", () {
      final blocks = [
        Block.random(index: 3, boardSize: 4).copyWith(isNew: false),
        Block.random(index: 9, boardSize: 4).copyWith(isNew: false),
        Block.random(index: 4, boardSize: 4).copyWith(isNew: false),
        Block.random(index: 8, boardSize: 4).copyWith(isNew: false),
      ];
      final oldBlocks = ActionRunner(MakeOldActor(blocks)).run();

      expect(oldBlocks, equals(blocks));
    });
    test("should return empty list for empty list", () {
      final List<Block> blocks = [];
      expect(ActionRunner(MakeOldActor(blocks)).run(), equals([]));
    });
    test("should make old block if some new block available", () {
      final blocks = [
        Block.random(index: 3, boardSize: 4),
        Block.random(index: 9, boardSize: 4).copyWith(isNew: false),
        Block.random(index: 4, boardSize: 4),
        Block.random(index: 8, boardSize: 4).copyWith(isNew: false),
      ];
      final expectedOldBlocks = [
        blocks[0].copyWith(isNew: false),
        blocks[1],
        blocks[2].copyWith(isNew: false),
        blocks[3],
      ];
      expect(
          ActionRunner(MakeOldActor(blocks)).run(), equals(expectedOldBlocks));
    });
    test("should make every block old if every block is new", () {
      final blocks = [
        Block.random(index: 3, boardSize: 4),
        Block.random(index: 9, boardSize: 4),
        Block.random(index: 4, boardSize: 4),
        Block.random(index: 8, boardSize: 4),
      ];
      final expectedOldBlocks = [
        blocks[0].copyWith(isNew: false),
        blocks[1].copyWith(isNew: false),
        blocks[2].copyWith(isNew: false),
        blocks[3].copyWith(isNew: false),
      ];

      expect(
          ActionRunner(MakeOldActor(blocks)).run(), equals(expectedOldBlocks));
    });
  });
}
