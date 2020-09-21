import 'package:get_it/get_it.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';

final locator = GetIt.I;

void initServiceLocator() {
  initBloc();
}

void initBloc() {
  locator.registerFactory<BoardOptionCubit>(() => BoardOptionCubit());
}
