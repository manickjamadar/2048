import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_index.dart';

Offset getTilePosition({
  @required BlockIndex index,
  @required double tileSize,
}) {
  if (tileSize < 1) {
    return Offset(0, 0);
  }
  final x = tileSize * (index.value % index.size.value);
  final y = tileSize * (index.value / index.size.value).floor();
  return Offset(x, y);
}
