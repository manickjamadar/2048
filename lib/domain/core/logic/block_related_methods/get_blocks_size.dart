import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

///return boardsize if length of blocks list is matched with blocks index size's total size and every blocks index size should be the same size ,
/// otherwise it will return none;
Option<BoardSize> getBlocksSize(List<Block> blocks) {
  int sizeValue = sqrt(blocks.length).truncate().toInt();
  for (var i = 0; i < blocks.length; i++) {
    final block = blocks[i];
    if (block.index.size.value != sizeValue) {
      return None();
    }
  }
  return Some(BoardSize(sizeValue));
}
