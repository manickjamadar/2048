import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/presentation/core/helpers/get_tile_position.dart';
import 'package:twozerofoureight/presentation/core/widgets/animated_new_block.dart';
import 'package:twozerofoureight/presentation/core/widgets/animated_slide.dart';
import 'package:twozerofoureight/presentation/core/widgets/tile.dart';

class AnimatedBlockTile extends StatelessWidget {
  final Block block;
  final Tile tile;
  final Duration duration;
  const AnimatedBlockTile({
    Key key,
    @required this.block,
    @required this.tile,
    @required this.duration,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final curve = Curves.easeInOut;
    return AnimatedSlide(
      id: block.id.value,
      duration: duration,
      position: getTilePosition(
        index: block.index,
        tileSize: tile.size,
      ),
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
