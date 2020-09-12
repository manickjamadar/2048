import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/shared/helpers/board_direction.dart';

class BlockIndex extends Equatable {
  final int value;
  final BoardSize size;

  BlockIndex({@required this.value, @required this.size})
      : assert(value >= 0 && value < size.totalSize);

  @override
  List<Object> get props => [value, size];

  bool hasNext(BoardDirection direction) {
    return direction.when(
      right: () => (value + 1) % size.value != 0,
      left: () => (value % size.value) != 0,
      up: () => (value >= size.value),
      down: () => value < (size.value * (size.value - 1)),
    );
  }

  BlockIndex next(BoardDirection direction) {
    final hasNextIndex = hasNext(direction);
    if (!hasNextIndex) {
      return null;
    }
    return BlockIndex(
        size: size,
        value: direction.when(
          right: () => value + 1,
          left: () => value - 1,
          down: () => value + size.value,
          up: () => value - size.value,
        ));
  }

  BlockIndex copy() {
    return BlockIndex(size: BoardSize(this.size.value), value: this.value);
  }
}
