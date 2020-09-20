import 'package:flutter/material.dart';

class PulseTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> pulse;
  const PulseTransition({Key key, @required this.child, @required this.pulse})
      : super(key: key, listenable: pulse);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: pulse.value,
      child: child,
    );
  }
}
