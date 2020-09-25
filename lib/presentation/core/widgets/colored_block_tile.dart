import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_point.dart';
import 'package:twozerofoureight/domain/theme_color/models/theme_color.dart';
import 'package:twozerofoureight/presentation/core/helpers/log_base2.dart';
import 'package:twozerofoureight/presentation/core/widgets/tile.dart';

class ColoredBlockTile extends StatelessWidget {
  final double padding;
  final double size;
  final Block block;
  final ThemeColor themeColor;

  const ColoredBlockTile(
      {Key key,
      @required this.padding,
      @required this.size,
      @required this.block,
      @required this.themeColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final point = block.point;
    return Tile(
      padding: padding,
      size: size,
      value: point.value.toString(),
      color: getColor(point),
    );
  }

  Color getColor(BlockPoint point) {
    if (point.value <= 0) {
      return Colors.transparent;
    }
    final stepValue = logBase2(point.value) - 1;
    TinyColor tinyColor;
    if (point.value <= 64) {
      tinyColor = TinyColor(themeColor.first);
      final totalStep = 5;
      final maxValue = 60;
      final brightnessValue = (maxValue / totalStep) * stepValue;
      print(brightnessValue);
      tinyColor = tinyColor.brighten(maxValue - brightnessValue.toInt());
    } else {
      tinyColor = TinyColor(themeColor.second);
      tinyColor = tinyColor.spin((stepValue - 6) * 10);
    }
    return tinyColor.color;
  }
}
