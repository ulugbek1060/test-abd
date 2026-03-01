import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/core/utils/follow_listeners.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/users/user_profile_state.dart';
import 'package:testabd/main.dart';

@injectable
class UserProfileCubit extends Cubit<UserProfileState> {
  final AccountRepository _accountRepository;
  final QuizRepository _quizRepository;
  final AppMessageHandler _messageHandler;
  final ConnectionFollowEventListener _connectionFollowListener;
  final ConnectionFollowEventListener _userProfileFollowListener;
  final ConnectionFollowEventListener _leaderboardFollowListener;
  final ConnectionFollowEventListener _profileFollowListener;
  late StreamSubscription<UserFollowEvent> _followSubscription;
  final String username;

  static const int _blockPageSize = 10;
  static const int _questionsPageSize = 10;

  @factoryMethod
  UserProfileCubit.create(
    @factoryParam this.username,
    this._accountRepository,
    this._quizRepository,
    this._messageHandler,
    @Named.from(ConnectionFollowListener) this._connectionFollowListener,
    @Named.from(UserFollowListener) this._userProfileFollowListener,
    @Named.from(LeaderboardFollowListener) this._leaderboardFollowListener,
    @Named.from(ProfileFollowListener) this._profileFollowListener,
  ) : super(UserProfileState()) {
    _followSubscription = _userProfileFollowListener.followStream.listen((
      event,
    ) {
      if (state.profile?.user?.id == event.userId) {
        // for updating follow button
        final profile = state.profile?.setFollowing(event.isFollowing);
        emit(state.copyWith(profile: profile));

        // for updating followers count
        _loadUserDetailSilently();
      }
    });
  }

  @override
  Future<void> close() {
    _followSubscription.cancel();
    return super.close();
  }

  // ------------------------------------------------------
  // Others
  // ------------------------------------------------------
  Future<void> load() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _accountRepository.getUserProfile(username);

    final userInfo = await _accountRepository.userInfoStream.first;
    final id = userInfo?.id;

    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false, error: error.message));
      },
      (value) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            profile: value.copyWith(
              user: value.user?.copyWith(isMe: value.user?.id == id),
            ),
          ),
        );

        /// load topics
        getBlocks();
        getQuestions();
      },
    );
  }

  Future<void> refresh() => load();

  Future<void> followAction() async {
    final userId = state.profile?.user?.id;
    final followState = state.followState;
    if (userId == null || followState.isLoading) return;

    // enable loading
    emit(state.copyWith(followState: followState.copyWith(isLoading: true)));

    final result = await _accountRepository.followUser(userId);

    result.fold(
      (error) {
        // disable loading and add error
        final newFollowState = followState.copyWith(
          isLoading: false,
          error: error.message,
        );
        emit(state.copyWith(followState: newFollowState));
        // TODO show error message
      },
      (value) {
        // disable loading
        final newFollowState = followState.copyWith(
          isLoading: false,
          error: null,
        );

        final isFollowing = !(state.profile?.user?.isFollowing ?? false);
        // update isFollowing field
        final newUser = state.profile?.user?.copyWith(isFollowing: isFollowing);
        final newProfile = state.profile?.copyWith(user: newUser);

        final newState = state.copyWith(
          profile: newProfile,
          followState: newFollowState,
        );

        emit(newState);

        /// publish follow event to [profile_connection_cubit]
        _connectionFollowListener.publish(UserFollowEvent(userId, isFollowing));

        /// publish follow event to [leaderboard_cubit]
        _leaderboardFollowListener.publish(
          UserFollowEvent(userId, isFollowing),
        );

        /// publish follow event to [profile_connection_cubit]
        _profileFollowListener.publish(UserFollowEvent(userId, isFollowing));

        // load user detail
        _loadUserDetailSilently();
      },
    );
  }

  void _loadUserDetailSilently() {
    _accountRepository.getUserProfile(username).then((e) {
      e.fold(
        (error) {
          // show error silently
        },
        (result) {
          emit(state.copyWith(profile: result));
        },
      );
    });
  }

  void onShareAction() {
    // TODO implement onShare function
  }

  // ------------------------------------------------------
  // Block
  // ------------------------------------------------------
  Future<void> getBlocks() async {
    final userId = state.profile?.user?.id;
    if (userId == null) return;
    final blockState = state.blockState;

    if (blockState.isLoading ||
        blockState.isLoadingMore ||
        blockState.isLastPage) {
      return;
    }

    emit(state.copyWith(blockState: blockState.copyWith(isLoading: true)));

    final result = await _quizRepository.getBocksByUserId(
      userId: userId,
      pageSize: _blockPageSize,
      page: blockState.next,
    );
    result.fold(
      (error) {
        emit(
          state.copyWith(
            blockState: state.blockState.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        emit(
          state.copyWith(
            blockState: state.blockState.copyWith(
              isLoading: false,
              blocks: value.data,
              next: value.nextPage(),
              previous: value.previousPage(),
              isLastPage:
                  value.data.length < _blockPageSize || value.next == null,
            ),
          ),
        );
      },
    );
  }

  Future<void> getBlocksByPage() async {
    final userId = state.profile?.user?.id;
    if (userId == null) return;
    final blockState = state.blockState;

    if (blockState.isLoading ||
        blockState.isLoadingMore ||
        blockState.isLastPage) {
      return;
    }

    emit(state.copyWith(blockState: blockState.copyWith(isLoadingMore: true)));

    final result = await _quizRepository.getBocksByUserId(
      userId: userId,
      pageSize: blockState.next,
      page: _blockPageSize,
    );

    result.fold(
      (error) {
        emit(
          state.copyWith(
            blockState: state.blockState.copyWith(
              isLoadingMore: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        final list = List.of(state.blockState.blocks);
        list.addAll(value.data);
        emit(
          state.copyWith(
            blockState: state.blockState.copyWith(
              isLoadingMore: false,
              error: null,
              blocks: list,
              next: value.nextPage(),
              previous: value.previousPage(),
              isLastPage:
                  value.data.length < _blockPageSize || value.next == null,
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
    final userId = state.profile?.user?.id;
    if (userId == null) return;

    final questionsState = state.questionsState;

    if (questionsState.isLoading ||
        questionsState.isLoadingMore ||
        questionsState.isLast) {
      return;
    }

    emit(
      state.copyWith(questionsState: questionsState.copyWith(isLoading: true)),
    );
    final result = await _quizRepository.getUserQuestions(
      userId,
      1,
      _questionsPageSize,
    );
    result.fold(
      (error) {
        emit(
          state.copyWith(
            questionsState: state.questionsState.copyWith(
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
            questionsState: state.questionsState.copyWith(
              isLoading: false,
              error: null,
              questions: value.data,
              next: value.nextPage(),
              previous: value.previousPage(),
              isLast:
                  value.data.length < _questionsPageSize || value.next == null,
            ),
          ),
        );
      },
    );
  }

  Future<void> getQuestionsByPage() async {
    final userId = state.profile?.user?.id;
    if (userId == null) return;

    final questionsState = state.questionsState;
    if (questionsState.isLoading ||
        questionsState.isLoadingMore ||
        questionsState.isLast) {
      return;
    }

    emit(
      state.copyWith(
        questionsState: questionsState.copyWith(isLoadingMore: true),
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
            questionsState: questionsState.copyWith(
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
            questionsState: questionsState.copyWith(
              isLoadingMore: false,
              error: null,
              questions: list,
              next: value.nextPage(),
              previous: value.previousPage(),
              isLast:
                  value.data.length < _questionsPageSize || value.next == null,
            ),
          ),
        );
      },
    );
  }
}
