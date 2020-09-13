import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

/// determine whether the list of blocks formed a proper board sturcture.
/// If blocks has length in sqrt structure and size of each block is same and equal to length squrt then it considered proper board form.
bool isBoardForm(List<Block> blocks) {
  if (blocks.isEmpty) {
    return false;
  }
  return blocks.every((block) => block.index.size.totalSize == blocks.length);
}
