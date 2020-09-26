part of 'saved_board_cubit.dart';

@freezed
abstract class SavedBoardState with _$SavedBoardState {
  const factory SavedBoardState.inital() = _Initial;
  const factory SavedBoardState.loaded(
      {@required List<SavedBoard> savedBoards}) = _Loaded;
  const factory SavedBoardState.error() = _Error;
}
