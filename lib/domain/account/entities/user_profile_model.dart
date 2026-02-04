import 'package:equatable/equatable.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/utils/knowledge_level.dart';
import 'package:testabd/data/remote_source/account/model/user_profile_response.dart';

class UserProfileModel extends Equatable {
  final UserModel? user;
  final UserStatsModel? stats;

  const UserProfileModel({this.user, this.stats});

  UserProfileModel copyWith({UserModel? user, UserStatsModel? stats}) {
    return UserProfileModel(
      user: user ?? this.user,
      stats: stats ?? this.stats,
    );
  }

  UserProfileModel setFollowing(bool isFollowing) {
    return copyWith(user: user?.copyWith(isFollowing: isFollowing));
  }

  static UserProfileModel fromResponse(UserProfileResponse? response) {
    return UserProfileModel(
      user: UserModel(
        id: response?.user?.id,
        username: response?.user?.username,
        firstName: response?.user?.firstName,
        lastName: response?.user?.lastName,
        bio: response?.user?.bio,
        profileImage: response?.user?.profileImage,
        followersCount: response?.user?.followersCount,
        followingCount: response?.user?.followingCount,
        isFollowing: response?.user?.isFollowing,
        level: KnowledgeLevel.tryParse(response?.user?.level),
        joinDate: DateTime.tryParse(response?.user?.joinDate ?? ''),
        coins: response?.user?.coins,
      ),
      stats: UserStatsModel(
        totalTests: response?.stats?.totalTests,
        correctAnswers: response?.stats?.correctAnswers,
        wrongAnswers: response?.stats?.wrongAnswers,
        accuracy: response?.stats?.accuracy,
      ),
    );
  }

  @override
  List<Object?> get props => [user, stats];
}

class UserModel extends Equatable {
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? bio;
  final String? profileImage;
  final int? followersCount;
  final int? followingCount;
  final bool? isFollowing;
  final KnowledgeLevel? level;
  final DateTime? joinDate;
  final int? coins;
  final bool isMe;

  const UserModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.bio,
    this.profileImage,
    this.followersCount,
    this.followingCount,
    this.isFollowing,
    this.level,
    this.joinDate,
    this.coins,
    this.isMe = false,
  });

  // get full name
  String get getFullName {
    // capitalize the first letter of each name
    return '${capitalize(firstName)} ${capitalize(lastName)}';
  }

  String get getFollowersCount {
    return followersCount?.toString() ?? '';
  }

  String get getFollowingCount {
    return followingCount?.toString() ?? '';
  }

  UserModel copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? bio,
    String? profileImage,
    int? followersCount,
    int? followingCount,
    bool? isFollowing,
    KnowledgeLevel? level,
    DateTime? joinDate,
    int? coins,
    bool? isMe,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      bio: bio ?? this.bio,
      profileImage: profileImage ?? this.profileImage,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      isFollowing: isFollowing ?? this.isFollowing,
      level: level ?? this.level,
      joinDate: joinDate ?? this.joinDate,
      coins: coins ?? this.coins,
      isMe: isMe ?? this.isMe,
    );
  }

  @override
  List<Object?> get props => [
    id,
    username,
    firstName,
    lastName,
    bio,
    profileImage,
    followersCount,
    followingCount,
    isFollowing,
    level,
    joinDate,
    coins,
    isMe
  ];
}

class UserStatsModel extends Equatable {
  final int? totalTests;
  final int? correctAnswers;
  final int? wrongAnswers;
  final double? accuracy;

  const UserStatsModel({
    this.totalTests,
    this.correctAnswers,
    this.wrongAnswers,
    this.accuracy,
  });

  @override
  List<Object?> get props => [
    totalTests,
    correctAnswers,
    wrongAnswers,
    accuracy,
  ];
}
