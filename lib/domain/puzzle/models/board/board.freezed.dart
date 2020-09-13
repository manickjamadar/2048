// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BoardTearOff {
  const _$BoardTearOff();

// ignore: unused_element
  _Board call({@required List<Block> blocks}) {
    return _Board(
      blocks: blocks,
    );
  }
}

// ignore: unused_element
const $Board = _$BoardTearOff();

mixin _$Board {
  List<Block> get blocks;

  $BoardCopyWith<Board> get copyWith;
}

abstract class $BoardCopyWith<$Res> {
  factory $BoardCopyWith(Board value, $Res Function(Board) then) =
      _$BoardCopyWithImpl<$Res>;
  $Res call({List<Block> blocks});
}

class _$BoardCopyWithImpl<$Res> implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._value, this._then);

  final Board _value;
  // ignore: unused_field
  final $Res Function(Board) _then;

  @override
  $Res call({
    Object blocks = freezed,
  }) {
    return _then(_value.copyWith(
      blocks: blocks == freezed ? _value.blocks : blocks as List<Block>,
    ));
  }
}

abstract class _$BoardCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$BoardCopyWith(_Board value, $Res Function(_Board) then) =
      __$BoardCopyWithImpl<$Res>;
  @override
  $Res call({List<Block> blocks});
}

class __$BoardCopyWithImpl<$Res> extends _$BoardCopyWithImpl<$Res>
    implements _$BoardCopyWith<$Res> {
  __$BoardCopyWithImpl(_Board _value, $Res Function(_Board) _then)
      : super(_value, (v) => _then(v as _Board));

  @override
  _Board get _value => super._value as _Board;

  @override
  $Res call({
    Object blocks = freezed,
  }) {
    return _then(_Board(
      blocks: blocks == freezed ? _value.blocks : blocks as List<Block>,
    ));
  }
}

class _$_Board extends _Board {
  const _$_Board({@required this.blocks})
      : assert(blocks != null),
        super._();

  @override
  final List<Block> blocks;

  @override
  String toString() {
    return 'Board(blocks: $blocks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Board &&
            (identical(other.blocks, blocks) ||
                const DeepCollectionEquality().equals(other.blocks, blocks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(blocks);

  @override
  _$BoardCopyWith<_Board> get copyWith =>
      __$BoardCopyWithImpl<_Board>(this, _$identity);
}

abstract class _Board extends Board {
  const _Board._() : super._();
  const factory _Board({@required List<Block> blocks}) = _$_Board;

  @override
  List<Block> get blocks;
  @override
  _$BoardCopyWith<_Board> get copyWith;
}
