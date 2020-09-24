import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'theme_color.freezed.dart';

@freezed
abstract class ThemeColor with _$ThemeColor {
  const factory ThemeColor({@required Color first, @required Color second}) =
      _ThemeColor;
}
