import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/get_empty_blocks.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

void main() {
  group("get empty blocks test => ", () {
    test("should return empty list for empty list", () {
      expect(getEmptyBlocks([]), equals([]));
    });
    test("should return empty list for non empty list blocks", () {
      final blocks = [
        Block.random(index: 0, boardSize: 4),
        Block.random(index: 1, boardSize: 4),
        Block.random(index: 3, boardSize: 4),
        Block.random(index: 4, boardSize: 4),
      ];

      expect(getEmptyBlocks(blocks), equals([]));
    });
    test("should return correct empty blocks", () {
      final blocks = [
        Block.random(index: 0, boardSize: 4),
        Block.empty(index: 1, boardSize: 4),
        Block.random(index: 3, boardSize: 4),
        Block.empty(index: 4, boardSize: 4),
        Block.random(index: 6, boardSize: 4),
      ];
      final emptyBlocks = [blocks[1], blocks[3]];

      expect(getEmptyBlocks(blocks), equals(emptyBlocks));
    });
  });
}
