import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/entity/question_model.dart';

part 'my_question_detail_state.freezed.dart';

@freezed
abstract class MyQuestionDetailState with _$MyQuestionDetailState {
  const factory MyQuestionDetailState({
    @Default(false) bool isLoading,
    String? error,
    QuestionModel? question,
  }) = _MyQuestionDetailState;
}
