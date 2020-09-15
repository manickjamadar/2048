//test that it returns new modified boards correctly

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/actor/board_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/board_loop_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_point.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

class MockBoardActor extends Mock implements BoardActor {}

void main() {
  group("Board Loop Actor test => ", () {
    test("should return board without modification if board is invalid", () {
      final board = Board(blocks: [
        Block.random(index: 3, boardSize: 4),
        Block.random(index: 5, boardSize: 4),
        Block.random(index: 6, boardSize: 4),
        Block.random(index: 7, boardSize: 4),
      ]);
      final actor = MockBoardActor();
      expect(
          ActionRunner(BoardLoopActor(board,
              direction: BoardDirection.left(), actor: (_, __) => actor)).run(),
          equals(board));
      verifyZeroInteractions(actor);
    });
    group("start index test => ", () {
      void testStartIndex(
          {@required BoardDirection direction,
          @required List<int> expectedStartIndexes,
          @required BoardSize size}) {
        test("should return correct start indexes for $direction", () {
          Board board = Board.empty(size);
          BoardActor actor = MockBoardActor();
          when(actor.act()).thenReturn(board);
          ActionRunner(BoardLoopActor(board, direction: direction,
              actor: (Board newBoard, BlockIndex startIndex) {
            final expectedStartIndex = expectedStartIndexes.removeAt(0);
            expect(startIndex.value, equals(expectedStartIndex));
            return actor;
          })).run();
          expect(expectedStartIndexes, isEmpty);
        });
      }

      group("For board size 3", () {
        final boardSize = BoardSize(3);
        testStartIndex(
          direction: BoardDirection.left(),
          expectedStartIndexes: [0, 3, 6],
          size: boardSize,
        );
        testStartIndex(
          direction: BoardDirection.right(),
          expectedStartIndexes: [2, 5, 8],
          size: boardSize,
        );
        testStartIndex(
          direction: BoardDirection.up(),
          expectedStartIndexes: [0, 1, 2],
          size: boardSize,
        );
        testStartIndex(
          direction: BoardDirection.down(),
          expectedStartIndexes: [6, 7, 8],
          size: boardSize,
        );
      });
      group("For board size 4", () {
        final boardSize = BoardSize(4);
        testStartIndex(
          direction: BoardDirection.left(),
          expectedStartIndexes: [0, 4, 8, 12],
          size: boardSize,
        );
        testStartIndex(
          direction: BoardDirection.right(),
          expectedStartIndexes: [3, 7, 11, 15],
          size: boardSize,
        );
        testStartIndex(
          direction: BoardDirection.up(),
          expectedStartIndexes: [0, 1, 2, 3],
          size: boardSize,
        );
        testStartIndex(
          direction: BoardDirection.down(),
          expectedStartIndexes: [12, 13, 14, 15],
          size: boardSize,
        );
      });
    });
    group("Modification by board actor test => ", () {
      void testModifyBoard(
          {@required BoardSize boardSize,
          @required List<int> modifiedIndexes,
          @required BoardDirection direction}) {
        test("should modify board correctly for $direction", () {
          final actor = MockBoardActor();
          final board = Board.empty(boardSize);
          final modifiedBoard = ActionRunner(BoardLoopActor(board,
              direction: direction, actor: (newBoard, startIndex) {
            board.blocks[startIndex.value] =
                board.blocks[startIndex.value].copyWith(point: BlockPoint.two);
            when(actor.act()).thenReturn(board);
            return actor;
          })).run();

          verify(actor.act()).called(boardSize.value);
          modifiedIndexes.forEach((int index) {
            expect(modifiedBoard.blocks[index].point.value, equals(2));
          });
        });
      }

      group("For board size 3", () {
        final boardSize = BoardSize(3);
        testModifyBoard(
          boardSize: boardSize,
          modifiedIndexes: [0, 3, 6],
          direction: BoardDirection.left(),
        );
        testModifyBoard(
          boardSize: boardSize,
          modifiedIndexes: [2, 5, 8],
          direction: BoardDirection.right(),
        );
        testModifyBoard(
          boardSize: boardSize,
          modifiedIndexes: [0, 1, 2],
          direction: BoardDirection.up(),
        );
        testModifyBoard(
          boardSize: boardSize,
          modifiedIndexes: [6, 7, 8],
          direction: BoardDirection.down(),
        );
      });
      group("For board size 4", () {
        final boardSize = BoardSize(4);
        testModifyBoard(
          boardSize: boardSize,
          modifiedIndexes: [0, 4, 8, 12],
          direction: BoardDirection.left(),
        );
        testModifyBoard(
          boardSize: boardSize,
          modifiedIndexes: [3, 7, 11, 15],
          direction: BoardDirection.right(),
        );
        testModifyBoard(
          boardSize: boardSize,
          modifiedIndexes: [0, 1, 2, 3],
          direction: BoardDirection.up(),
        );
        testModifyBoard(
          boardSize: boardSize,
          modifiedIndexes: [12, 13, 14, 15],
          direction: BoardDirection.down(),
        );
      });
    });
  });
}
