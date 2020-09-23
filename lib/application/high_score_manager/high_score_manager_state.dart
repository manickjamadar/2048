part of 'high_score_manager_cubit.dart';

@freezed
abstract class HighScoreManagerState with _$HighScoreManagerState {
  const factory HighScoreManagerState({@required BoardScore score}) =
      _HighScoreManagerState;

  factory HighScoreManagerState.initial() {
    return HighScoreManagerState(score: BoardScore(0));
  }
}
