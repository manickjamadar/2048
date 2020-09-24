import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/board_option/facade/board_option_facade.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
part 'board_option_state.dart';
part 'board_option_cubit.freezed.dart';

class BoardOptionCubit extends Cubit<BoardOptionState> {
  final IBoardOptionFacade boardOptionFacade;
  BoardOptionCubit({@required this.boardOptionFacade})
      : super(BoardOptionState.initial()) {
    _init();
  }

  void _init() async {
    final indexOption = await boardOptionFacade.getCurrentIndex();
    final currentIndex = indexOption.fold((l) => 0, id);
    emit(state.copyWith(currentOptionIndex: currentIndex, isLoading: false));
  }

  BoardOption get currentOption => state.options[state.currentOptionIndex];
  //events
  void change(int index) {
    if (index < 0 || index >= state.options.length) {
      return;
    }

    emit(state.copyWith(currentOptionIndex: index));
    boardOptionFacade.saveIndex(index);
  }
}
