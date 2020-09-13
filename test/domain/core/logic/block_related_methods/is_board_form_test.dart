import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/is_board_form.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

void main() {
  group("Is board form method test => ", () {
    test("should return false for empty list of block", () {
      final List<Block> emptyList = [];
      expect(isBoardForm(emptyList), isFalse);
    });

    test("should return false for different and sizes list", () {
      final blocks = [
        Block.random(index: 0, boardSize: 3),
        Block.random(index: 3, boardSize: 4),
        Block.random(index: 4, boardSize: 5),
        Block.random(index: 6, boardSize: 3),
      ];

      expect(isBoardForm(blocks), isFalse);
    });

    test(
        "should return false for different blocks sizes with 3 board size list length",
        () {
      final blocks = [
        Block.empty(index: 0, boardSize: 3),
        Block.empty(index: 8, boardSize: 3),
        Block.empty(index: 2, boardSize: 3),
        Block.empty(index: 7, boardSize: 3),
        Block.empty(index: 3, boardSize: 4),
        Block.empty(index: 6, boardSize: 3),
        Block.empty(index: 5, boardSize: 3),
        Block.empty(index: 4, boardSize: 3),
        Block.empty(index: 1, boardSize: 3),
      ];
      expect(isBoardForm(blocks), isFalse);
    });

    test(
        "should return false for same blocks board sizes but not proper list length",
        () {
      final blocks = [
        Block.random(index: 0, boardSize: 3),
        Block.random(index: 1, boardSize: 3),
        Block.random(index: 2, boardSize: 3),
        Block.random(index: 3, boardSize: 3),
        Block.random(index: 4, boardSize: 3),
      ];
      expect(isBoardForm(blocks), isFalse);
    });

    test("should return true for proper board formed list of blocks of 3", () {
      final blocks = [
        Block.empty(index: 1, boardSize: 3),
        Block.empty(index: 0, boardSize: 3),
        Block.empty(index: 4, boardSize: 3),
        Block.empty(index: 2, boardSize: 3),
        Block.empty(index: 8, boardSize: 3),
        Block.empty(index: 6, boardSize: 3),
        Block.empty(index: 3, boardSize: 3),
        Block.empty(index: 5, boardSize: 3),
        Block.empty(index: 7, boardSize: 3),
      ];

      expect(isBoardForm(blocks), isTrue);
    });
    test("should return true for proper board formed list of blocks of 4", () {
      final blocks = [
        Block.empty(index: 3, boardSize: 4),
        Block.empty(index: 0, boardSize: 4),
        Block.empty(index: 4, boardSize: 4),
        Block.empty(index: 5, boardSize: 4),
        Block.empty(index: 8, boardSize: 4),
        Block.empty(index: 10, boardSize: 4),
        Block.empty(index: 14, boardSize: 4),
        Block.empty(index: 2, boardSize: 4),
        Block.empty(index: 1, boardSize: 4),
        Block.empty(index: 15, boardSize: 4),
        Block.empty(index: 11, boardSize: 4),
        Block.empty(index: 9, boardSize: 4),
        Block.empty(index: 12, boardSize: 4),
        Block.empty(index: 7, boardSize: 4),
        Block.empty(index: 6, boardSize: 4),
        Block.empty(index: 13, boardSize: 4),
      ];

      expect(isBoardForm(blocks), isTrue);
    });
  });
}
