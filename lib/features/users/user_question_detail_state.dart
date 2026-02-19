import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/entity/question_model.dart';

part 'user_question_detail_state.freezed.dart';

@freezed
abstract class UserQuestionDetailState with _$UserQuestionDetailState {
  const factory UserQuestionDetailState({
    String? error,
    @Default(false) bool isLoading,
    QuestionModel? question,
    @Default(BookmarkState()) BookmarkState bookmarksState,
  }) = _UserQuestionDetailState;
}

@freezed
abstract class BookmarkState with _$BookmarkState {
  const factory BookmarkState({
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool isBookmarked,
  }) = _BookmarkState;
}
