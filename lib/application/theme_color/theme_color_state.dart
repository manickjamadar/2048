part of 'theme_color_cubit.dart';

@freezed
abstract class ThemeColorState implements _$ThemeColorState {
  const ThemeColorState._();
  const factory ThemeColorState(
      {@required int currentIndex,
      @required List<ThemeColor> themeColors}) = _ThemeColorState;
  factory ThemeColorState.initial() {
    return ThemeColorState(
        currentIndex: 0,
        themeColors: [ThemeColor(first: Colors.blue, second: Colors.indigo)]);
  }

  ThemeColor get currentThemeColor => themeColors[currentIndex];
}
