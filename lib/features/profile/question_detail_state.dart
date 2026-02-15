import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_detail_state.freezed.dart';

@freezed
class QuestionDetailState with _$QuestionDetailState {
  const factory QuestionDetailState({
    String? error,
    @Default(false) bool isLoading,
  }) = _QuestionDetailState;
}
