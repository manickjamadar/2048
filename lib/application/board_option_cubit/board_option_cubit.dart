import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
part 'board_option_state.dart';
part 'board_option_cubit.freezed.dart';

class BoardOptionCubit extends Cubit<BoardOptionState> {
  BoardOptionCubit() : super(BoardOptionState.initial());

  BoardOption get currentOption => state.options[state.currentOptionIndex];
  //events
  void change(int index) {
    if (index < 0 || index >= state.options.length) {
      return;
    }

    emit(state.copyWith(currentOptionIndex: index));
  }
}
