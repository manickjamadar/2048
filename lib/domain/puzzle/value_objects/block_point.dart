import 'dart:math';

import 'package:equatable/equatable.dart';

class BlockPoint extends Equatable {
  final int value;
  const BlockPoint._(this.value);

  factory BlockPoint.random() {
    return Random().nextBool() ? BlockPoint.two : BlockPoint.four;
  }

  BlockPoint mergedPoint() => BlockPoint._(this.value + this.value);

  static BlockPoint two = BlockPoint._(2);
  static BlockPoint four = BlockPoint._(4);
  static BlockPoint empty = BlockPoint._(0);

  @override
  List<Object> get props => [value];

  @override
  String toString() {
    return 'BlockPoint($value)';
  }
}
