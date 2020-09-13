import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

/// [BlockActor] responsible for acting on list of blocks and return modified blocks
abstract class BlockActor {
  final List<Block> blocks;
  const BlockActor(this.blocks);
  List<Block> act();
}
