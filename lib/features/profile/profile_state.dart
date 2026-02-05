import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/account/entities/my_info_model.dart';
import 'package:testabd/domain/account/entities/user_connections_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';
import 'package:testabd/domain/quiz/entities/questions_bookmark_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default(null) String? error,
    // main data state
    MyInfoModel? myInfoModel,
    // user followers
    @Default(UserConnectionsState()) UserConnectionsState userConnectionsState,
    // questions bookmark
    @Default(QuestionsBookmarkState()) QuestionsBookmarkState questionsBookmarkState,
    // my questions
    @Default(MyBlocksState()) MyBlocksState myBlocksState,
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
  }) = _MyQuestionsState;
}
