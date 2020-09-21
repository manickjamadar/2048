part of 'board_option_cubit.dart';

@freezed
abstract class BoardOptionState with _$BoardOptionState {
  const factory BoardOptionState(
      {@required int currentOptionIndex,
      @required List<BoardOption> options}) = _BoardOptionState;
  factory BoardOptionState.initial() {
    return BoardOptionState(currentOptionIndex: 0, options: [
      BoardOption(title: "Tiny", size: BoardSize(3)),
      BoardOption(title: "Classic", size: BoardSize(4)),
      BoardOption(title: "Big", size: BoardSize(5)),
      BoardOption(title: "Bigger", size: BoardSize(6)),
      BoardOption(title: "Huge", size: BoardSize(7)),
    ]);
  }
}
