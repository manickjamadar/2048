import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/core/value_objects/unique_id.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_point.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

void main() {
  group("Block Model => ", () {
    test("should expect properties correctly", () {
      final block = Block(
          id: UniqueId(),
          index: BlockIndex(size: BoardSize(5), value: 12),
          point: BlockPoint.two,
          isNew: true);
      final defaultBlock = Block(
        id: UniqueId(),
        index: BlockIndex(size: BoardSize(4), value: 3),
        point: BlockPoint.four,
      );

      expect(block.id.value, isA<String>());
      expect(defaultBlock.id.value, isA<String>());

      expect(block.id.value, isNotEmpty);
      expect(defaultBlock.id.value, isNotEmpty);

      expect(block.index.value, 12);
      expect(defaultBlock.index.value, 3);

      expect(block.point.value, 2);
      expect(defaultBlock.point.value, 4);

      expect(block.isNew, isTrue);
      expect(defaultBlock.isNew, isFalse);
    });

    test("should get empty point with empty block", () {
      final emptyBlock = Block.empty(index: 3, boardSize: 3);
      expect(emptyBlock.point, equals(BlockPoint.empty));
    });
    test("should not new empty block", () {
      final emptyBlock = Block.empty(index: 3, boardSize: 3);
      expect(emptyBlock.isNew, isFalse);
    });
    test("should get random point with random block", () {
      final randomBlock = Block.random(index: 5, boardSize: 4);

      expect(
          randomBlock.point == BlockPoint.two ||
              randomBlock.point == BlockPoint.four,
          isTrue);
    });
    test("should new if random block", () {
      final randomBlock = Block.random(index: 5, boardSize: 4);
      expect(randomBlock.isNew, isTrue);
    });

    test("should return is empty true for empty block", () {
      final emptyBlock = Block.empty(index: 3, boardSize: 3);
      expect(emptyBlock.isEmpty, isTrue);
    });
    test("should return is empty false for random block", () {
      final randomBlock = Block.random(index: 5, boardSize: 4);
      expect(randomBlock.isEmpty, isFalse);
    });

    test("should return is position empty true for empty block ", () {
      final emptyBlock = Block.empty(index: 3, boardSize: 3);
      expect(emptyBlock.isPositionEmpty(emptyBlock.index.value), isTrue);
    });
    test(
        "should return is position empty true for non empty block and diffrent position ",
        () {
      final randomBlock = Block.random(index: 5, boardSize: 4);
      expect(randomBlock.isPositionEmpty(10), isTrue);
      expect(randomBlock.isPositionEmpty(1), isTrue);
      expect(randomBlock.isPositionEmpty(4), isTrue);
      expect(randomBlock.isPositionEmpty(7), isTrue);
    });
    test(
        "should return is position empty false for non empty and same position",
        () {
      final randomBlock = Block.random(index: 5, boardSize: 4);
      expect(randomBlock.isPositionEmpty(5), isFalse);
    });

    test("should return detached false if position is same", () {
      final randomBlock = Block.random(index: 5, boardSize: 4);
      expect(randomBlock.isDetached(5), isFalse);
    });
    test("should return detached true if position is different", () {
      final randomBlock = Block.random(index: 5, boardSize: 4);
      expect(randomBlock.isDetached(2), isTrue);
      expect(randomBlock.isDetached(11), isTrue);
      expect(randomBlock.isDetached(9), isTrue);
    });

    test("should for return true for two same point block", () {
      final block1 = Block(
          id: UniqueId(),
          index: BlockIndex(size: BoardSize(3), value: 3),
          point: BlockPoint.four);

      final block2 = Block(
          id: UniqueId(),
          index: BlockIndex(size: BoardSize(8), value: 6),
          point: BlockPoint.four);

      expect(block1.hasSamePoint(block2), isTrue);
    });
    test("should for return false for two diffrent point block", () {
      final block1 = Block(
          id: UniqueId(),
          index: BlockIndex(size: BoardSize(8), value: 6),
          point: BlockPoint.four);

      final block2 = Block(
          id: UniqueId(),
          index: BlockIndex(size: BoardSize(8), value: 6),
          point: BlockPoint.two);

      expect(block1.hasSamePoint(block2), isFalse);
    });

    test("should return merged block properly", () {
      final block = Block.random(index: 4, boardSize: 5);
      final mergedBlock = block.toMerged();

      expect(block.id.value, isNot(equals(mergedBlock.id.value)));
      expect(block.index, equals(mergedBlock.index));
      expect(block.point.mergedPoint(), equals(mergedBlock.point));
      expect(mergedBlock.isNew, isFalse);
    });

    test("should return proper random block from empty block", () {
      final emptyBlock = Block.empty(index: 3, boardSize: 6);
      final randomBlock = emptyBlock.toRandom();

      expect(emptyBlock.id.value, isNot(equals(randomBlock.id.value)));
      expect(emptyBlock.index, equals(randomBlock.index));
      expect(emptyBlock.point, isNot(equals(randomBlock.point)));
      expect(randomBlock.isNew, isTrue);
    });

    test("should throw assertion error when detaching with wrong index", () {
      final block = Block.random(index: 3, boardSize: 3);
      expect(() => block.detach(14), throwsA(isA<AssertionError>()));
    });
    test("should deatch to 1 from 4 position successfully", () {
      final block = Block.random(index: 4, boardSize: 3);
      final deatchedBlock =
          block.copyWith(index: BlockIndex(size: BoardSize(3), value: 1));
      final expectedBlock = block.detach(1);
      expect(expectedBlock, equals(deatchedBlock));
    });
  });
}
