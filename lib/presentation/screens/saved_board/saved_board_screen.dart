import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/application/saved_board/saved_board_cubit.dart';
import 'package:twozerofoureight/domain/puzzle/facade/puzzle_facade.dart';
import 'package:twozerofoureight/domain/saved_board/models/saved_board.dart';
import 'package:twozerofoureight/presentation/core/my_icons.dart';
import 'package:twozerofoureight/presentation/core/widgets/fade_route.dart';
import 'package:twozerofoureight/presentation/core/widgets/theme_background_view.dart';
import 'package:twozerofoureight/presentation/screens/play/play_screen.dart';

class SavedBoardScreen extends StatelessWidget {
  static const String routeName = "/saved_board";
  static Widget generateRoute({@required SavedBoardCubit savedBoardCubit}) {
    return BlocProvider.value(
        value: savedBoardCubit, child: SavedBoardScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Saved Board"),
      ),
      body: ThemeBackgroundView(
        child: SafeArea(child: BlocBuilder<SavedBoardCubit, SavedBoardState>(
          builder: (_, state) {
            return state.when(
                inital: () => Center(child: CircularProgressIndicator()),
                loaded: (boards) {
                  if (boards.isEmpty) {
                    return Center(
                      child: Text("No Saved Board available"),
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (_, index) {
                      final board = boards[index];
                      return ListTile(
                        onTap: () => _onPlay(context, board),
                        leading: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.3),
                          child: Icon(
                            MyIcons.play,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                            "${board.option.title} ${board.option.size.value} x ${board.option.size.value}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            "Highest Point: ${board.puzzle.board.highestPoint.value} - Score: ${board.puzzle.score.value}",
                            style:
                                TextStyle(fontSize: 13, color: Colors.white)),
                        trailing: Builder(builder: (context) {
                          return IconButton(
                            icon: Icon(MyIcons.delete),
                            onPressed: () => _onDelete(context, board),
                          );
                        }),
                      );
                    },
                    itemCount: boards.length,
                  );
                },
                error: () => Center(child: Text("Something went wrong")));
          },
        )),
      ),
    );
  }

  void _onDelete(BuildContext context, SavedBoard savedBoard) async {
    final cubit = BlocProvider.of<SavedBoardCubit>(context);
    final deleteCompleter = Completer<bool>();
    final snackBarDuration = Duration(seconds: 3);
    cubit.delete(savedBoard.id, deleteCompleter.future);
    Scaffold.of(context).showSnackBar(SnackBar(
      content:
          Text("Deleted Successfully", style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.green,
      duration: snackBarDuration,
      action: SnackBarAction(
        label: "Undo",
        textColor: Colors.white,
        onPressed: () {
          deleteCompleter.complete(false);
          cubit.undo();
        },
      ),
    ));
    await Future.delayed(snackBarDuration, () {
      if (!deleteCompleter.isCompleted) {
        deleteCompleter.complete(true);
      }
    });
  }

  void _onPlay(BuildContext context, SavedBoard savedBoard) {
    Navigator.push(
        context,
        FadeRoute(
            page: PlayScreen.generateRoute(
                puzzleCubit: BlocProvider.of<PuzzleCubit>(context)
                  ..initWithBoard(
                      savedBoard.puzzle.board, savedBoard.puzzle.score,
                      previousBoard: savedBoard.puzzle.previousBoard))));
  }
}
