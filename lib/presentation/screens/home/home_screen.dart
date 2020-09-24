import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/presentation/screens/home/widgets/board_option_wheel.dart';
import "../../../application/high_score_manager/high_score_manager_cubit.dart";
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
    return SizedBox(
        height: 200,
        child: BlocBuilder<BoardOptionCubit, BoardOptionState>(
            builder: (_, state) {
          return BoardOptionWheel(
            currentIndex: state.currentOptionIndex,
            isLoading: state.isLoading,
            options: state.options,
            onChange: (index) => _onOptionChange(context, index),
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
                puzzleCubit: PuzzleCubit(
                    highScoreManagerCubit:
                        BlocProvider.of<HighScoreManagerCubit>(context))
                  ..init(currentOption.size))));
  }
}
