import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/block_action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/actor/block_actor.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

// Mock block actor class
class MockBlockActor extends Mock implements BlockActor {}

void main() {
  BlockActor actor;
  setUp(() {
    actor = MockBlockActor();
  });

  test("should run actor act method", () {
    BlockActionRunner(actor).run();
    verify(actor.act()).called(1);
  });

  test("should give back modified list of blocks", () {
    final modifiedBlocks = [
      Block.random(index: 3, boardSize: 5),
      Block.random(index: 4, boardSize: 5),
      Block.random(index: 5, boardSize: 5),
      Block.random(index: 6, boardSize: 5),
    ];
    when(actor.act()).thenReturn(modifiedBlocks);

    expect(BlockActionRunner(actor).run(), modifiedBlocks);
    verify(actor.act());
    verifyNoMoreInteractions(actor);
  });

  test("should work chaining on actors correctly", () {
    final modifiedBlocks1 = [
      Block.random(index: 3, boardSize: 4),
      Block.random(index: 5, boardSize: 4),
      Block.random(index: 6, boardSize: 4),
    ];
    final modifiedBlocks2 = [
      Block.random(index: 3, boardSize: 4),
      Block.random(index: 5, boardSize: 4).toMerged(),
      Block.random(index: 6, boardSize: 4),
    ];
    final modifiedBlocks3 = [
      Block.random(index: 3, boardSize: 4).toMerged(),
      Block.random(index: 5, boardSize: 4).toMerged().toMerged(),
      Block.random(index: 6, boardSize: 4),
    ];
    final actor2 = MockBlockActor();
    final actor3 = MockBlockActor();

    when(actor.act()).thenReturn(modifiedBlocks1);
    when(actor2.act()).thenReturn(modifiedBlocks2);
    when(actor3.act()).thenReturn(modifiedBlocks3);

    final lastModifiedBlocks = BlockActionRunner(actor).chain((blocks) {
      expect(blocks, equals(modifiedBlocks1));
      return actor2;
    }).chain((blocks) {
      expect(blocks, equals(modifiedBlocks2));
      return actor3;
    }).run();
    expect(lastModifiedBlocks, equals(modifiedBlocks3));
    verify(actor.act()).called(1);
    verify(actor2.act()).called(1);
    verify(actor3.act()).called(1);
  });
}
