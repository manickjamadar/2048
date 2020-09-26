import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/core/value_objects/unique_id.dart';
import 'package:twozerofoureight/domain/saved_board/models/saved_board.dart';
import 'package:twozerofoureight/infrastructure/board_option/entities/board_option_entity.dart';
import 'package:twozerofoureight/infrastructure/puzzle/entities/puzzle/puzzle_entity.dart';

part 'saved_board_entity.freezed.dart';
part 'saved_board_entity.g.dart';

@freezed
abstract class SavedBoardEntity implements _$SavedBoardEntity {
  const SavedBoardEntity._();
  @JsonSerializable(explicitToJson: true)
  const factory SavedBoardEntity(
      {@required
          String id,
      @JsonKey(name: "board_option_entity")
      @required
          BoardOptionEntity boardOptionEntity,
      @JsonKey(name: "puzzle_entity")
      @required
          PuzzleEntity puzzleEntity}) = _SavedBoardEntity;

  factory SavedBoardEntity.fromModel(SavedBoard savedBoard) {
    return SavedBoardEntity(
        id: savedBoard.id.value,
        boardOptionEntity: BoardOptionEntity.fromModel(savedBoard.option),
        puzzleEntity: PuzzleEntity.fromModel(savedBoard.puzzle));
  }

  SavedBoard toModel() {
    return SavedBoard(
        id: UniqueId.fromString(id),
        option: boardOptionEntity.toModel(),
        puzzle: puzzleEntity.toModel());
  }

  factory SavedBoardEntity.fromJson(Map<String, dynamic> json) =>
      _$SavedBoardEntityFromJson(json);
}
