import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:twozerofoureight/domain/core/logic/block_action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/block_actors/block_actor.dart';
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
}
