import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
part 'board_option.freezed.dart';

@freezed
abstract class BoardOption with _$BoardOption {
  const factory BoardOption({
    @required String title,
    @required BoardSize size,
  }) = _BoardOption;
}
