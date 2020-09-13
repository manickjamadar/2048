import 'dart:math';
import 'package:twozerofoureight/domain/core/logic/action_runner/block_action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/actor/block_actor.dart';
import 'package:twozerofoureight/domain/core/logic/block_actors/make_old_actor.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/has_any_empty_blocks.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/helpers/list_extensions.dart';

///if any empty blocks present in current block list .Then it choose a random position and create a random block
class GenerateRandomBlockActor extends BlockActor {
  final int count;

  const GenerateRandomBlockActor(List<Block> blocks, {this.count = 1})
      : super(blocks);
  @override
  List<Block> act() {
    if (count < 1 || !hasAnyEmptyBlocks(blocks)) {
      return blocks;
    }
    final List<Block> newBlocks = BlockActionRunner(MakeOldActor(blocks)).run();
    for (var i = 0; i < count; i++) {
      List<int> emptyBlockIndexes = [];
      newBlocks.indexedMap((index, block) {
        if (block.isEmpty) {
          emptyBlockIndexes.add(index);
        }
        return block;
      });
      final randomIndex = Random().nextInt(emptyBlockIndexes.length);
      final randomBlockIndex = emptyBlockIndexes[randomIndex];
      newBlocks[randomBlockIndex] = newBlocks[randomBlockIndex].toRandom();
    }
    return newBlocks;
  }
}
