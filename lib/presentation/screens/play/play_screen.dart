import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/presentation/core/my_icons.dart';
import 'package:twozerofoureight/presentation/core/widgets/board_viewer.dart';
import "package:twozerofoureight/application/high_score_manager/high_score_manager_cubit.dart";
import 'package:twozerofoureight/presentation/core/widgets/custom_icon.dart';
import 'package:twozerofoureight/presentation/core/widgets/score_board.dart';
import 'package:twozerofoureight/presentation/core/widgets/theme_background_view.dart';
import 'package:twozerofoureight/presentation/screens/play/reset_dialog.dart';

class PlayScreen extends StatelessWidget {
  static const String routeName = "/play";
  static Widget generateRoute({@required PuzzleCubit puzzleCubit}) {
    return BlocProvider(create: (_) => puzzleCubit, child: PlayScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ThemeBackgroundView(
      child: SafeArea(
        child: Column(
          children: [
            Icon(MyIcons.logo, size: 50),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<HighScoreManagerCubit, HighScoreManagerState>(
                    builder: (_, state) => ScoreBoard(
                      title: "High Score",
                      score: state.score,
                    ),
                  ),
                  CustomIconButton(
                    icon: Icon(MyIcons.home),
                    onPressed: () => _goHome(context),
                  ),
                  BlocBuilder<PuzzleCubit, PuzzleState>(
                    builder: (_, state) => ScoreBoard(
                      title: "Score",
                      score: state.score,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomIconButton(
                        icon: Icon(MyIcons.reset),
                        onPressed: () => _resetBoard(context),
                        margin: EdgeInsets.only(right: 10),
                      ),
                      CustomIconButton(
                        icon: Icon(MyIcons.music),
                        onPressed: () {},
                        margin: EdgeInsets.only(right: 10),
                      ),
                      CustomIconButton(
                        icon: Icon(MyIcons.save),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  BlocBuilder<PuzzleCubit, PuzzleState>(builder: (_, state) {
                    return CustomIconButton(
                      icon: Icon(MyIcons.undo),
                      onPressed: state.previousBoard
                          .fold(() => null, (a) => () => _undoMove(context)),
                    );
                  })
                ],
              ),
            ),
            BlocBuilder<PuzzleCubit, PuzzleState>(
              builder: (_, state) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BoardViewer(),
                );
              },
            )
          ],
        ),
      ),
    ));
  }

  void _resetBoard(BuildContext context) async {
    final bool shouldReset =
        await showDialog(context: context, builder: (_) => ResetDialog());
    if (shouldReset != null && shouldReset == true) {
      BlocProvider.of<PuzzleCubit>(context).reset();
    }
  }

  void _goHome(BuildContext context) {
    Navigator.pop(context);
  }

  void _undoMove(BuildContext context) {
    BlocProvider.of<PuzzleCubit>(context).undo();
  }
}
