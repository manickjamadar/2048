part of 'board_option_cubit.dart';

@freezed
abstract class BoardOptionState implements _$BoardOptionState {
  const BoardOptionState._();
  const factory BoardOptionState(
      {@required int currentOptionIndex,
      @required bool isLoading,
      @required List<BoardOption> options}) = _BoardOptionState;
  factory BoardOptionState.initial() {
    return BoardOptionState(isLoading: true, currentOptionIndex: 1, options: [
      BoardOption(title: "Tiny", size: BoardSize(3)),
      BoardOption(title: "Classic", size: BoardSize(4)),
      BoardOption(title: "Big", size: BoardSize(5)),
      BoardOption(title: "Bigger", size: BoardSize(6)),
      BoardOption(title: "Biggest", size: BoardSize(7)),
      BoardOption(title: "Giant", size: BoardSize(8)),
    ]);
  }

  BoardOption get currentOption => options[currentOptionIndex];
}
