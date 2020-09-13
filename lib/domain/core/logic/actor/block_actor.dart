import 'package:twozerofoureight/domain/core/logic/actor/actor.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

/// [BlockActor] responsible for acting on list of blocks and return modified blocks
abstract class BlockActor extends Actor<List<Block>> {
  final List<Block> blocks;
  const BlockActor(this.blocks) : super(blocks);
  List<Block> act();
}
