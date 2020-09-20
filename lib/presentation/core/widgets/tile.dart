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
    return Container(
      padding: EdgeInsets.all(padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
            width: actualSize,
            height: actualSize,
            color: color,
            child: Center(
              child: Text(
                value,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )),
      ),
    );
  }
}
