import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/bookmark_questions_state.dart';

@injectable
class BookmarkQuestionsCubit extends Cubit<BookmarkQuestionsState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _messageHandler;

  BookmarkQuestionsCubit(this._quizRepository, this._messageHandler)
    : super(BookmarkQuestionsState());

  static final int _pageSize = 10;

  Future<void> refresh() => getQuestions();

  Future<void> getQuestions() async {
    if (state.isLoading || state.isLoadingMore || state.isLast) return;
    emit(state.copyWith(isLoading: true));
    final result = await _quizRepository.getQuestionsBookmark(
      pageSize: _pageSize,
      page: 1,
    );
    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false, error: error.message));
        _messageHandler.handleDialog(error);
      },
      (value) {
        emit(
          state.copyWith(
            isLoading: false,
            questions: value.data,
            next: value.nextPage(),
            previous: value.previousPage(),
            isLast: value.next == null || value.data.length < _pageSize,
            error: null,
          ),
        );
      },
    );
  }

  Future<void> getQuestionsByPage() async {
    if (state.isLoading || state.isLoadingMore || state.isLast) return;
    emit(state.copyWith(isLoadingMore: true));
    final result = await _quizRepository.getQuestionsBookmark(
      pageSize: _pageSize,
      page: state.next,
    );
    result.fold(
      (error) {
        emit(state.copyWith(isLoadingMore: false, error: error.message));
        _messageHandler.handleDialog(error);
      },
      (value) {
        emit(
          state.copyWith(
            isLoadingMore: false,
            questions: List.of(state.questions)..addAll(value.data),
            next: value.nextPage(),
            previous: value.previousPage(),
            error: null,
            isLast: value.next == null || value.data.length < _pageSize,
          ),
        );
      },
    );
  }

  void onFollow(int? id) {}

  void toggleBookmark(int? id) {}

  void setMultipleAnswer(int? answerId) {}

  void submitAnswer(Set<int> answers) {}
}
