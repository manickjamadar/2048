import 'package:equatable/equatable.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';

class BoardScore extends Equatable {
  final int value;

  const BoardScore(this.value) : assert(value >= 0);

  BoardScore add(Board mergeOnlyBoard) {
    int extraValues = 0;
    mergeOnlyBoard.blocks.forEach((block) {
      if (!block.isEmpty) {
        extraValues += block.point.value;
      }
    });
    return BoardScore(value + extraValues);
  }

  @override
  List<Object> get props => [value];
}
