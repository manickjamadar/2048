import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/presentation/core/helpers/get_tile_position.dart';
import 'package:twozerofoureight/presentation/core/widgets/tile.dart';

class PositionedTile extends StatelessWidget {
  final Tile tile;
  final int index;
  final BoardSize boardSize;

  const PositionedTile(
      {Key key,
      @required this.tile,
      @required this.index,
      @required this.boardSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: getTilePosition(
        index: BlockIndex(value: index, size: boardSize),
        tileSize: tile.size,
      ),
      child: tile,
    );
  }
}
