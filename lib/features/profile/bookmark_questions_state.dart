import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/entity/question_model.dart';

part 'bookmark_questions_state.freezed.dart';

@freezed
class BookmarkQuestionsState with _$BookmarkQuestionsState {
  const factory BookmarkQuestionsState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isLast,
    @Default([]) List<QuestionModel> questions,
    @Default(null) String? error,
    @Default(1) int next,
    @Default(1) int previous,
  }) = _BookmarkQuestionsState;
}
