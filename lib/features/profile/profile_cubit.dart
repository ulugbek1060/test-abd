import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/core/utils/app_mode_service.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/domain/auth/auth_repository.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/profile_state.dart';
import 'package:testabd/main.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final AccountRepository _accountRepository;
  final QuizRepository _quizRepository;
  final AppMessageHandler _messageHandler;

  late final StreamSubscription _themeSubscription;
  late final StreamSubscription _myInfoSubscription;

  static const int _pageSize = 10;

  ProfileCubit(
    this._accountRepository,
    this._quizRepository,
    this._messageHandler,
  ) : super(ProfileState()) {
    // listen the my info subscription
    _myInfoSubscription = _accountRepository.userInfoStream.listen((event) {
      // fetch user connections
      fetchConnections(event?.id);
      // emit state
      emit(state.copyWith(myInfoModel: event));
    });

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
    fetchBlocks();
    fetchQuestionsByPage();
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

  Future<void> fetchQuestionBookmark() async {
    if (state.questionsBookmarkState.isLoading) return;

    emit(
      state.copyWith(
        questionsBookmarkState: state.questionsBookmarkState.copyWith(
          isLoading: true,
          error: null,
        ),
      ),
    );

    final result = await _quizRepository.getQuestionsBookmark();

    result.fold(
      (error) {
        emit(
          state.copyWith(
            questionsBookmarkState: state.questionsBookmarkState.copyWith(
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
            questionsBookmarkState: state.questionsBookmarkState.copyWith(
              isLoading: false,
              questionsBookmark: value,
              error: null,
            ),
          ),
        );
      },
    );
  }

  Future<void> fetchBlocks() async {
    final current = state.blocksState;
    if (current.isLoading) return;

    emit(
      state.copyWith(
        blocksState: current.copyWith(isLoading: true, error: null),
      ),
    );

    final result = await _quizRepository.getMyBlocks();

    result.fold(
      (error) {
        emit(
          state.copyWith(
            blocksState: current.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
        _messageHandler.handleDialog(error);
      },
      (questions) {
        final list = List.of(questions);
        final itemForAddButton = MyBlockModel(id: -1);
        list.insert(0, itemForAddButton);
        emit(
          state.copyWith(
            blocksState: current.copyWith(
              isLoading: false,
              myQuestions: list,
              error: null,
            ),
          ),
        );
      },
    );
  }

  Future<void> fetchQuestionsByPage() async {
    final currentState = state.questionsState;

    if (currentState.isLoading) return;
    if (currentState.isLoadingMore) return;
    if (currentState.isLastPage) return;

    if (currentState.questions.isEmpty) {
      emit(
        state.copyWith(questionsState: currentState.copyWith(isLoading: true)),
      );
    } else {
      emit(
        state.copyWith(
          questionsState: currentState.copyWith(isLoadingMore: true),
        ),
      );
    }

    final result = await _quizRepository.getMyQuestions(
      pageSize: _pageSize,
      page: state.questionsState.next ?? "",
    );

    result.fold(
      (e) {
        emit(
          state.copyWith(
            questionsState: state.questionsState.copyWith(
              isLoading: false,
              isLoadingMore: false,
              error: e.message,
            ),
          ),
        );
        _messageHandler.handleDialog(e);
      },
      (value) {
        final list = List.of(state.questionsState.questions);
        if (list.isEmpty) list.insert(0, QuestionModel(id: -1));
        list.addAll(value.data);
        emit(
          state.copyWith(
            questionsState: state.questionsState.copyWith(
              isLoading: false,
              isLoadingMore: false,
              isLastPage: value.data.length < _pageSize || value.next == null,
              next: value.next,
              previous: value.previous,
              questions: list,
            ),
          ),
        );
      },
    );
  }

}
