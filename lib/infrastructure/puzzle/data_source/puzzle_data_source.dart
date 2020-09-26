import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/domain/core/logic/action_runner/action_runner.dart';
import 'package:twozerofoureight/domain/core/logic/block_actors/generate_random_block_actor.dart';
import 'package:twozerofoureight/domain/core/logic/block_related_methods/generate_empty_blocks.dart';
import 'package:twozerofoureight/domain/puzzle/data_source/puzzle_data_source.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/models/puzzle/puzzle.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';
import 'package:twozerofoureight/infrastructure/puzzle/entities/puzzle/puzzle_entity.dart';

class PuzzleDataSource extends IPuzzleDataSource {
  final Box<String> box;

  PuzzleDataSource(this.box);
  @override
  Future<PuzzleEntity> get(BoardOption option) async {
    final emptyBlocks = generateEmptyBlocks(option.size);
    final defaultBoard = Board(
        blocks: ActionRunner(GenerateRandomBlockActor(emptyBlocks, count: 2))
            .run());
    final defaultPuzzle = Puzzle(
        board: defaultBoard,
        isGameOver: false,
        previousBoard: None(),
        score: BoardScore(0));
    final defaultPuzzleEntity = PuzzleEntity.fromModel(defaultPuzzle);
    final String defaultRawJson = jsonEncode(defaultPuzzleEntity.toJson());

    final String rawResultJson =
        box.get(option.size.value, defaultValue: defaultRawJson);
    final Map<String, dynamic> puzzleEntityJson =
        jsonDecode(rawResultJson) as Map<String, dynamic>;
    return PuzzleEntity.fromJson(puzzleEntityJson);
  }

  @override
  Future<void> save(PuzzleEntity entity, BoardOption option) async {
    final rawJson = jsonEncode(entity.toJson());
    await box.put(option.size.value, rawJson);
  }
}
