import 'package:flutter/cupertino.dart';

class AnimatedSlide extends StatelessWidget {
  final Widget child;
  final Offset position;
  final Duration duration;
  final Curve curve;
  final String id;
  const AnimatedSlide(
      {Key key,
      @required this.position,
      @required this.child,
      @required this.duration,
      @required this.id,
      this.curve = Curves.linear})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
        key: ValueKey(id),
        duration: duration,
        curve: curve ?? Curves.linear,
        tween: Tween<Offset>(begin: position, end: position),
        builder: (context, Offset offset, child) {
          return Transform.translate(offset: offset, child: child);
        },
        child: child);
  }
}
