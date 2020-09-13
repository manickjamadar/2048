import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';

void main() {
  group("Board Direction test => ", () {
    test("should get proper opposite side", () {
      final right = BoardDirection.right();
      final left = BoardDirection.left();
      final up = BoardDirection.up();
      final down = BoardDirection.down();

      expect(right.opposite, BoardDirection.left());
      expect(left.opposite, BoardDirection.right());
      expect(up.opposite, BoardDirection.down());
      expect(down.opposite, BoardDirection.up());
    });
  });
}
