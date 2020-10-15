import 'package:flutter/material.dart';
import 'package:twozerofoureight/helpers/get_app_version.dart';
import 'package:twozerofoureight/presentation/core/my_icons.dart';
import 'package:twozerofoureight/presentation/core/widgets/custom_icon.dart';
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
                CustomIconButton(
                  icon: Icon(MyIcons.home),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 30),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Icon(MyIcons.logo2, size: 80),
                        SizedBox(height: 20),
                        Text("How to play",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600)),
                        SizedBox(height: 20),
                        Text(
                          gameInstruction,
                          style: TextStyle(fontSize: 22, height: 1.5),
                        )
                      ],
                    ),
                  ),
                ),
                FutureBuilder<String>(
                  future: getAppVersion(),
                  builder: (_, snapshot) {
                    String version = "";
                    if (snapshot.hasData) {
                      version = "Version ${snapshot.data}";
                    }

                    return Text(version,
                        style: TextStyle(
                            fontSize: 12, fontStyle: FontStyle.italic));
                  },
                ),
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
