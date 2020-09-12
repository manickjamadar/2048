import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:twozerofoureight/helpers/list_extensions.dart";

void main() {
  group("List Extensions test => ", () {
    test("Indexed Map Method is working properly", () {
      final List<int> list = [3, 4, 5, 6, 7, 8];
      final newList = list.map((e) => e * 2);
      final newIndexedList = list.indexedMap((index, element) {
        expect(list[index], equals(element));
        return element * 2;
      });
      expect(newIndexedList, equals(newList));
    });

    group("Has next method test => ", () {
      final testList = [3, 4, 5, 6];
      test("Index is out of range should return false", () {
        expect(testList.hasNext(-3), isFalse);
        expect(testList.hasNext(12), isFalse);
      });
      test("should return false for empty list", () {
        expect([].hasNext(0), isFalse);
      });
      test("should return for true having next element", () {
        expect(testList.hasNext(0), isTrue);
        expect(testList.hasNext(1), isTrue);
        expect(testList.hasNext(2), isTrue);
      });
      test("should return false for last index", () {
        expect(testList.hasNext(3), isFalse);
      });
    });
  });
}
