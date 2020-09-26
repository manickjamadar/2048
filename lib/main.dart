import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/application/theme_color/theme_color_cubit.dart';
import 'package:twozerofoureight/domain/high_score_manager/facade/high_score_manager_facade.dart';
import 'package:twozerofoureight/domain/puzzle/facade/puzzle_facade.dart';
import 'package:twozerofoureight/presentation/core/app.dart';
import 'package:twozerofoureight/service_locator.dart';
import 'application/high_score_manager/high_score_manager_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initServiceLocator();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => locator<ThemeColorCubit>(),
      ),
      BlocProvider(
        create: (_) => locator<BoardOptionCubit>(),
      ),
      BlocProvider(
        create: (context) => HighScoreManagerCubit(
            highScoreManagerFacade: locator<IHighScoreManagerFacade>(),
            boardOptionCubit: BlocProvider.of<BoardOptionCubit>(context)),
      ),
      BlocProvider(
        create: (context) => PuzzleCubit(
            puzzleFacade: locator<IPuzzleFacade>(),
            boardOptionCubit: BlocProvider.of<BoardOptionCubit>(context),
            highScoreManagerCubit:
                BlocProvider.of<HighScoreManagerCubit>(context)),
      )
    ],
    child: App(),
  ));
}
