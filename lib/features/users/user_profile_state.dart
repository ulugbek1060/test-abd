import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/account/entities/user_profile_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/quiz/entities/topics_model.dart';

part 'user_profile_state.freezed.dart';

/// Main screen state
@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    // global loading
    @Default(false) bool isLoading,
    // user profile
    UserProfileModel? profile,
    // global errors
    String? error,
    // topics state
    @Default(BlocksState()) BlocksState topicsState,
    // questions state
    @Default(QuestionsState()) QuestionsState questionsState,
    // book state
    @Default(BooksState()) BooksState booksState,
    // follow action state
    @Default(FollowState()) FollowState followState,
  }) = _UserProfileState;
}


@freezed
class BlocksState with _$BlocksState {
  const factory BlocksState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default([]) List<TopicItem> topics,
    @Default(1) int nextPage,
    @Default(0) int previousPage,
    String? error,
  }) = _BlocksState;
}

@freezed
class QuestionsState with _$QuestionsState {
  const factory QuestionsState({
    @Default(false) bool isLoading,
    @Default([]) List<QuestionModel> questions,
    String? error,
  }) = _QuestionsState;
}

@freezed
class BooksState with _$BooksState {
  const factory BooksState({@Default(false) bool isLoading, String? error}) =
      _BooksState;
}

@freezed
class FollowState with _$FollowState {
  const factory FollowState({@Default(false) bool isLoading, String? error}) =
      _FollowState;
}

