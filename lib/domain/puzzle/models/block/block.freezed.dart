// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BlockTearOff {
  const _$BlockTearOff();

// ignore: unused_element
  _Block call(
      {@required UniqueId id,
      @required BlockIndex index,
      @required BlockPoint point,
      bool isNew = false}) {
    return _Block(
      id: id,
      index: index,
      point: point,
      isNew: isNew,
    );
  }
}

// ignore: unused_element
const $Block = _$BlockTearOff();

mixin _$Block {
  UniqueId get id;
  BlockIndex get index;
  BlockPoint get point;
  bool get isNew;

  $BlockCopyWith<Block> get copyWith;
}

abstract class $BlockCopyWith<$Res> {
  factory $BlockCopyWith(Block value, $Res Function(Block) then) =
      _$BlockCopyWithImpl<$Res>;
  $Res call({UniqueId id, BlockIndex index, BlockPoint point, bool isNew});
}

class _$BlockCopyWithImpl<$Res> implements $BlockCopyWith<$Res> {
  _$BlockCopyWithImpl(this._value, this._then);

  final Block _value;
  // ignore: unused_field
  final $Res Function(Block) _then;

  @override
  $Res call({
    Object id = freezed,
    Object index = freezed,
    Object point = freezed,
    Object isNew = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      index: index == freezed ? _value.index : index as BlockIndex,
      point: point == freezed ? _value.point : point as BlockPoint,
      isNew: isNew == freezed ? _value.isNew : isNew as bool,
    ));
  }
}

abstract class _$BlockCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory _$BlockCopyWith(_Block value, $Res Function(_Block) then) =
      __$BlockCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, BlockIndex index, BlockPoint point, bool isNew});
}

class __$BlockCopyWithImpl<$Res> extends _$BlockCopyWithImpl<$Res>
    implements _$BlockCopyWith<$Res> {
  __$BlockCopyWithImpl(_Block _value, $Res Function(_Block) _then)
      : super(_value, (v) => _then(v as _Block));

  @override
  _Block get _value => super._value as _Block;

  @override
  $Res call({
    Object id = freezed,
    Object index = freezed,
    Object point = freezed,
    Object isNew = freezed,
  }) {
    return _then(_Block(
      id: id == freezed ? _value.id : id as UniqueId,
      index: index == freezed ? _value.index : index as BlockIndex,
      point: point == freezed ? _value.point : point as BlockPoint,
      isNew: isNew == freezed ? _value.isNew : isNew as bool,
    ));
  }
}

class _$_Block extends _Block with DiagnosticableTreeMixin {
  const _$_Block(
      {@required this.id,
      @required this.index,
      @required this.point,
      this.isNew = false})
      : assert(id != null),
        assert(index != null),
        assert(point != null),
        assert(isNew != null),
        super._();

  @override
  final UniqueId id;
  @override
  final BlockIndex index;
  @override
  final BlockPoint point;
  @JsonKey(defaultValue: false)
  @override
  final bool isNew;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Block(id: $id, index: $index, point: $point, isNew: $isNew)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Block'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('point', point))
      ..add(DiagnosticsProperty('isNew', isNew));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Block &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)) &&
            (identical(other.isNew, isNew) ||
                const DeepCollectionEquality().equals(other.isNew, isNew)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(point) ^
      const DeepCollectionEquality().hash(isNew);

  @override
  _$BlockCopyWith<_Block> get copyWith =>
      __$BlockCopyWithImpl<_Block>(this, _$identity);
}

abstract class _Block extends Block {
  const _Block._() : super._();
  const factory _Block(
      {@required UniqueId id,
      @required BlockIndex index,
      @required BlockPoint point,
      bool isNew}) = _$_Block;

  @override
  UniqueId get id;
  @override
  BlockIndex get index;
  @override
  BlockPoint get point;
  @override
  bool get isNew;
  @override
  _$BlockCopyWith<_Block> get copyWith;
}
