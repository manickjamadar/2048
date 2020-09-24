import 'package:flutter/material.dart';
import 'package:twozerofoureight/presentation/core/my_icons.dart';
import 'package:twozerofoureight/presentation/core/widgets/theme_background_view.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = "/about";
  static Widget generateRoute() {
    return AboutScreen();
  }

  @override
  Widget build(BuildContext context) {
    final gameInstruction =
        '''Join the numbers and get to the 2048 tile. Swipe to move all tiles.When two tiles with the same number touch, they merge into one.Get to the 2048 tile and reach a high score.
    ''';
    return Scaffold(
      body: ThemeBackgroundView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                IconButton(
                  icon: Icon(MyIcons.home),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                    child: Center(
                        child: Text(
                  gameInstruction,
                  style: TextStyle(fontSize: 22, height: 1.5),
                ))),
                Text("Version 1.0.0",
                    style:
                        TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
                Text(
                  "Created by Creanick",
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
