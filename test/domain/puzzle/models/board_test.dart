import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_point.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

void main() {
  group("Board test => ", () {
    group("Board empty test => ", () {
      test("should generate 9 empty blocks for board size 3", () {
        final emptyBoard = Board.empty(BoardSize(3));

        expect(emptyBoard.blocks.length, equals(9));
      });
      test("should generate 16 empty blocks for board size 4", () {
        final emptyBoard = Board.empty(BoardSize(4));

        expect(emptyBoard.blocks.length, equals(16));
      });
    });

    group("Board is valid test => ", () {
      test("should return false for empty list of block of board", () {
        final List<Block> emptyList = [];
        expect(Board(blocks: emptyList).isValid, isFalse);
      });

      test("should return false for different and sizes list", () {
        final blocks = [
          Block.random(index: 0, boardSize: 3),
          Block.random(index: 3, boardSize: 4),
          Block.random(index: 4, boardSize: 5),
          Block.random(index: 6, boardSize: 3),
        ];

        expect(Board(blocks: blocks).isValid, isFalse);
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
        expect(Board(blocks: blocks).isValid, isFalse);
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
        expect(Board(blocks: blocks).isValid, isFalse);
      });

      test("should return true for proper board formed list of blocks of 3",
          () {
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

        expect(Board(blocks: blocks).isValid, isTrue);
      });
      test("should return true for proper board formed list of blocks of 4",
          () {
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

        expect(Board(blocks: blocks).isValid, isTrue);
      });
    });

    group("board size getter test => ", () {
      test("should return null for empty list of blocks", () {
        expect(Board(blocks: []).size, equals(null));
      });
      test("should return null if list length is not right", () {
        final blocks = [
          Block.random(index: 3, boardSize: 4),
          Block.random(index: 4, boardSize: 4),
          Block.random(index: 5, boardSize: 4),
          Block.random(index: 6, boardSize: 4),
          Block.random(index: 8, boardSize: 4),
        ];
        expect(Board(blocks: blocks).size, equals(null));
      });
      test(
          "should return null for correct list length but differnt blocks sizes",
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

        expect(Board(blocks: blocks).size, equals(null));
      });

      test(
          "should return null form incorrect list length and for every boardsize 4",
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

        expect(Board(blocks: blocks).size, equals(null));
      });

      test(
          "should return correct size for correct list length and board size 3",
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

        expect(Board(blocks: blocks).size, equals(expectedBoardSize));
      });
    });
    group("slidable test => ", () {
      test("should return false if board is invalid", () {
        final board = Board(blocks: [
          Block.random(index: 3, boardSize: 3),
          Block.random(index: 4, boardSize: 3),
          Block.random(index: 5, boardSize: 3),
          Block.random(index: 6, boardSize: 3),
        ]);
        expect(board.slidable, isFalse);
      });
      test('should return true for slidable in any direction', () {
        final points = [
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.two,
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.empty,
        ];
        final boardSize = BoardSize(3);
        final board = Board(
            blocks: List.generate(boardSize.totalSize, (index) {
          final point = points[index];
          return Block.empty(index: index, boardSize: boardSize.value)
              .copyWith(point: point);
        }));
        expect(board.slidable, isTrue);
      });
      test("should return false when there is no way to slide", () {
        final points = [
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two
        ];
        final boardSize = BoardSize(3);
        final board = Board(
            blocks: List.generate(boardSize.totalSize, (index) {
          final point = points[index];
          return Block.empty(index: index, boardSize: boardSize.value)
              .copyWith(point: point);
        }));
        expect(board.slidable, isFalse);
      });
    });
  });
}
