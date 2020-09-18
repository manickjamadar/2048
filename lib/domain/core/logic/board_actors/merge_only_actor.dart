import 'package:flutter/foundation.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/actor/board_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/board_loop_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_actors/line_merge_only_actor.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';

class MergeOnlyActor extends BoardActor {
  final BoardDirection direction;
  const MergeOnlyActor(Board board, {@required this.direction}) : super(board);
  @override
  Board act() {
    return ActionRunner(BoardLoopActor(board,
        direction: direction,
        actor: (Board newBoard, BlockIndex startIndex) => LineMergeOnlyActor(
            newBoard,
            direction: direction,
            startIndex: startIndex))).run();
  }
}
