import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/application/theme_color/theme_color_cubit.dart';
import 'package:twozerofoureight/domain/board_option/facade/board_option_facade.dart';
import 'package:twozerofoureight/domain/high_score_manager/facade/high_score_manager_facade.dart';
import 'package:twozerofoureight/domain/theme_color/facade/theme_color_facade.dart';
import 'package:twozerofoureight/infrastructure/board_option/facade/board_option_facade.dart';
import 'package:twozerofoureight/infrastructure/high_score_manager/facade/high_score_manager_facade.dart';
import 'package:twozerofoureight/infrastructure/theme_color/facade/theme_color_facade.dart';

final locator = GetIt.I;

Future<void> initServiceLocator() async {
  await initFacade();
  initBloc();
}

void initBloc() {
  locator.registerFactory<BoardOptionCubit>(
      () => BoardOptionCubit(boardOptionFacade: locator<IBoardOptionFacade>()));
  locator.registerFactory<ThemeColorCubit>(
      () => ThemeColorCubit(themeColorFacade: locator<IThemeColorFacade>()));
}

Future<void> initFacade() async {
  final boardOptionBox = await Hive.openBox<int>("board_option");
  final themeColorBox = await Hive.openBox<int>("theme_color");
  locator.registerLazySingleton<IHighScoreManagerFacade>(
      () => HighScoreManagerFacade());
  locator.registerLazySingleton<IBoardOptionFacade>(
      () => BoardOptionFacade(boardOptionBox));
  locator.registerLazySingleton<IThemeColorFacade>(
      () => ThemeColorFacade(themeColorBox));
}
