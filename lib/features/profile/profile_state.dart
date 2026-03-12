import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/account/entities/my_info_model.dart';
import 'package:testabd/domain/account/entities/user_connections_model.dart';
import 'package:testabd/domain/books/entities/reading_session_model.dart';
import 'package:testabd/domain/entity/block_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    String? error,
    MyInfoModel? myInfoModel,
    @Default(false) bool isLoading,
    @Default(ConnectionsState()) ConnectionsState userConnectionsState,
    @Default(BlocksState()) BlocksState blocksState,
    @Default(QuestionsState()) QuestionsState questionsState,
    @Default(ReadingSessionsState()) ReadingSessionsState readingSessionsState ,
  }) = _ProfileState;
}

@freezed
class ConnectionsState with _$ConnectionsState {
  const factory ConnectionsState({
    @Default(false) bool isLoading,
    String? error,
    @Default(UserConnectionsModel()) UserConnectionsModel connections,
  }) = _ConnectionsState;
}

@freezed
class BlocksState with _$BlocksState {
  const factory BlocksState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isLastPage,
    @Default(0) int previous,
    @Default(1) int next,
    String? error,
    @Default([]) List<BlockModel> blocks,
  }) = _BlocksState;
}

@freezed
class QuestionsState with _$QuestionsState {
  const factory QuestionsState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isLastPage,
    @Default(0) int previous,
    @Default(1) int next,
    String? error,
    @Default([]) List<QuestionModel> questions,
  }) = _QuestionsState;
}

@freezed
class ReadingSessionsState with _$ReadingSessionsState {
  const factory ReadingSessionsState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isLastPage,
    @Default(0) int previous,
    @Default(1) int next,
    String? error,
    @Default([]) List<ReadingSessionModel> sessions,
  }) = _ReadingSessionsState;
}