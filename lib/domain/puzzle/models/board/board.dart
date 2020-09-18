import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/generate_empty_blocks.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/get_blocks_size.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/get_empty_blocks.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/is_board_form.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/slide_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
part 'board.freezed.dart';

@freezed
abstract class Board implements _$Board {
  const Board._();
  const factory Board({@required List<Block> blocks}) = _Board;

  factory Board.empty(BoardSize size) {
    return Board(blocks: generateEmptyBlocks(size));
  }

  bool get isValid => isBoardForm(blocks);

  BoardSize get size => getBlocksSize(blocks).fold(() => null, id);

  bool get isEmpty => getEmptyBlocks(blocks).length == size.totalSize;

  bool get slidable {
    if (!isValid) {
      return false;
    }
    final allDirection = [
      BoardDirection.up(),
      BoardDirection.down(),
      BoardDirection.left(),
      BoardDirection.right(),
    ];
    for (var i = 0; i < allDirection.length; i++) {
      final direction = allDirection[i];
      final slidedBoard =
          ActionRunner(SlideActor(this, direction: direction)).run();
      if (slidedBoard != this) {
        return true;
      }
    }
    return false;
  }
}
