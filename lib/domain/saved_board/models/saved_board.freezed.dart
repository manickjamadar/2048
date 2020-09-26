// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'saved_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SavedBoardTearOff {
  const _$SavedBoardTearOff();

// ignore: unused_element
  _SavedBoard call(
      {@required UniqueId id,
      @required BoardOption option,
      @required Puzzle puzzle}) {
    return _SavedBoard(
      id: id,
      option: option,
      puzzle: puzzle,
    );
  }
}

// ignore: unused_element
const $SavedBoard = _$SavedBoardTearOff();

mixin _$SavedBoard {
  UniqueId get id;
  BoardOption get option;
  Puzzle get puzzle;

  $SavedBoardCopyWith<SavedBoard> get copyWith;
}

abstract class $SavedBoardCopyWith<$Res> {
  factory $SavedBoardCopyWith(
          SavedBoard value, $Res Function(SavedBoard) then) =
      _$SavedBoardCopyWithImpl<$Res>;
  $Res call({UniqueId id, BoardOption option, Puzzle puzzle});

  $BoardOptionCopyWith<$Res> get option;
  $PuzzleCopyWith<$Res> get puzzle;
}

class _$SavedBoardCopyWithImpl<$Res> implements $SavedBoardCopyWith<$Res> {
  _$SavedBoardCopyWithImpl(this._value, this._then);

  final SavedBoard _value;
  // ignore: unused_field
  final $Res Function(SavedBoard) _then;

  @override
  $Res call({
    Object id = freezed,
    Object option = freezed,
    Object puzzle = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      option: option == freezed ? _value.option : option as BoardOption,
      puzzle: puzzle == freezed ? _value.puzzle : puzzle as Puzzle,
    ));
  }

  @override
  $BoardOptionCopyWith<$Res> get option {
    if (_value.option == null) {
      return null;
    }
    return $BoardOptionCopyWith<$Res>(_value.option, (value) {
      return _then(_value.copyWith(option: value));
    });
  }

  @override
  $PuzzleCopyWith<$Res> get puzzle {
    if (_value.puzzle == null) {
      return null;
    }
    return $PuzzleCopyWith<$Res>(_value.puzzle, (value) {
      return _then(_value.copyWith(puzzle: value));
    });
  }
}

abstract class _$SavedBoardCopyWith<$Res> implements $SavedBoardCopyWith<$Res> {
  factory _$SavedBoardCopyWith(
          _SavedBoard value, $Res Function(_SavedBoard) then) =
      __$SavedBoardCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, BoardOption option, Puzzle puzzle});

  @override
  $BoardOptionCopyWith<$Res> get option;
  @override
  $PuzzleCopyWith<$Res> get puzzle;
}

class __$SavedBoardCopyWithImpl<$Res> extends _$SavedBoardCopyWithImpl<$Res>
    implements _$SavedBoardCopyWith<$Res> {
  __$SavedBoardCopyWithImpl(
      _SavedBoard _value, $Res Function(_SavedBoard) _then)
      : super(_value, (v) => _then(v as _SavedBoard));

  @override
  _SavedBoard get _value => super._value as _SavedBoard;

  @override
  $Res call({
    Object id = freezed,
    Object option = freezed,
    Object puzzle = freezed,
  }) {
    return _then(_SavedBoard(
      id: id == freezed ? _value.id : id as UniqueId,
      option: option == freezed ? _value.option : option as BoardOption,
      puzzle: puzzle == freezed ? _value.puzzle : puzzle as Puzzle,
    ));
  }
}

class _$_SavedBoard implements _SavedBoard {
  const _$_SavedBoard(
      {@required this.id, @required this.option, @required this.puzzle})
      : assert(id != null),
        assert(option != null),
        assert(puzzle != null);

  @override
  final UniqueId id;
  @override
  final BoardOption option;
  @override
  final Puzzle puzzle;

  @override
  String toString() {
    return 'SavedBoard(id: $id, option: $option, puzzle: $puzzle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SavedBoard &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.option, option) ||
                const DeepCollectionEquality().equals(other.option, option)) &&
            (identical(other.puzzle, puzzle) ||
                const DeepCollectionEquality().equals(other.puzzle, puzzle)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(option) ^
      const DeepCollectionEquality().hash(puzzle);

  @override
  _$SavedBoardCopyWith<_SavedBoard> get copyWith =>
      __$SavedBoardCopyWithImpl<_SavedBoard>(this, _$identity);
}

abstract class _SavedBoard implements SavedBoard {
  const factory _SavedBoard(
      {@required UniqueId id,
      @required BoardOption option,
      @required Puzzle puzzle}) = _$_SavedBoard;

  @override
  UniqueId get id;
  @override
  BoardOption get option;
  @override
  Puzzle get puzzle;
  @override
  _$SavedBoardCopyWith<_SavedBoard> get copyWith;
}
