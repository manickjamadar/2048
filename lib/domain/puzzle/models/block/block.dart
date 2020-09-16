import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_point.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/domain/core/value_objects/unique_id.dart';
part 'block.freezed.dart';

@freezed
abstract class Block implements _$Block {
  const Block._();
  const factory Block(
      {@required UniqueId id,
      @required BlockIndex index,
      @required BlockPoint point,
      @Default(false) bool isNew}) = _Block;

  factory Block.empty({@required int index, @required int boardSize}) {
    return Block(
        id: UniqueId(),
        point: BlockPoint.empty,
        index: BlockIndex(value: index, size: BoardSize(boardSize)));
  }

  factory Block.random({@required int index, @required int boardSize}) {
    return Block(
        id: UniqueId(),
        isNew: true,
        point: BlockPoint.random(),
        index: BlockIndex(value: index, size: BoardSize(boardSize)));
  }

  bool get isEmpty => point == BlockPoint.empty;
  bool isPositionEmpty(int positionIndex) =>
      isEmpty || isDetached(positionIndex);

  bool isDetached(int positionIndex) => this.index.value != positionIndex;

  Block detach(int index) {
    return this
        .copyWith(index: BlockIndex(size: this.index.size, value: index));
  }

  Block toMerged() {
    return Block(
        id: UniqueId(), index: this.index, point: this.point.mergedPoint());
  }

  Block toRandom() {
    return Block(
        id: UniqueId(),
        index: this.index,
        point: BlockPoint.random(),
        isNew: true);
  }

  bool hasSamePoint(Block block) => this.point.value == block.point.value;
}
