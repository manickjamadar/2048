import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/domain/theme_color/models/theme_color.dart';

part 'theme_color_state.dart';
part 'theme_color_cubit.freezed.dart';

class ThemeColorCubit extends Cubit<ThemeColorState> {
  ThemeColorCubit() : super(ThemeColorState.initial());
}
