

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/entity/question_model.dart';

part 'user_question_detail_state.freezed.dart';

@freezed
abstract class UserQuestionDetailState with _$UserQuestionDetailState {
  const factory UserQuestionDetailState({
    String? error,
    @Default(false) bool isLoading,
    QuestionModel? question,
  }) = _UserQuestionDetailState;
}