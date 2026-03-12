import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/domain/entity/block_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final AccountRepository _accountRepository;
  final QuizRepository _quizRepository;
  final AppMessageHandler _messageHandler;
  final UpdateListener _questionsUpdateListener;
  final UpdateListener _blocksUpdateListener;

  late final StreamSubscription _themeSubscription;
  late final StreamSubscription _myInfoSubscription;

  static const int _blocksPageSize = 10;
  static const int _questionsPageSize = 10;
  static const int _sessionPageSize = 10;

  ProfileCubit(
    this._accountRepository,
    this._quizRepository,
    this._messageHandler,
    @Named.from(ProfileQuestionsUpdater) this._questionsUpdateListener,
    @Named.from(ProfileBlockUpdater) this._blocksUpdateListener,
  ) : super(ProfileState()) {
    // listen the my info subscription
    _myInfoSubscription = _accountRepository.userInfoStream.listen((event) {
      // fetch user connections
      fetchConnections(event?.id);
      // emit state
      emit(state.copyWith(myInfoModel: event));
    });

    _questionsUpdateListener.listen(() => getQuestionsByPage());
    _blocksUpdateListener.listen(() => getBlocks());

    load();
  }

  @override
  Future<void> close() {
    _themeSubscription.cancel();
    _myInfoSubscription.cancel();
    return super.close();
  }

  Future<void> load() async {
    emit(ProfileState());
    fetchUserInfo();
    getBlocks();
    getQuestions();
    getReadingSessions();
  }

  Future<void> refresh() async => await load();

  Future<void> fetchUserInfo() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final result = await _accountRepository.fetchMyInfo();
    result.fold((error) => _messageHandler.handleDialog(error), (value) {});
    emit(state.copyWith(isLoading: false));
  }

  Future<void> fetchConnections(int? userId) async {
    if (userId == null) return;
    if (state.userConnectionsState.isLoading) return;

    emit(
      state.copyWith(
        userConnectionsState: state.userConnectionsState.copyWith(
          isLoading: true,
        ),
      ),
    );

    final result = await _accountRepository.getUserConnections(userId);
    result.fold(
      (error) {
        emit(
          state.copyWith(
            userConnectionsState: state.userConnectionsState.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
        _messageHandler.handleDialog(error);
      },
      (value) {
        emit(
          state.copyWith(
            userConnectionsState: state.userConnectionsState.copyWith(
              isLoading: false,
              connections: value,
            ),
          ),
        );
      },
    );
  }

  // ------------------------------------------------------
  // Block
  // ------------------------------------------------------
  Future<void> getBlocks() async {
    final current = state.blocksState;
    final user = await _accountRepository.userInfoStream.first;
    final userId = user?.id;
    if (current.isLoading ||
        current.isLastPage ||
        current.isLoadingMore ||
        userId == null) {
      return;
    }

    emit(state.copyWith(blocksState: current.copyWith(isLoading: true)));

    final result = await _quizRepository.getBocksByUserId(
      userId: userId,
      page: 1,
      pageSize: _blocksPageSize,
    );

    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            blocksState: state.blocksState.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        emit(
          state.copyWith(
            blocksState: current.copyWith(
              isLoading: false,
              blocks: value.data,
              error: null,
            ),
          ),
        );
      },
    );
  }

  Future<void> getBlockByPage() async {
    final current = state.blocksState;
    final user = await _accountRepository.userInfoStream.first;
    final userId = user?.id;
    if (current.isLoading ||
        current.isLastPage ||
        current.isLoadingMore ||
        userId == null) {
      return;
    }

    emit(state.copyWith(blocksState: current.copyWith(isLoadingMore: true)));

    final result = await _quizRepository.getBocksByUserId(
      userId: userId,
      page: current.next,
      pageSize: _blocksPageSize,
    );

    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            blocksState: state.blocksState.copyWith(
              isLoadingMore: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        final list = List.of(state.blocksState.blocks);
        list.addAll(value.data);
        emit(
          state.copyWith(
            blocksState: current.copyWith(
              isLoadingMore: false,
              blocks: list,
              error: null,
              next: value.nextPage(),
              previous: value.previousPage(),
              isLastPage:
                  value.data.length < _blocksPageSize || value.next == null,
            ),
          ),
        );
      },
    );
  }

  // ------------------------------------------------------
  // Questions
  // ------------------------------------------------------
  Future<void> getQuestions() async {
    final user = await _accountRepository.userInfoStream.first;
    if (user?.id == null) return;

    final questionsState = state.questionsState;
    if (questionsState.isLoading ||
        questionsState.isLoadingMore ||
        questionsState.isLastPage) {
      return;
    }

    emit(
      state.copyWith(questionsState: questionsState.copyWith(isLoading: true)),
    );

    final result = await _quizRepository.getUserQuestions(
      user!.id!,
      1,
      _questionsPageSize,
    );
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            questionsState: state.questionsState.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        emit(
          state.copyWith(
            questionsState: state.questionsState.copyWith(
              isLoading: false,
              error: null,
              questions: value.data,
              next: value.nextPage(),
              previous: value.previousPage(),
              isLastPage:
                  value.data.length < _questionsPageSize || value.next == null,
            ),
          ),
        );
      },
    );
  }

  Future<void> getQuestionsByPage() async {
    final user = await _accountRepository.userInfoStream.first;
    final userId = user?.id;
    final questionsState = state.questionsState;

    if (userId == null ||
        questionsState.isLoading ||
        questionsState.isLoadingMore ||
        questionsState.isLastPage) {
      return;
    }

    emit(
      state.copyWith(
        questionsState: state.questionsState.copyWith(isLoadingMore: true),
      ),
    );

    final result = await _quizRepository.getUserQuestions(
      userId,
      questionsState.next,
      _questionsPageSize,
    );

    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            questionsState: state.questionsState.copyWith(
              isLoadingMore: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        final list = List.of(state.questionsState.questions);
        list.addAll(value.data);
        emit(
          state.copyWith(
            questionsState: state.questionsState.copyWith(
              isLoadingMore: false,
              error: null,
              questions: list,
              next: value.nextPage(),
              previous: value.previousPage(),
              isLastPage:
                  value.data.length < _questionsPageSize || value.next == null,
            ),
          ),
        );
      },
    );
  }

  // ------------------------------------------------------
  // Reading Sessions
  // ------------------------------------------------------
  Future<void> getReadingSessions() async {
    if (state.readingSessionsState.isLoading) return;

    emit(
      state.copyWith(
        readingSessionsState: state.readingSessionsState.copyWith(
          isLoading: true,
        ),
      ),
    );

    final result = await _quizRepository.getReadingSessions(
      page: 1,
      pageSize: _sessionPageSize,
    );
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            readingSessionsState: state.readingSessionsState.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        emit(
          state.copyWith(
            readingSessionsState: state.readingSessionsState.copyWith(
              isLoading: false,
              error: null,
              sessions: value.data,
              next: value.nextPage(),
              previous: value.previousPage(),
              isLastPage: value.next == null,
            ),
          ),
        );
      },
    );
  }

  Future<void> getReadingSessionsByPage() async {
    final current = state.readingSessionsState;
    if (current.isLoading || current.isLoadingMore || current.isLastPage) {
      return;
    }

    emit(
      state.copyWith(
        readingSessionsState: current.copyWith(isLoadingMore: true),
      ),
    );

    final result = await _quizRepository.getReadingSessions(
      page: current.next,
      pageSize: _sessionPageSize,
    );
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            readingSessionsState: state.readingSessionsState.copyWith(
              isLoadingMore: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        emit(
          state.copyWith(
            readingSessionsState: state.readingSessionsState.copyWith(
              isLoadingMore: false,
              error: null,
              sessions: List.of(state.readingSessionsState.sessions)
                ..addAll(value.data),
              next: value.nextPage(),
              previous: value.previousPage(),
              isLastPage:
                  value.next == null || value.data.length < _sessionPageSize,
            ),
          ),
        );
      },
    );
  }
}

abstract class UpdateListener {
  void onUpdate();

  void listen(void Function() param0);
}

@named
@Singleton(as: UpdateListener)
class ProfileQuestionsUpdater implements UpdateListener {
  late final void Function() listener;

  @override
  void listen(void Function() param0) => listener = param0;

  @override
  void onUpdate() => listener.call();
}

@named
@Singleton(as: UpdateListener)
class ProfileBlockUpdater implements UpdateListener {
  late final void Function() listener;

  @override
  void listen(void Function() param0) => listener = param0;

  @override
  void onUpdate() => listener.call();
}
