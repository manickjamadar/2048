import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

Offset getTilePosition({
  @required int index,
  @required double tileSize,
  @required BoardSize boardSize,
}) {
  final x = tileSize * (index % boardSize.value);
  final y = tileSize * (index / boardSize.value).floor();
  return Offset(x, y);
}
