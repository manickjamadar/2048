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
          final newList = [savedBoard, ...list];
          emit(SavedBoardState.loaded(savedBoards: newList));
          savedBoardFacade.create(savedBoard);
        });
  }

  void delete(UniqueId id) {
    state.maybeWhen(
        orElse: () {},
        loaded: (list) {
          final newList =
              list.where((savedBoard) => savedBoard.id != id).toList();
          emit(SavedBoardState.loaded(savedBoards: newList));
          savedBoardFacade.delete(id);
        });
  }
}
