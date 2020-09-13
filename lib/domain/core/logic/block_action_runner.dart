import 'package:twozerofoureight/domain/core/logic/block_actors/block_actor.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

///Runner responsibility is to run and give back the blocks which is modified by actors
class BlockActionRunner {
  final BlockActor actor;

  const BlockActionRunner(this.actor);
  List<Block> run() {
    return actor.act();
  }

  BlockActionRunner chain(BlockActor Function(List<Block> blocks) actor) {
    return BlockActionRunner(actor(run()));
  }
}
