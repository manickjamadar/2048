import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/presentation/core/my_icons.dart';
import 'package:twozerofoureight/presentation/screens/about/about_screen.dart';
import 'package:twozerofoureight/presentation/screens/play/play_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(MyIcons.logo, size: 100),
          buildBoardOptionWheel(context),
          buildPlayButton(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(MyIcons.colorPallete),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(MyIcons.about),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AboutScreen.generateRoute()));
                },
              ),
              IconButton(
                icon: Icon(MyIcons.save),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(MyIcons.share),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    ));
  }

  Widget buildBoardOptionWheel(BuildContext context) {
    final style = TextStyle(fontSize: 30, color: Colors.red);
    return SizedBox(
        height: 200,
        child: BlocBuilder<BoardOptionCubit, BoardOptionState>(
            builder: (_, state) {
          return ListWheelScrollView(
            controller: FixedExtentScrollController(
                initialItem: state.currentOptionIndex),
            overAndUnderCenterOpacity: 0.2,
            onSelectedItemChanged: (int index) =>
                _onOptionChange(context, index),
            clipBehavior: Clip.none,
            itemExtent: 50,
            children: state.options
                .map((option) => Text(
                    "${option.title} ${option.size.value} x ${option.size.value}",
                    style: style))
                .toList(),
          );
        }));
  }

  Widget buildPlayButton(BuildContext context) {
    return BlocBuilder<BoardOptionCubit, BoardOptionState>(
      builder: (_, state) {
        return RaisedButton(
          child: Text("Play"),
          onPressed: () => _onPlay(context, state),
        );
      },
    );
  }

  void _onOptionChange(BuildContext context, int index) {
    BlocProvider.of<BoardOptionCubit>(context).change(index);
  }

  void _onPlay(BuildContext context, BoardOptionState state) {
    final currentOption = state.options[state.currentOptionIndex];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PlayScreen.generateRoute(
                puzzleCubit: PuzzleCubit()..init(currentOption.size))));
  }
}
