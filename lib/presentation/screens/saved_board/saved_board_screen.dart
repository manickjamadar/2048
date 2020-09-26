import 'package:flutter/material.dart';
import 'package:twozerofoureight/presentation/core/widgets/theme_background_view.dart';

class SavedBoardScreen extends StatelessWidget {
  static const String routeName = "/saved_board";
  static Widget generateRoute() {
    return SavedBoardScreen();
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
        child: SafeArea(child: Center(child: Text("Saved Board"))),
      ),
    );
  }
}
