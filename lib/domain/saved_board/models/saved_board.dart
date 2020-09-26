import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/domain/core/value_objects/unique_id.dart';
import 'package:twozerofoureight/domain/puzzle/models/puzzle/puzzle.dart';
part 'saved_board.freezed.dart';

@freezed
abstract class SavedBoard with _$SavedBoard {
  const factory SavedBoard(
      {@required UniqueId id,
      @required BoardOption option,
      @required Puzzle puzzle}) = _SavedBoard;
}
