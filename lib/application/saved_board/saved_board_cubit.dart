import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/core/value_objects/unique_id.dart';
import 'package:twozerofoureight/domain/saved_board/facade/saved_board_facade.dart';
import 'package:twozerofoureight/domain/saved_board/models/saved_board.dart';

part 'saved_board_state.dart';
part 'saved_board_cubit.freezed.dart';

class SavedBoardCubit extends Cubit<SavedBoardState> {
  final ISavedBoardFacade savedBoardFacade;
  SavedBoardCubit({@required this.savedBoardFacade}) : super(_Initial());
  List<SavedBoard> _previousBoardList;
  //events
  void init() async {
    final savedBoardListOption = await savedBoardFacade.findAll();
    savedBoardListOption.fold((l) {
      emit(SavedBoardState.error());
    }, (list) {
      emit(SavedBoardState.loaded(savedBoards: list));
    });
  }

  void save(SavedBoard savedBoard) {
    state.maybeWhen(
        orElse: () {},
        loaded: (list) {
          final newList = [...list, savedBoard];
          emit(SavedBoardState.loaded(savedBoards: newList));
          savedBoardFacade.create(savedBoard);
        });
  }

  void delete(UniqueId id, Future<bool> shouldPersist) async {
    state.maybeWhen(
        orElse: () {},
        loaded: (list) {
          _previousBoardList = [...list];
          final newList =
              list.where((savedBoard) => savedBoard.id != id).toList();
          emit(SavedBoardState.loaded(savedBoards: newList));
          shouldPersist.then((value) {
            if (value) {
              savedBoardFacade.delete(id);
            }
          });
        });
  }

  void undo() {
    if (_previousBoardList != null) {
      emit(SavedBoardState.loaded(savedBoards: _previousBoardList));
    }
  }
}
