import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/shared/helpers/board_direction.dart';
import "package:twozerofoureight/shared/helpers/list_extensions.dart";

void main() {
  group("Block Index test => ", () {
    test("should has value and size", () {
      final index = BlockIndex(value: 0, size: BoardSize(4));

      expect(index.value, equals(0));
      expect(index.size.value, equals(4));
    });

    test("should throw assertion error for out of size index value", () {
      expect(() => BlockIndex(value: -1, size: BoardSize(3)),
          throwsA(isA<AssertionError>()));
      expect(() => BlockIndex(value: 9, size: BoardSize(3)),
          throwsA(isA<AssertionError>()));
      expect(() => BlockIndex(value: 17, size: BoardSize(4)),
          throwsA(isA<AssertionError>()));
    });
    test("should return a identical copy", () {
      final index = BlockIndex(size: BoardSize(4), value: 5);
      expect(index.copy(), equals(index));
    });

    group("has next method test => ", () {
      void testHasNext(
          {@required BoardSize boardSize,
          @required List<int> indexValues,
          @required BoardDirection direction,
          @required bool hasNextExpect}) {
        test(
            "should ${hasNextExpect ? "" : "not "}have $direction index available",
            () {
          indexValues.forEach((int indexValue) {
            final index = BlockIndex(size: boardSize, value: indexValue);
            expect(index.hasNext(direction), equals(hasNextExpect));
          });
        });
      }

      group("For board size 3", () {
        final boardSize = BoardSize(3);
        testHasNext(
          boardSize: boardSize,
          indexValues: [0, 1, 3, 6, 4, 7],
          direction: BoardDirection.right(),
          hasNextExpect: true,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [2, 5, 8],
          direction: BoardDirection.right(),
          hasNextExpect: false,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [1, 2, 4, 5, 7, 8],
          direction: BoardDirection.left(),
          hasNextExpect: true,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [0, 3, 6],
          direction: BoardDirection.left(),
          hasNextExpect: false,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [3, 4, 5, 6, 7, 8],
          direction: BoardDirection.up(),
          hasNextExpect: true,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [0, 1, 2],
          direction: BoardDirection.up(),
          hasNextExpect: false,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [0, 1, 2, 3, 4, 5],
          direction: BoardDirection.down(),
          hasNextExpect: true,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [6, 7, 8],
          direction: BoardDirection.down(),
          hasNextExpect: false,
        );
      });
      group("For board size 4", () {
        final boardSize = BoardSize(4);
        testHasNext(
          boardSize: boardSize,
          indexValues: [0, 1, 2, 4, 5, 6, 8, 9, 10, 12, 12, 14],
          direction: BoardDirection.right(),
          hasNextExpect: true,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [3, 7, 11, 15],
          direction: BoardDirection.right(),
          hasNextExpect: false,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [1, 2, 3, 5, 6, 7, 9, 10, 11, 13, 14, 15],
          direction: BoardDirection.left(),
          hasNextExpect: true,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [0, 4, 8, 12],
          direction: BoardDirection.left(),
          hasNextExpect: false,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
          direction: BoardDirection.up(),
          hasNextExpect: true,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [0, 1, 2, 3],
          direction: BoardDirection.up(),
          hasNextExpect: false,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
          direction: BoardDirection.down(),
          hasNextExpect: true,
        );
        testHasNext(
          boardSize: boardSize,
          indexValues: [12, 13, 14, 15],
          direction: BoardDirection.down(),
          hasNextExpect: false,
        );
      });
    });

    group("next method test => ", () {
      void testNext(
          {@required BoardSize boardSize,
          @required BoardDirection direction,
          @required List<int> testValuess,
          @required List<int> expectedValues}) {
        if (testValuess.length != expectedValues.length) {
          expect(true, false);
        }
        testValuess.indexedMap((index, int testValue) {
          final expectedValue = expectedValues[index];
          test("should return $expectedValue as next $direction of $testValue",
              () {
            final index = BlockIndex(value: testValue, size: boardSize);
            expect(index.next(direction)?.value, equals(expectedValue));
          });
        });
      }

      group("For board size 3", () {
        final boardSize = BoardSize(3);
        group("For right direction", () {
          final direction = BoardDirection.right();
          testNext(
            boardSize: boardSize,
            direction: direction,
            testValuess: [0, 1, 2, 3, 4, 5, 6, 7, 8],
            expectedValues: [1, 2, null, 4, 5, null, 7, 8, null],
          );
        });
        group("For left direction", () {
          final direction = BoardDirection.left();
          testNext(
            boardSize: boardSize,
            direction: direction,
            testValuess: [0, 1, 2, 3, 4, 5, 6, 7, 8],
            expectedValues: [null, 0, 1, null, 3, 4, null, 6, 7],
          );
        });
        group("For down direction", () {
          final direction = BoardDirection.down();
          testNext(
            boardSize: boardSize,
            direction: direction,
            testValuess: [0, 1, 2, 3, 4, 5, 6, 7, 8],
            expectedValues: [3, 4, 5, 6, 7, 8, null, null, null],
          );
        });
        group("For up direction", () {
          final direction = BoardDirection.up();
          testNext(
            boardSize: boardSize,
            direction: direction,
            testValuess: [0, 1, 2, 3, 4, 5, 6, 7, 8],
            expectedValues: [null, null, null, 0, 1, 2, 3, 4, 5],
          );
        });
      });
      group("For board size 4", () {
        final boardSize = BoardSize(4);
        group("For right direction", () {
          final direction = BoardDirection.right();
          testNext(boardSize: boardSize, direction: direction, testValuess: [
            0,
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15
          ], expectedValues: [
            1,
            2,
            3,
            null,
            5,
            6,
            7,
            null,
            9,
            10,
            11,
            null,
            13,
            14,
            15,
            null
          ]);
        });
        group("For left direction", () {
          final direction = BoardDirection.left();
          testNext(
            boardSize: boardSize,
            direction: direction,
            testValuess: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
            expectedValues: [
              null,
              0,
              1,
              2,
              null,
              4,
              5,
              6,
              null,
              8,
              9,
              10,
              null,
              12,
              13,
              14
            ],
          );
        });
        group("For down direction", () {
          final direction = BoardDirection.down();
          testNext(
            boardSize: boardSize,
            direction: direction,
            testValuess: [
              0,
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
            ],
            expectedValues: [
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              null,
              null,
              null,
              null
            ],
          );
        });
        group("For up direction", () {
          final direction = BoardDirection.up();
          testNext(
            boardSize: boardSize,
            direction: direction,
            testValuess: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
            expectedValues: [
              null,
              null,
              null,
              null,
              0,
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11
            ],
          );
        });
      });
    });
  });
}
