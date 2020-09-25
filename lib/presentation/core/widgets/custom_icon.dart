import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final void Function() onPressed;
  final EdgeInsetsGeometry margin;

  const CustomIconButton(
      {Key key, @required this.icon, @required this.onPressed, this.margin})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(6)),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
