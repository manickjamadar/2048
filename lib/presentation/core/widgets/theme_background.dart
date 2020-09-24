import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/theme_color/models/theme_color.dart';

class ThemeBackground extends StatelessWidget {
  final ThemeColor themeColor;
  final Widget child;
  const ThemeBackground({
    Key key,
    @required this.themeColor,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [themeColor.first, themeColor.second],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: child,
    );
  }
}
