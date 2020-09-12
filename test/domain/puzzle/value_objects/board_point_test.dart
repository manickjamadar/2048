import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_point.dart';

void main() {
  group("Block Point test => ", () {
    test("should empty point equals to 0", () {
      final emptyPoint = BlockPoint.empty;
      expect(emptyPoint.value, equals(0));
    });
    test("should two point equals to 2", () {
      final twoPoint = BlockPoint.two;
      expect(twoPoint.value, equals(2));
    });
    test("should four point equals to 2", () {
      final fourPoint = BlockPoint.four;
      expect(fourPoint.value, equals(4));
    });

    test("should random point equals to 2 or 4", () {
      final randomPoints = [
        BlockPoint.random(),
        BlockPoint.random(),
        BlockPoint.random(),
        BlockPoint.random(),
        BlockPoint.random(),
        BlockPoint.random(),
      ];
      randomPoints.forEach((point) {
        expect(point.value == 2 || point.value == 4, isTrue);
      });
    });

    test("should return merged point as addition of same point", () {
      final point1 = BlockPoint.two;
      final point2 = BlockPoint.four;

      expect(point1.mergedPoint().value, equals(4));
      expect(point2.mergedPoint().value, equals(8));

      expect(point1.mergedPoint().mergedPoint().value, equals(8));
      expect(point2.mergedPoint().mergedPoint().value, equals(16));
    });

    test("should follow equality", () {
      final point = BlockPoint.two;
      final samePoint = BlockPoint.two;

      expect(point, samePoint);
    });
  });
}
