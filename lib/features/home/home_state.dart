import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/entity/question_model.dart';

part 'home_state.freezed.dart';

/// mains state
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(FollowedQuizState()) FollowedQuizState followedQuizStata,
  }) = _HomeState;
}

/// followed quiz state
@freezed
class FollowedQuizState with _$FollowedQuizState {
  const factory FollowedQuizState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadMore,
    @Default([]) List<QuestionModel> questions,
    @Default(false) bool isLastPage,
    @Default(1) int nextPage,
    @Default(1) int previousPage,
    String? error,
  }) = _FollowedQuizState;
}

