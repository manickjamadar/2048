import 'package:equatable/equatable.dart';

class BoardSize extends Equatable {
  final int value;
  const BoardSize(this.value) : assert(value > 2);

  int get totalSize => value * value;

  @override
  List<Object> get props => [value];

  @override
  String toString() {
    return 'BoardSize($value)';
  }
}
