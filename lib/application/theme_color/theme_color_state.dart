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
      themeColors: [
        ThemeColor(
          first: Color.fromRGBO(87, 194, 208, 1),
          second: Color.fromRGBO(0, 118, 184, 1),
        ),
        ThemeColor(
          first: Color.fromRGBO(133, 208, 87, 1),
          second: Color.fromRGBO(0, 184, 184, 1),
        ),
        ThemeColor(
          first: Color.fromRGBO(233, 79, 125, 1),
          second: Color.fromRGBO(242, 157, 79, 1),
        ),
        ThemeColor(
          first: Color.fromRGBO(211, 79, 233, 1),
          second: Color.fromRGBO(242, 79, 98, 1),
        ),
        ThemeColor(
          first: Color.fromRGBO(79, 131, 233, 1),
          second: Color.fromRGBO(170, 79, 242, 1),
        ),
      ],
    );
  }

  ThemeColor get currentThemeColor => themeColors[currentIndex];
}
