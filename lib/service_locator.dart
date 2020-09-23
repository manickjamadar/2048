import 'package:get_it/get_it.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/domain/high_score_manager/facade/high_score_manager_facade.dart';
import 'package:twozerofoureight/infrastructure/high_score_manager/facade/high_score_manager_facade.dart';

final locator = GetIt.I;

void initServiceLocator() {
  initBloc();
  initFacade();
}

void initBloc() {
  locator.registerFactory<BoardOptionCubit>(() => BoardOptionCubit());
}

void initFacade() async {
  locator.registerLazySingleton<IHighScoreManagerFacade>(
      () => HighScoreManagerFacade());
}
