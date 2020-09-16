import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class UniqueId extends Equatable {
  final String value;

  const UniqueId._(this.value);

  factory UniqueId() {
    return UniqueId._(Uuid().v4());
  }

  factory UniqueId.fromString(String str) {
    return UniqueId._(str);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() {
    return 'Unique Id($value)';
  }
}
