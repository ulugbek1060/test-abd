import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/account/entities/my_info_model.dart';
import 'package:testabd/domain/account/entities/user_connections_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';
import 'package:testabd/domain/quiz/entities/questions_bookmark_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    String? error,
    MyInfoModel? myInfoModel,
    @Default(false) bool isLoading,
    @Default(UserConnectionsState()) UserConnectionsState userConnectionsState,
    @Default(QuestionsBookmarkState()) QuestionsBookmarkState questionsBookmarkState,
    @Default(MyBlocksState()) MyBlocksState myBlocksState,
    @Default(MyQuestionsState()) MyQuestionsState myQuestionsState,
  }) = _ProfileState;
}

@freezed
class UserConnectionsState with _$UserConnectionsState {
  const factory UserConnectionsState({
    @Default(false) bool isLoading,
    String? error,
    @Default(UserConnectionsModel()) UserConnectionsModel connections,
  }) = _UserConnectionsState;
}

@freezed
class QuestionsBookmarkState with _$QuestionsBookmarkState {
  const factory QuestionsBookmarkState({
    @Default(false) bool isLoading,
    String? error,
    @Default(QuestionsBookmarkModel()) QuestionsBookmarkModel questionsBookmark,
  }) = _QuestionsBookmarkState;
}

@freezed
class MyBlocksState with _$MyBlocksState {
  const factory MyBlocksState({
    @Default(false) bool isLoading,
    String? error,
    @Default([]) List<MyBlockModel> myQuestions,
  }) = _MyBlocksState;
}

@freezed
class MyQuestionsState with _$MyQuestionsState {
  const factory MyQuestionsState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    String? previous,
    String? next,
    String? error,
    @Default([]) List<QuestionModel> myQuestions,
  }) = _MyQuestionsState;
}
