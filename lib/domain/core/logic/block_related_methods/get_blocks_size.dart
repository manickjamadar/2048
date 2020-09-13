import 'package:dartz/dartz.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/is_board_form.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

///return boardsize if length of blocks list is matched with blocks index size's total size and every blocks index size should be the same size ,
/// otherwise it will return none;
Option<BoardSize> getBlocksSize(List<Block> blocks) {
  if (isBoardForm(blocks)) {
    return Some(BoardSize(blocks[0].index.size.value));
  } else {
    return None();
  }
}
