import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/presentation/core/helpers/get_tile_position.dart';

void main() {
  group("get tile position method test => ", () {
    void testTilePosition(
        {@required int index,
        @required int boardSize,
        @required double tileSize,
        @required Offset expectedOffset}) {
      test("should return correct offset for $index of board size $boardSize ",
          () {
        final offset = getTilePosition(
            index: BlockIndex(value: index, size: BoardSize(boardSize)),
            tileSize: tileSize);

        expect(offset, equals(expectedOffset));
      });
    }

    test("should return offset 0,0 for invalid tileSize", () {
      final offset = getTilePosition(
          index: BlockIndex(value: 3, size: BoardSize(3)), tileSize: -23);

      expect(offset, equals(Offset(0, 0)));
    });

    group("for board size 3", () {
      final size = 3;
      testTilePosition(
          index: 0,
          boardSize: size,
          tileSize: 30,
          expectedOffset: Offset(0, 0));
      testTilePosition(
          index: 1,
          boardSize: size,
          tileSize: 30,
          expectedOffset: Offset(30, 0));
      testTilePosition(
          index: 5,
          boardSize: size,
          tileSize: 10,
          expectedOffset: Offset(20, 10));
      testTilePosition(
          index: 6,
          boardSize: size,
          tileSize: 10,
          expectedOffset: Offset(0, 20));
      testTilePosition(
          index: 8,
          boardSize: size,
          tileSize: 10,
          expectedOffset: Offset(20, 20));
    });
    group("for board size 4", () {
      final size = 4;
      testTilePosition(
          index: 0,
          boardSize: size,
          tileSize: 456,
          expectedOffset: Offset(0, 0));
      testTilePosition(
          index: 1, boardSize: size, tileSize: 5, expectedOffset: Offset(5, 0));
      testTilePosition(
          index: 3,
          boardSize: size,
          tileSize: 5,
          expectedOffset: Offset(15, 0));
      testTilePosition(
          index: 12,
          boardSize: size,
          tileSize: 5,
          expectedOffset: Offset(0, 15));
      testTilePosition(
          index: 15,
          boardSize: size,
          tileSize: 5,
          expectedOffset: Offset(15, 15));
    });
  });
}
