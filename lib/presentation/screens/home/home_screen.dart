import 'package:flutter/material.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/presentation/core/my_icons.dart';
import 'package:twozerofoureight/presentation/screens/play/play_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 30, color: Colors.red);
    final boards = [
      "Tiny 3x3",
      "Classic 4x4",
      "Big 5x5",
      "Bigger 6x6",
      "Huge 7x7"
    ];
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(MyIcons.logo, size: 100),
          SizedBox(
              height: 200,
              child: ListWheelScrollView(
                controller: FixedExtentScrollController(initialItem: 3),
                overAndUnderCenterOpacity: 0.2,
                clipBehavior: Clip.none,
                onSelectedItemChanged: (value) {
                  print(value);
                },
                itemExtent: 50,
                children:
                    boards.map((board) => Text(board, style: style)).toList(),
              )),
          RaisedButton(
            child: Text("Play"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PlayScreen.generateRoute(
                          puzzleCubit: PuzzleCubit()..init(BoardSize(4)))));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(MyIcons.colorPallete),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(MyIcons.rating),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(MyIcons.about),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(MyIcons.save),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    ));
  }
}
