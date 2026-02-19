import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/utils/follow_listeners.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/users/user_profile_state.dart';

@injectable
class UserProfileCubit extends Cubit<UserProfileState> {
  final AccountRepository _accountRepository;
  final QuizRepository _quizRepository;
  final ConnectionFollowEventListener _connectionFollowListener;
  final ConnectionFollowEventListener _userProfileFollowListener;
  final ConnectionFollowEventListener _leaderboardFollowListener;
  final ConnectionFollowEventListener _profileFollowListener;
  late StreamSubscription<UserFollowEvent> _followSubscription;
  final String username;

  final int _pageSize = 10;

  @factoryMethod
  UserProfileCubit.create(
    @factoryParam this.username,
    this._accountRepository,
    this._quizRepository,
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

  /// main loading
  Future<void> load() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true, error: null));

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
            profile: value.copyWith(
              user: value.user?.copyWith(isMe: value.user?.id == id),
            ),
          ),
        );

        /// load topics
        loadBlocks();
        loadQuestions();
      },
    );
  }

  Future<void> refresh() => load();

  Future<void> loadBlocks() async {
    final userId = state.profile?.user?.id;
    if (userId == null) return;
    if (state.topicsState.isLoading || state.topicsState.isLoadingMore) return;

    final currentPage = state.topicsState.nextPage;

    emit(
      state.copyWith(
        topicsState: state.topicsState.copyWith(
          isLoading: currentPage <= 1,
          isLoadingMore: currentPage > 1,
        ),
      ),
    );
    final result = await _quizRepository.getBocksByUserId(
      userId,
      pageSize: _pageSize,
      page: currentPage,
    );
    result.fold(
      (error) {
        final newTopicState = state.topicsState.copyWith(
          isLoading: false,
          isLoadingMore: false,
        );
        emit(state.copyWith(topicsState: newTopicState, error: error.message));
      },
      (value) {
        final newTopicState = state.topicsState.copyWith(
          topics: [...state.topicsState.topics, ...value.data],
          nextPage: currentPage + 1,
          previousPage: currentPage > 1 ? currentPage - 1 : 0,
          isLoading: false,
          isLoadingMore: false,
        );
        emit(state.copyWith(topicsState: newTopicState));
      },
    );
  }

  Future<void> loadQuestions() async {
    final userId = state.profile?.user?.id;
    if (userId == null) return;

    final questionsState = state.questionsState;
    if (questionsState.isLoading) return;

    emit(
      state.copyWith(questionsState: questionsState.copyWith(isLoading: true)),
    );
    final result = await _quizRepository.getUserQuestions(userId);
    result.fold(
      (error) {
        final newQuestionsState = questionsState.copyWith(
          isLoading: false,
          error: error.message,
        );
        emit(state.copyWith(questionsState: newQuestionsState));
      },
      (value) {
        final newQuestionsState = questionsState.copyWith(
          questions: value,
          error: null,
          isLoading: false,
        );
        emit(state.copyWith(questionsState: newQuestionsState));
      },
    );
  }

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
}
