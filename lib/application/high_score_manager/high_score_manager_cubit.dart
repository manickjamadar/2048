import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twozerofoureight/application/board_option_cubit/board_option_cubit.dart';
import 'package:twozerofoureight/domain/board_option/models/board_option.dart';
import 'package:twozerofoureight/domain/high_score_manager/facade/high_score_manager_facade.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';
part 'high_score_manager_state.dart';
part 'high_score_manager_cubit.freezed.dart';

class HighScoreManagerCubit extends Cubit<HighScoreManagerState> {
  final BoardOptionCubit boardOptionCubit;
  final IHighScoreManagerFacade highScoreManagerFacade;
  StreamSubscription<BoardOptionState> _boardOptionStream;
  HighScoreManagerCubit(
      {@required this.boardOptionCubit, @required this.highScoreManagerFacade})
      : super(HighScoreManagerState.initial()) {
    _init();
  }

  void _init() async {
    _refreshed(boardOptionCubit.currentOption);
    _boardOptionStream = boardOptionCubit.listen((state) {
      final currentOption = state.options[state.currentOptionIndex];
      _refreshed(currentOption);
    });
  }

  void save(BoardScore newHighScore) {
    emit(HighScoreManagerState(score: newHighScore));
    highScoreManagerFacade.save(newHighScore, boardOptionCubit.currentOption);
  }

  void _refreshed(BoardOption option) async {
    final highScoreOption = await highScoreManagerFacade.get(option);
    final BoardScore highScore = highScoreOption.fold((l) => BoardScore(0), id);
    emit(HighScoreManagerState(score: highScore));
  }

  @override
  Future<void> close() {
    _boardOptionStream?.cancel();
    return super.close();
  }
}
