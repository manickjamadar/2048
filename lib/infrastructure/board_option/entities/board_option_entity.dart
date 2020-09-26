import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';

part 'board_option_entity.freezed.dart';
part 'board_option_entity.g.dart';

@freezed
abstract class BoardOptionEntity implements _$BoardOptionEntity {
  const BoardOptionEntity._();
  const factory BoardOptionEntity(
      {@required String title, @required int size}) = _BoardOptionEntity;

  factory BoardOptionEntity.fromModel(BoardOption option) {
    return BoardOptionEntity(size: option.size.value, title: option.title);
  }
  BoardOption toModel() {
    return BoardOption(title: title, size: BoardSize(size));
  }

  factory BoardOptionEntity.fromJson(Map<String, dynamic> json) =>
      _$BoardOptionEntityFromJson(json);
}
