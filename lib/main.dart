import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/presentation/core/app.dart';
import 'package:twozerofoureight/service_locator.dart';

void main() {
  initServiceLocator();
  runApp(
      BlocProvider(create: (_) => locator<BoardOptionCubit>(), child: App()));
}
