import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/entity/question_model.dart';

part 'book_mark_question_detail_state.freezed.dart';

@freezed
class BookMarkQuestionDetailState with _$BookMarkQuestionDetailState {
  const factory BookMarkQuestionDetailState({
    @Default(false) bool isLoading,
    String? error,
    QuestionModel? question,
  }) = _BookMarkQuestionDetailState;
}
