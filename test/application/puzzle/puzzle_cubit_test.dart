import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/get_empty_blocks.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_point.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/helpers/list_extensions.dart';

void main() {
  group("Puzzle cubit test => ", () {
    test("should return intial state init with board size 3", () {
      final cubit = PuzzleCubit();
      final boardSize = BoardSize(3);
      cubit.init(boardSize);

      expect(
          cubit.state,
          equals(PuzzleState(
              boardSize: boardSize,
              isGameOver: false,
              slidable: true,
              previousBoard: None(),
              score: BoardScore(0),
              mainBoard: cubit.state.mainBoard,
              mergeOnlyBoard: cubit.state.mergeOnlyBoard)));
      expect(getEmptyBlocks(cubit.state.mergeOnlyBoard.blocks).length,
          equals(boardSize.totalSize));
      expect(getEmptyBlocks(cubit.state.mainBoard.blocks).length,
          equals(boardSize.totalSize - 2));
    });

    group("init with board => ", () {
      test("should throw error when board is not valid", () {
        final board = Board(blocks: [
          Block.random(index: 3, boardSize: 3),
          Block.random(index: 3, boardSize: 3),
          Block.random(index: 3, boardSize: 3),
        ]);
        expect(() => PuzzleCubit().initWithBoard(board, BoardScore(34)),
            throwsA(isA<UnsupportedError>()));
      });
      test("should return correct state with init with board with size 3", () {
        final board = Board.empty(BoardSize(3));
        board.blocks[0] = Block.random(index: 3, boardSize: 3);
        final cubit = PuzzleCubit()..initWithBoard(board, BoardScore(23));

        expect(
            cubit.state,
            equals(PuzzleState(
                isGameOver: false,
                slidable: true,
                boardSize: BoardSize(3),
                mainBoard: board,
                score: BoardScore(23),
                mergeOnlyBoard: cubit.state.mergeOnlyBoard,
                previousBoard: None())));
        expect(getEmptyBlocks(cubit.state.mergeOnlyBoard.blocks).length, 9);
      });
      test("should return state with game over true with filled init board",
          () {
        final points = [
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
        ];
        final board = Board.fromPoints(points: points, size: BoardSize(3));
        final cubit = PuzzleCubit()..initWithBoard(board, BoardScore(34));
        expect(
            cubit.state,
            equals(PuzzleState(
                isGameOver: true,
                slidable: true,
                boardSize: BoardSize(3),
                mainBoard: board,
                score: BoardScore(34),
                mergeOnlyBoard: cubit.state.mergeOnlyBoard,
                previousBoard: None())));
      });
      test('should generate two random block if board is empty', () {
        final cubit = PuzzleCubit();
        final boardSize = BoardSize(3);
        cubit.initWithBoard(Board.empty(boardSize), BoardScore(0));
        expect(
            cubit.state,
            equals(PuzzleState(
                boardSize: boardSize,
                isGameOver: false,
                slidable: true,
                score: BoardScore(0),
                previousBoard: None(),
                mainBoard: cubit.state.mainBoard,
                mergeOnlyBoard: cubit.state.mergeOnlyBoard)));
        expect(getEmptyBlocks(cubit.state.mergeOnlyBoard.blocks).length,
            equals(boardSize.totalSize));
        expect(getEmptyBlocks(cubit.state.mainBoard.blocks).length,
            equals(boardSize.totalSize - 2));
      });
    });
    test(
      "should reset state",
      () async {
        final points = [
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four.mergedPoint(),
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.four.mergedPoint(),
        ];
        final boardSize = BoardSize(3);
        final board = Board.fromPoints(points: points, size: boardSize);
        final cubit = PuzzleCubit()..initWithBoard(board, BoardScore(45));
        final duration = Duration(milliseconds: 800);
        cubit.slide(
            direction: BoardDirection.left(),
            slideDuration: duration,
            mergeDuration: duration);
        await Future.delayed(Duration(milliseconds: 1700));
        expect(cubit.state.previousBoard, isNot(equals(None())));
        expect(cubit.state.isGameOver, isTrue);
        cubit.reset();
        expect(
            cubit.state,
            equals(PuzzleState(
                boardSize: boardSize,
                isGameOver: false,
                slidable: true,
                previousBoard: None(),
                score: BoardScore(0),
                mainBoard: cubit.state.mainBoard,
                mergeOnlyBoard: cubit.state.mergeOnlyBoard)));
        expect(getEmptyBlocks(cubit.state.mergeOnlyBoard.blocks).length,
            equals(boardSize.totalSize));
        expect(getEmptyBlocks(cubit.state.mainBoard.blocks).length,
            equals(boardSize.totalSize - 2));
      },
    );

    group("undo event => ", () {
      test(
        "should not undo if previous board is not present",
        () {
          final points = [
            BlockPoint.two,
            BlockPoint.four,
            BlockPoint.two,
            BlockPoint.four,
            BlockPoint.two,
            BlockPoint.four.mergedPoint(),
            BlockPoint.two,
            BlockPoint.empty,
            BlockPoint.four.mergedPoint(),
          ];
          final boardSize = BoardSize(3);
          final board = Board.fromPoints(points: points, size: boardSize);
          final cubit = PuzzleCubit()..initWithBoard(board, BoardScore(56));
          cubit.undo();
          expect(cubit.state.mainBoard, equals(board));
        },
      );

      test("should undo previous board properly", () async {
        final points = [
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four.mergedPoint(),
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.four.mergedPoint(),
        ];
        final boardSize = BoardSize(3);
        final board = Board.fromPoints(points: points, size: boardSize);
        final cubit = PuzzleCubit()..initWithBoard(board, BoardScore(47));
        final duration = Duration(milliseconds: 800);
        cubit.slide(
            direction: BoardDirection.left(),
            slideDuration: duration,
            mergeDuration: duration);
        await Future.delayed(Duration(milliseconds: 1700));
        expect(cubit.state.previousBoard, isNot(equals(None())));
        expect(cubit.state.isGameOver, isTrue);
        expect(cubit.state.mainBoard, isNot(equals(board)));
        cubit.undo();
        expect(cubit.state.previousBoard, equals(None()));
        expect(cubit.state.isGameOver, isFalse);
        expect(cubit.state.mainBoard, equals(board));
        expect(cubit.state.score, BoardScore(47));
        cubit.undo();
        expect(cubit.state.previousBoard, equals(None()));
        expect(cubit.state.isGameOver, isFalse);
        expect(cubit.state.mainBoard, equals(board));
      });
    });
    group("slide event => ", () {
      test("should return slided , merge and merge only board properly",
          () async {
        final boardSize = BoardSize(3);
        final points = [
          BlockPoint.empty,
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.two,
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.two,
        ];
        final normalBoard = Board.fromPoints(points: points, size: boardSize);
        final detachedIndexes = [0, 1, 2, 0, 1, 2, 3, 7, 2];
        final slidedBoard = Board(
            blocks: normalBoard.blocks.indexedMap(
                (index, block) => block.detach(detachedIndexes[index])));
        final mergedPoints = [
          BlockPoint.four,
          BlockPoint.four,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty
        ];
        final mergedOnlyPoints = [
          BlockPoint.empty,
          BlockPoint.four,
          BlockPoint.four,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty
        ];

        final cubit = PuzzleCubit()..initWithBoard(normalBoard, BoardScore(0));
        final duration = Duration(milliseconds: 800);
        cubit.slide(
            direction: BoardDirection.up(),
            slideDuration: duration,
            mergeDuration: duration);
        cubit.slide(
            direction: BoardDirection.left(),
            slideDuration: duration,
            mergeDuration: duration);
        expect(cubit.state.mainBoard, equals(slidedBoard));
        expect(cubit.state.slidable, isFalse);
        await Future.delayed(Duration(milliseconds: 850));
        //after slide completed
        final mergedBoard = cubit.state.mainBoard;
        final emptyBlocks = getEmptyBlocks(mergedBoard.blocks);
        expect(emptyBlocks.length, 4);
        final expectedMergeIndexes = [0, 1, 2, 3];
        expectedMergeIndexes.indexedMap((_, index) {
          expect(mergedBoard.blocks[index].point, equals(mergedPoints[index]));
        });
        expect(cubit.state.mergeOnlyBoard.blocks[1].point,
            equals(BlockPoint.four));
        cubit.state.mergeOnlyBoard.blocks.indexedMap((index, block) {
          expect(block.point, equals(mergedOnlyPoints[index]));
          return block;
        });
        expect(cubit.state.isGameOver, isFalse);
        expect(cubit.state.previousBoard, equals(Some(normalBoard)));
        await Future.delayed(Duration(milliseconds: 850));
        //after mergecompleted
        expect(cubit.state.mergeOnlyBoard.isEmpty, isTrue);
        expect(cubit.state.slidable, isTrue);
      });
      test("should return is game over true if board is filled", () async {
        final points = [
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four.mergedPoint(),
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.four.mergedPoint(),
        ];
        final boardSize = BoardSize(3);
        final board = Board.fromPoints(points: points, size: boardSize);
        final cubit = PuzzleCubit()..initWithBoard(board, BoardScore(0));
        final duration = Duration(milliseconds: 800);
        cubit.slide(
            direction: BoardDirection.left(),
            slideDuration: duration,
            mergeDuration: duration);
        await Future.delayed(Duration(milliseconds: 1700));
        expect(cubit.state.previousBoard, isNot(equals(None())));
        expect(cubit.state.isGameOver, isTrue);
      });
    });
    group("score test => ", () {
      test("should increase correct score for intial board slide", () async {
        final boardSize = BoardSize(3);
        final points = [
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.two,
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.empty,
        ];
        final board = Board.fromPoints(points: points, size: boardSize);
        final cubit = PuzzleCubit()..initWithBoard(board, BoardScore(0));
        final duration = Duration(milliseconds: 100);
        cubit.slide(
            direction: BoardDirection.left(),
            slideDuration: duration,
            mergeDuration: duration);
        await Future.delayed(Duration(milliseconds: 300));
        expect(cubit.state.score.value, equals(4));
      });
      test("should increase correct score after slide", () async {
        final points = [
          BlockPoint.two,
          BlockPoint.four.mergedPoint(),
          BlockPoint.four.mergedPoint(),
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.two,
          BlockPoint.empty,
          BlockPoint.empty,
          BlockPoint.four,
        ];
        final board = Board.fromPoints(points: points, size: BoardSize(3));
        final cubit = PuzzleCubit()..initWithBoard(board, BoardScore(0));
        final duration = Duration(milliseconds: 100);
        cubit.slide(
            direction: BoardDirection.left(),
            slideDuration: duration,
            mergeDuration: duration);
        await Future.delayed(Duration(milliseconds: 230));
        expect(cubit.state.score.value, equals(4 + 16));
      });
      test("should increase correct score after slide twice", () async {
        final points = [
          BlockPoint.two,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.four,
          BlockPoint.empty,
          BlockPoint.four,
          BlockPoint.four,
          BlockPoint.empty,
          BlockPoint.four,
        ];
        final board = Board.fromPoints(points: points, size: BoardSize(3));
        final cubit = PuzzleCubit()..initWithBoard(board, BoardScore(16));
        final duration = Duration(milliseconds: 100);
        cubit.slide(
            direction: BoardDirection.left(),
            slideDuration: duration,
            mergeDuration: duration);
        await Future.delayed(Duration(milliseconds: 230));
        expect(cubit.state.score.value, equals(36));
        cubit.slide(
            direction: BoardDirection.right(),
            slideDuration: duration,
            mergeDuration: duration);
        await Future.delayed(Duration(milliseconds: 230));
        expect(cubit.state.score.value, greaterThan(36));
      });
      test("should correctly undo score", () async {
        final points = [
          BlockPoint.two,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.four,
          BlockPoint.empty,
          BlockPoint.four,
          BlockPoint.four,
          BlockPoint.empty,
          BlockPoint.four,
        ];
        final board = Board.fromPoints(points: points, size: BoardSize(3));
        final cubit = PuzzleCubit()..initWithBoard(board, BoardScore(16));
        final duration = Duration(milliseconds: 100);
        cubit.slide(
            direction: BoardDirection.left(),
            slideDuration: duration,
            mergeDuration: duration);
        await Future.delayed(Duration(milliseconds: 230));
        expect(cubit.state.score.value, equals(36));
        cubit.slide(
            direction: BoardDirection.right(),
            slideDuration: duration,
            mergeDuration: duration);
        await Future.delayed(Duration(milliseconds: 230));
        expect(cubit.state.score.value, greaterThan(36));
        cubit.undo();
        expect(cubit.state.score.value, equals(36));
      });
    });
  });
}
