import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/presentation/core/my_icons.dart';
import 'package:twozerofoureight/presentation/core/widgets/board_viewer.dart';
import "package:twozerofoureight/application/high_score_manager/high_score_manager_cubit.dart";
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("High Score"),
                    BlocBuilder<HighScoreManagerCubit, HighScoreManagerState>(
                      builder: (_, state) => Text("${state.score.value}"),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(MyIcons.home),
                  onPressed: () => _goHome(context),
                ),
                Column(
                  children: [
                    Text("Score"),
                    BlocBuilder<PuzzleCubit, PuzzleState>(
                      builder: (_, state) => Text("${state.score.value}"),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(MyIcons.reset),
                      onPressed: () => _resetBoard(context),
                    ),
                    IconButton(
                      icon: Icon(MyIcons.music),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(MyIcons.save),
                      onPressed: () {},
                    ),
                  ],
                ),
                BlocBuilder<PuzzleCubit, PuzzleState>(builder: (_, state) {
                  return IconButton(
                    icon: Icon(MyIcons.undo),
                    onPressed: state.previousBoard
                        .fold(() => null, (a) => () => _undoMove(context)),
                  );
                })
              ],
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
