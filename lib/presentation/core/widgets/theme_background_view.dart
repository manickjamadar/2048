import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/theme_color/theme_color_cubit.dart';
import 'package:twozerofoureight/presentation/core/widgets/theme_background.dart';

class ThemeBackgroundView extends StatelessWidget {
  final Widget child;

  const ThemeBackgroundView({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeColorCubit, ThemeColorState>(
      builder: (_, state) {
        return ThemeBackground(
            child: child, themeColor: state.currentThemeColor);
      },
    );
  }
}
