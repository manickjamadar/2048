import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  const CustomButton({Key key, @required this.onPressed, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Colors.black.withOpacity(0.2);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        padding: EdgeInsets.all(16),
        color: color,
        elevation: 0,
        splashColor: Colors.transparent,
        focusElevation: 0,
        highlightElevation: 0,
        highlightColor: color,
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
