import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/core/utils/app_mode_service.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/domain/auth/auth_repository.dart';
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
    fetchUserInfo();
    fetchMyBlocks();
  }

  Future<void> refresh() async {
    fetchUserInfo();
    fetchMyBlocks();
  }

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

  Future<void> fetchMyBlocks() async {
    final current = state.myQuestionsState;
    if (current.isLoading) return;

    emit(
      state.copyWith(
        myQuestionsState: current.copyWith(isLoading: true, error: null),
      ),
    );

    final result = await _quizRepository.getMyBlocks();

    result.fold(
      (error) {
        emit(
          state.copyWith(
            myQuestionsState: current.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
        _messageHandler.handleDialog(error);
      },
      (questions) {
        final list = List.of(questions);
        final itemForAddButton = MyQuestionModel(id: -1);
        list.insert(0, itemForAddButton);
        emit(
          state.copyWith(
            myQuestionsState: current.copyWith(
              isLoading: false,
              myQuestions: list,
              error: null,
            ),
          ),
        );
      },
    );
  }

  Future<void> fetchBlockQuizBookmark() async {
    // TODO fetch block quiz bookmark
  }

  Future<void> fetchCountries() async {
    // TODO fetch countries
  }

  Future<void> fetchRecent() async {
    // TODO fetch recent
  }
}
