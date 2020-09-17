import 'package:flutter/foundation.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/actor/board_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/board_loop_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/line_merge_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';

class MergeActor extends BoardActor {
  final BoardDirection direction;
  const MergeActor(Board board, {@required this.direction}) : super(board);
  @override
  Board act() {
    return ActionRunner(BoardLoopActor(board,
        direction: direction,
        actor: (Board newBoard, BlockIndex startIndex) => LineMergeActor(
            newBoard,
            direction: direction,
            startIndex: startIndex))).run();
  }
}
