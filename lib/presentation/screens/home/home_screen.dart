import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/application/theme_color/theme_color_cubit.dart';
import 'package:twozerofoureight/presentation/core/widgets/custom_button.dart';
import 'package:twozerofoureight/presentation/core/widgets/custom_icon.dart';
import 'package:twozerofoureight/presentation/core/widgets/fade_route.dart';
import 'package:twozerofoureight/presentation/core/widgets/theme_background_view.dart';
import 'package:twozerofoureight/presentation/screens/home/widgets/board_option_wheel.dart';
import 'package:twozerofoureight/presentation/screens/home/widgets/theme_color_picker.dart';
import 'package:twozerofoureight/presentation/screens/saved_board/saved_board_screen.dart';
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
                GestureDetector(
                  onLongPress: () => _onPickTheme(context),
                  child: CustomIconButton(
                    icon: Icon(MyIcons.colorPallete),
                    onPressed: () => _goNextTheme(context),
                    margin: EdgeInsets.all(10),
                  ),
                ),
                CustomIconButton(
                  icon: Icon(MyIcons.about),
                  margin: EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.push(
                        context, FadeRoute(page: AboutScreen.generateRoute()));
                  },
                ),
                CustomIconButton(
                  icon: Icon(MyIcons.save),
                  onPressed: () => _goToSavedBoard(context),
                  margin: EdgeInsets.all(10),
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
            onPressed: () => _onPlay(context),
          ),
        );
      },
    );
  }

  void _goNextTheme(BuildContext context) {
    BlocProvider.of<ThemeColorCubit>(context).next();
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

  void _onPlay(BuildContext context) {
    Navigator.push(
        context,
        FadeRoute(
            page: PlayScreen.generateRoute(
                puzzleCubit: BlocProvider.of<PuzzleCubit>(context))));
  }

  void _goToSavedBoard(BuildContext context) {
    Navigator.push(context, FadeRoute(page: SavedBoardScreen.generateRoute()));
  }
}
