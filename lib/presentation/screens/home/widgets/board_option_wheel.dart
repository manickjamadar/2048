import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';

class BoardOptionWheel extends StatelessWidget {
  final int currentIndex;
  final List<BoardOption> options;
  final bool isLoading;
  final void Function(int index) onChange;
  const BoardOptionWheel(
      {Key key,
      @required this.currentIndex,
      @required this.options,
      @required this.isLoading,
      this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 30, color: Colors.red);
    return ListWheelScrollView(
      key: ValueKey(isLoading),
      controller: FixedExtentScrollController(initialItem: currentIndex),
      overAndUnderCenterOpacity: 0.2,
      onSelectedItemChanged: (int index) {
        if (onChange != null) {
          onChange(index);
        }
      },
      clipBehavior: Clip.none,
      itemExtent: 50,
      children: options
          .map((option) => Text(
              "${option.title} ${option.size.value} x ${option.size.value}",
              style: style))
          .toList(),
    );
  }
}
