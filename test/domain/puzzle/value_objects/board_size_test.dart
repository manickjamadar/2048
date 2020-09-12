import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

void main() {
  group("Board Size test => ", () {
    test("should match the value", () {
      final size = BoardSize(4);
      expect(size.value, equals(4));
    });
    test("should return correct totalSize", () {
      final size1 = BoardSize(3);
      final size2 = BoardSize(4);
      final size3 = BoardSize(34);
      final size4 = BoardSize(76);
      expect(size1.totalSize, equals(9));
      expect(size2.totalSize, equals(16));
      expect(size3.totalSize, equals(1156));
      expect(size4.totalSize, equals(5776));
    });
    test('should fullfill equality', () {
      final size = BoardSize(6);
      final sameSize = BoardSize(6);
      expect(size, equals(sameSize));
    });
  });
}
