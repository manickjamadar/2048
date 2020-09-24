import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final double size;
  final Color color;
  final double padding;
  final String value;
  final double radius;

  const Tile(
      {Key key,
      @required this.size,
      @required this.color,
      @required this.padding,
      @required this.value,
      this.radius = 6})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final actualSize = size - (padding * 2);
    final fontSize = actualSize * 0.35;
    return Container(
      padding: EdgeInsets.all(padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          width: actualSize,
          height: actualSize,
          padding: EdgeInsets.all(8),
          color: color,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
