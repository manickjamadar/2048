import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/application/saved_board/saved_board_cubit.dart';
import 'package:twozerofoureight/application/theme_color/theme_color_cubit.dart';
import 'package:twozerofoureight/domain/board_option/facade/board_option_facade.dart';
import 'package:twozerofoureight/domain/high_score_manager/facade/high_score_manager_facade.dart';
import 'package:twozerofoureight/domain/puzzle/data_source/puzzle_data_source.dart';
import 'package:twozerofoureight/domain/puzzle/facade/puzzle_facade.dart';
import 'package:twozerofoureight/domain/saved_board/data_source/saved_board_data_source.dart';
import 'package:twozerofoureight/domain/saved_board/facade/saved_board_facade.dart';
import 'package:twozerofoureight/domain/theme_color/facade/theme_color_facade.dart';
import 'package:twozerofoureight/infrastructure/board_option/facade/board_option_facade.dart';
import 'package:twozerofoureight/infrastructure/high_score_manager/facade/high_score_manager_facade.dart';
import 'package:twozerofoureight/infrastructure/puzzle/data_source/puzzle_data_source.dart';
import 'package:twozerofoureight/infrastructure/puzzle/facade/puzzle_facade.dart';
import 'package:twozerofoureight/infrastructure/saved_board/data_source/saved_board_data_source.dart';
import 'package:twozerofoureight/infrastructure/saved_board/facade/saved_board_facade.dart';
import 'package:twozerofoureight/infrastructure/theme_color/facade/theme_color_facade.dart';

final locator = GetIt.I;

Future<void> initServiceLocator() async {
  await initDataSource();
  await initFacade();
  initBloc();
}

void initBloc() {
  locator.registerFactory<BoardOptionCubit>(
      () => BoardOptionCubit(boardOptionFacade: locator<IBoardOptionFacade>()));
  locator.registerFactory<ThemeColorCubit>(
      () => ThemeColorCubit(themeColorFacade: locator<IThemeColorFacade>()));
  locator.registerFactory<SavedBoardCubit>(
      () => SavedBoardCubit(savedBoardFacade: locator<ISavedBoardFacade>()));
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
  locator.registerLazySingleton<IPuzzleFacade>(
      () => RealPuzzleFacade(dataSource: locator<IPuzzleDataSource>()));
  locator.registerLazySingleton<ISavedBoardFacade>(
      () => SavedBoardFacade(dataSource: locator<ISavedBoardDataSource>()));
}

Future<void> initDataSource() async {
  final puzzleBox = await Hive.openBox<String>("puzzle");
  final savedBoardBox = await Hive.openBox<String>("saved_board");
  locator.registerLazySingleton<IPuzzleDataSource>(
      () => PuzzleDataSource(puzzleBox));
  locator.registerLazySingleton<ISavedBoardDataSource>(
      () => SavedBoardDataSource(savedBoardBox));
}
