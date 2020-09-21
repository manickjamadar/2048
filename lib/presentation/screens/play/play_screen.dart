import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/presentation/core/my_icons.dart';
import 'package:twozerofoureight/presentation/core/widgets/board_viewer.dart';

class PlayScreen extends StatelessWidget {
  static const String routeName = "/play";
  static Widget generateRoute({@required PuzzleCubit puzzleCubit}) {
    return BlocProvider(create: (_) => puzzleCubit, child: PlayScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Icon(MyIcons.logo, size: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [Text("Score"), Text("2967")],
              ),
              IconButton(
                icon: Icon(MyIcons.home),
                onPressed: () {},
              ),
              Column(
                children: [Text("High Score"), Text("52267")],
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
              IconButton(
                icon: Icon(MyIcons.undo),
                onPressed: () {},
              )
            ],
          ),
          BoardViewer()
        ],
      ),
    ));
  }

  void _resetBoard(BuildContext context) {
    BlocProvider.of<PuzzleCubit>(context).reset();
  }
}
