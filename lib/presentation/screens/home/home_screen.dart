import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/application/theme_color/theme_color_cubit.dart';
import 'package:twozerofoureight/presentation/core/widgets/custom_button.dart';
import 'package:twozerofoureight/presentation/core/widgets/fade_route.dart';
import 'package:twozerofoureight/presentation/core/widgets/theme_background_view.dart';
import 'package:twozerofoureight/presentation/screens/home/widgets/board_option_wheel.dart';
import 'package:twozerofoureight/presentation/screens/home/widgets/theme_color_picker.dart';
import "../../../application/high_score_manager/high_score_manager_cubit.dart";
import 'package:twozerofoureight/presentation/core/my_icons.dart';
import 'package:twozerofoureight/presentation/screens/about/about_screen.dart';
import 'package:twozerofoureight/presentation/screens/play/play_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ThemeBackgroundView(
      child: SafeArea(
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
                  onPressed: () => _onPickTheme(context),
                ),
                IconButton(
                  icon: Icon(MyIcons.about),
                  onPressed: () {
                    Navigator.push(
                        context, FadeRoute(page: AboutScreen.generateRoute()));
                  },
                ),
                IconButton(
                  icon: Icon(MyIcons.save),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
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
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<BoardOptionCubit, BoardOptionState>(
      builder: (_, state) {
        return Container(
          width: screenWidth * 0.6,
          child: CustomButton(
            child: Text(
              "Play",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () => _onPlay(context, state),
          ),
        );
      },
    );
  }

  void _onPickTheme(BuildContext context) async {
    final state = BlocProvider.of<ThemeColorCubit>(context).state;
    final int newIndex = await showDialog(
        context: context,
        builder: (_) => ThemeColorPicker(
              themeColors: state.themeColors,
              currentIndex: state.currentIndex,
            ));
    if (newIndex != null) {
      _onThemeChange(context, newIndex);
    }
  }

  void _onThemeChange(BuildContext context, int index) {
    BlocProvider.of<ThemeColorCubit>(context).change(index);
  }

  void _onOptionChange(BuildContext context, int index) {
    BlocProvider.of<BoardOptionCubit>(context).change(index);
  }

  void _onPlay(BuildContext context, BoardOptionState state) {
    final currentOption = state.options[state.currentOptionIndex];
    Navigator.push(
        context,
        FadeRoute(
            page: PlayScreen.generateRoute(
                puzzleCubit: PuzzleCubit(
                    highScoreManagerCubit:
                        BlocProvider.of<HighScoreManagerCubit>(context))
                  ..init(currentOption.size))));
  }
}
