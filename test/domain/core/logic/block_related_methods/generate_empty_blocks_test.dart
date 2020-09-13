import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/generate_empty_blocks.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/get_empty_blocks.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

void main() {
  group("Generate empty blocks test => ", () {
    test("should generate 9 empty blocks for board size 3", () {
      final emptyBlocks = generateEmptyBlocks(BoardSize(3));

      final expectedEmptyBlocks = getEmptyBlocks(emptyBlocks);
      expect(expectedEmptyBlocks, equals(emptyBlocks));
    });
    test("should generate 16 empty blocks for board size 4", () {
      final emptyBlocks = generateEmptyBlocks(BoardSize(4));

      final expectedEmptyBlocks = getEmptyBlocks(emptyBlocks);
      expect(expectedEmptyBlocks, equals(emptyBlocks));
    });
  });
}
