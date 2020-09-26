import 'dart:math';

import 'package:equatable/equatable.dart';

class BlockPoint extends Equatable {
  final int value;
  const BlockPoint(this.value);

  factory BlockPoint.random() {
    return Random().nextBool() ? BlockPoint.two : BlockPoint.four;
  }

  BlockPoint mergedPoint() => BlockPoint(this.value + this.value);

  static BlockPoint two = BlockPoint(2);
  static BlockPoint four = BlockPoint(4);
  static BlockPoint empty = BlockPoint(0);

  @override
  List<Object> get props => [value];

  @override
  String toString() {
    return 'BlockPoint($value)';
  }
}
