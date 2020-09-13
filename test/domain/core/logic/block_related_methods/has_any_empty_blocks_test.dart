import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/has_any_empty_blocks.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

void main() {
  group("Has any empty blocks test => ", () {
    test("should return true for some non empty blocks", () {
      final List<Block> blocks = [
        Block.empty(index: 3, boardSize: 4),
        Block.random(index: 4, boardSize: 4),
        Block.empty(index: 5, boardSize: 4),
        Block.random(index: 6, boardSize: 4),
      ];

      expect(hasAnyEmptyBlocks(blocks), isTrue);
    });

    test("should return false for non empty blocks", () {
      final List<Block> blocks = [
        Block.random(index: 3, boardSize: 4),
        Block.random(index: 4, boardSize: 4),
        Block.random(index: 5, boardSize: 4),
        Block.random(index: 6, boardSize: 4),
      ];

      expect(hasAnyEmptyBlocks(blocks), isFalse);
    });

    test("should return false for empty list", () {
      expect(hasAnyEmptyBlocks([]), isFalse);
    });
  });
}
