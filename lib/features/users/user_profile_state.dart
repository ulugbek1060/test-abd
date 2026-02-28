import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/account/entities/user_profile_model.dart';
import 'package:testabd/domain/entity/block_model.dart';
import 'package:testabd/domain/entity/question_model.dart';

part 'user_profile_state.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    @Default(false) bool isLoading,
    UserProfileModel? profile,
    String? error,
    @Default(BlocksState()) BlocksState blockState,
    @Default(QuestionsState()) QuestionsState questionsState,
    @Default(BooksState()) BooksState booksState,
    @Default(FollowState()) FollowState followState,
  }) = _UserProfileState;
}

@freezed
class BlocksState with _$BlocksState {
  const factory BlocksState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isLastPage,
    @Default([]) List<BlockModel> blocks,
    @Default(1) int next,
    @Default(0) int previous,
    String? error,
  }) = _BlocksState;
}

@freezed
class QuestionsState with _$QuestionsState {
  const factory QuestionsState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isLast,
    @Default([]) List<QuestionModel> questions,
    @Default(1) int next,
    @Default(0) int previous,
    String? error,
  }) = _QuestionsState;
}

@freezed
class BooksState with _$BooksState {
  const factory BooksState({
    @Default(false) bool isLoading,
    String? error
  }) = _BooksState;
}

@freezed
class FollowState with _$FollowState {
  const factory FollowState({
    @Default(false) bool isLoading,
    String? error}) = _FollowState;
}
