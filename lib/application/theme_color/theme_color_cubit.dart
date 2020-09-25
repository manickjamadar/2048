import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/theme_color/models/theme_color.dart';
import 'package:twozerofoureight/infrastructure/theme_color/facade/theme_color_facade.dart';
import 'package:twozerofoureight/helpers/list_extensions.dart';
part 'theme_color_state.dart';
part 'theme_color_cubit.freezed.dart';

class ThemeColorCubit extends Cubit<ThemeColorState> {
  final ThemeColorFacade themeColorFacade;
  ThemeColorCubit({@required this.themeColorFacade})
      : super(ThemeColorState.initial()) {
    _init();
  }

  void _init() async {
    final indexOption = await themeColorFacade.getCurrentIndex();
    final currentIndex = indexOption.fold((l) => 0, id);
    emit(state.copyWith(currentIndex: currentIndex));
  }

  //events
  void change(int index) {
    if (index < 0 || index >= state.themeColors.length) {
      return;
    }

    emit(state.copyWith(currentIndex: index));
    themeColorFacade.saveIndex(index);
  }

  void next() {
    if (state.themeColors.hasNext(state.currentIndex)) {
      change(state.currentIndex + 1);
    } else {
      change(0);
    }
  }
}
