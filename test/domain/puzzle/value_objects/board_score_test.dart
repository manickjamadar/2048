import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_point.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

void main() {
  group("Board score test => ", () {
    test("should throw assertion error for negative score", () {
      expect(() => BoardScore(-2), throwsA(isA<AssertionError>()));
    });
    test("should return proper value", () {
      expect(BoardScore(45).value, equals(45));
    });
    test("should have equality", () {
      expect(BoardScore(23), equals(BoardScore(23)));
    });
    group("add method => ", () {
      test("should return same score if merge only board is empty", () {
        final mergeOnlyBoard = Board.empty(BoardSize(3));
        expect(BoardScore(34).add(mergeOnlyBoard), equals(BoardScore(34)));
      });
      test('should return modified score for filled merge only board', () {
        final points = [
          BlockPoint.empty,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.two,
          BlockPoint.four,
          BlockPoint.four.mergedPoint(),
          BlockPoint.empty,
          BlockPoint.two,
          BlockPoint.empty,
        ];
        final mergeOnlyBoard =
            Board.fromPoints(points: points, size: BoardSize(3));
        expect(BoardScore(67).add(mergeOnlyBoard).value,
            equals(67 + 2 + 4 + 2 + 4 + 8 + 2));
      });
    });
  });
}
