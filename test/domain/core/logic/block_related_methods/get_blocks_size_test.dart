import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/get_blocks_size.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

void main() {
  group("Get blocks size method test => ", () {
    test("should return none if list length is not right", () {
      final blocks = [
        Block.random(index: 3, boardSize: 4),
        Block.random(index: 4, boardSize: 4),
        Block.random(index: 5, boardSize: 4),
        Block.random(index: 6, boardSize: 4),
        Block.random(index: 8, boardSize: 4),
      ];
      expect(getBlocksSize(blocks), equals(None()));
    });
    test("should return none for correct list length but differnt blocks sizes",
        () {
      final blocks = [
        Block.random(index: 0, boardSize: 3),
        Block.random(index: 1, boardSize: 3),
        Block.random(index: 2, boardSize: 3),
        Block.random(index: 3, boardSize: 3),
        Block.random(index: 4, boardSize: 3),
        Block.random(index: 5, boardSize: 3),
        Block.random(index: 6, boardSize: 4),
        Block.random(index: 7, boardSize: 3),
        Block.random(index: 8, boardSize: 4),
        Block.random(index: 9, boardSize: 4),
      ];

      expect(getBlocksSize(blocks), equals(None()));
    });

    test(
        "should return none form incorrect list length and for every boardsize 4",
        () {
      final blocks = [
        Block.random(index: 0, boardSize: 4),
        Block.random(index: 1, boardSize: 4),
        Block.random(index: 2, boardSize: 4),
        Block.random(index: 3, boardSize: 4),
        Block.random(index: 4, boardSize: 4),
        Block.random(index: 5, boardSize: 4),
        Block.random(index: 6, boardSize: 4),
        Block.random(index: 7, boardSize: 4),
        Block.random(index: 8, boardSize: 4),
        Block.random(index: 9, boardSize: 4),
      ];

      expect(getBlocksSize(blocks), equals(None()));
    });

    test("should return correct size for correct list length and board size 3",
        () {
      final blocks = [
        Block.random(index: 0, boardSize: 3),
        Block.random(index: 1, boardSize: 3),
        Block.random(index: 2, boardSize: 3),
        Block.random(index: 3, boardSize: 3),
        Block.random(index: 4, boardSize: 3),
        Block.random(index: 5, boardSize: 3),
        Block.random(index: 6, boardSize: 3),
        Block.random(index: 7, boardSize: 3),
        Block.random(index: 8, boardSize: 3),
      ];
      final expectedBoardSize = BoardSize(3);

      expect(getBlocksSize(blocks), equals(Some(expectedBoardSize)));
    });
  });
}
