import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

bool hasAnyEmptyBlocks(List<Block> blocks) {
  return blocks.any((block) => block.isEmpty);
}
