import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/puzzle/models/block/block.dart';
import 'package:twozerofoureight/presentation/core/helpers/get_tile_position.dart';
import 'package:twozerofoureight/presentation/core/widgets/pulse_transition.dart';
import 'package:twozerofoureight/presentation/core/widgets/tile.dart';

class MergeOnlyBlockTile extends StatelessWidget {
  final Tile tile;
  final Block block;
  final Animation<double> pulse;

  const MergeOnlyBlockTile(
      {Key key,
      @required this.tile,
      @required this.block,
      @required this.pulse})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: block.isEmpty ? 0 : 1,
      child: Transform.translate(
        offset: getTilePosition(
          index: block.index,
          tileSize: tile.size,
        ),
        child: PulseTransition(
          child: tile,
          pulse: pulse,
        ),
      ),
    );
  }
}
