import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/presentation/core/widgets/animated_new_block.dart';
import 'package:twozerofoureight/presentation/core/widgets/animated_slide.dart';
import 'package:twozerofoureight/presentation/core/widgets/tile.dart';

class BlockTile extends StatelessWidget {
  final Block block;
  final Tile tile;
  final Offset position;
  final Duration duration;
  const BlockTile({
    Key key,
    @required this.block,
    @required this.tile,
    @required this.position,
    @required this.duration,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final curve = Curves.easeInOut;
    return AnimatedSlide(
      id: block.id.value,
      duration: duration,
      position: position,
      curve: curve,
      child: AnimatedNewBlock(
        block: block,
        duration: duration,
        curve: curve,
        child: tile,
      ),
    );
  }
}
