import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

List<Block> generateEmptyBlocks(BoardSize size) {
  return List<Block>.generate(size.totalSize,
      (index) => Block.empty(index: index, boardSize: size.value));
}
