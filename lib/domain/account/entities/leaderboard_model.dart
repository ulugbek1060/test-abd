import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/account/models/leaderboard_response.dart';

class LeaderboardModel extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<LeaderboardUser> users;

  const LeaderboardModel({
    required this.count,
    this.next,
    this.previous,
    this.users = const [],
  });

  @override
  List<Object?> get props => [count, next, previous, users];

  static LeaderboardModel fromResponse(LeaderboardResponse result) {
    return LeaderboardModel(
      count: result.count ?? 0,
      next: result.next,
      previous: result.previous,
      users: result.results
          .map(
            (e) => LeaderboardUser(
              id: e.id ?? 0,
              username: e.username ?? '',
              profileImage: e.profile_image,
              createdTests: e.created_tests ?? 0,
              coins: e.coins ?? 0,
              todayRank: e.today_rank ?? 0,
              yesterdayRank: e.yesterday_rank ?? 0,
              rankChange: e.rank_change,
              rankChangeValue: e.rank_change_value ?? 0,
              testsSolved: e.tests_solved ?? 0,
              avgTime: e.avg_time ?? 0.0,
              followers: e.followers ?? 0,
              following: e.following ?? 0,
              isFollowing: e.is_following ?? false,
            ),
          )
          .toList(),
    );
  }
}

class LeaderboardUser extends Equatable {
  final int id;
  final String username;
  final String? profileImage;
  final int createdTests;
  final int coins;
  final int todayRank;
  final int yesterdayRank;
  final String? rankChange;
  final int rankChangeValue;
  final int testsSolved;
  final double avgTime;
  final int followers;
  final int following;
  final bool isFollowing;
  final bool isLoading;

  const LeaderboardUser({
    required this.id,
    required this.username,
    this.profileImage,
    required this.createdTests,
    required this.coins,
    required this.todayRank,
    required this.yesterdayRank,
    this.rankChange,
    required this.rankChangeValue,
    required this.testsSolved,
    required this.avgTime,
    required this.followers,
    required this.following,
    this.isFollowing = false,
    this.isLoading = false,
  });

  LeaderboardUser copyWith({
    int? id,
    String? username,
    String? profileImage,
    int? createdTests,
    int? coins,
    int? todayRank,
    int? yesterdayRank,
    String? rankChange,
    int? rankChangeValue,
    int? testsSolved,
    double? avgTime,
    int? followers,
    int? following,
    bool? isFollowing,
    bool? isLoading,
  }) {
    return LeaderboardUser(
      id: id ?? this.id,
      username: username ?? this.username,
      profileImage: profileImage ?? this.profileImage,
      createdTests: createdTests ?? this.createdTests,
      coins: coins ?? this.coins,
      todayRank: todayRank ?? this.todayRank,
      yesterdayRank: yesterdayRank ?? this.yesterdayRank,
      rankChange: rankChange ?? this.rankChange,
      rankChangeValue: rankChangeValue ?? this.rankChangeValue,
      testsSolved: testsSolved ?? this.testsSolved,
      avgTime: avgTime ?? this.avgTime,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      isFollowing: isFollowing ?? this.isFollowing,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  static LeaderboardUser fromResponse(LeaderboardUserResponse response) {
    return LeaderboardUser(
      id: response.id ?? 0,
      username: response.username ?? '',
      profileImage: response.profile_image,
      createdTests: response.created_tests ?? 0,
      coins: response.coins ?? 0,
      todayRank: response.today_rank ?? 0,
      yesterdayRank: response.yesterday_rank ?? 0,
      rankChange: response.rank_change,
      rankChangeValue: response.rank_change_value ?? 0,
      testsSolved: response.tests_solved ?? 0,
      avgTime: response.avg_time ?? 0.0,
      followers: response.followers ?? 0,
      following: response.following ?? 0,
      isFollowing: response.is_following ?? false,
      isLoading: false,
    );
  }

  @override
  List<Object?> get props => [
    id,
    username,
    profileImage,
    createdTests,
    coins,
    todayRank,
    yesterdayRank,
    rankChange,
    rankChangeValue,
    testsSolved,
    avgTime,
    followers,
    following,
    isFollowing,
    isLoading,
  ];
}
