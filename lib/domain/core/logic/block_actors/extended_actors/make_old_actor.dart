import 'package:twozerofoureight/domain/core/logic/block_actors/block_actor.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

class MakeOldActor extends BlockActor {
  const MakeOldActor(List<Block> blocks) : super(blocks);

  @override
  List<Block> act() {
    return blocks.map((e) => e.copyWith(isNew: false)).toList();
  }
}
