import 'package:freezed_annotation/freezed_annotation.dart';
part 'board_direction.freezed.dart';

@freezed
abstract class BoardDirection implements _$BoardDirection {
  const BoardDirection._();
  const factory BoardDirection.right() = _Right;
  const factory BoardDirection.left() = _Left;
  const factory BoardDirection.down() = _Down;
  const factory BoardDirection.up() = _Up;

  BoardDirection get opposite => when(
        right: () => BoardDirection.left(),
        left: () => BoardDirection.right(),
        up: () => BoardDirection.down(),
        down: () => BoardDirection.up(),
      );
}
