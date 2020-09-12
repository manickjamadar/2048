import 'package:flutter_test/flutter_test.dart';
import 'package:twozerofoureight/domain/core/value_objects/unique_id.dart';

void main() {
  group("Unique Id test => ", () {
    test("Unique id is unique all the time", () {
      final id = UniqueId();
      final id2 = UniqueId();
      expect(id, isNot(equals(id2)));
    });
    test("should equal for two same instance", () {
      final id = UniqueId();
      final id2 = UniqueId.fromString(id.value);

      expect(id, equals(id2));
    });

    test("should give id as non empty string", () {
      final id = UniqueId();

      expect(id.value, isA<String>());
      expect(id.value, isNotEmpty);
    });
  });
}
