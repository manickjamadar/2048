import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

List<Block> getEmptyBlocks(List<Block> blocks) {
  return blocks.where((block) => block.isEmpty).toList();
}
