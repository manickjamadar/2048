import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/block_point.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
part 'board_entity.freezed.dart';
part 'board_entity.g.dart';

@freezed
abstract class BoardEntity implements _$BoardEntity {
  const BoardEntity._();
  const factory BoardEntity({@required List<int> points, @required int size}) =
      _BoardEntity;
  factory BoardEntity.fromModel(Board board) {
    return BoardEntity(
        size: board.size.value,
        points: board.blocks.map((block) => block.point.value).toList());
  }

  Board toModel() {
    return Board.fromPoints(
        points: points.map((point) => BlockPoint(point)).toList(),
        size: BoardSize(size));
  }

  factory BoardEntity.fromJson(Map<String, dynamic> json) =>
      _$BoardEntityFromJson(json);
}
