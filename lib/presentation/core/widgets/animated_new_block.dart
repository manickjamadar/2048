import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';

class AnimatedNewBlock extends StatelessWidget {
  final Block block;
  final Duration duration;
  final Curve curve;
  final Widget child;
  Tween<double> getTween(Block block) {
    return Tween<double>(begin: 0, end: block.isEmpty ? 0 : 1);
  }

  double getScale(double value) {
    return this.block.isEmpty ? 0 : (this.block.isNew ? value : 1);
  }

  const AnimatedNewBlock(
      {Key key,
      @required this.block,
      @required this.duration,
      @required this.child,
      this.curve})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      curve: curve ?? Curves.linear,
      tween: getTween(block),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: getScale(value),
          child: child,
        );
      },
      child: child,
    );
  }
}
