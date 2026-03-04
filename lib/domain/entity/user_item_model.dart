import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/account/models/referrals_list_response.dart';
import 'package:testabd/data/remote_source/quiz/models/user_blocks_response.dart';

class UserItemModel extends Equatable {
  final int? id;
  final String? username;
  final String? profileImage;
  final bool? isBadged;
  final bool? isPremium;
  final bool? isFollowing;

  // loadings
  final bool isFollowInLoading;

  const UserItemModel({
    this.id,
    this.username,
    this.profileImage,
    this.isBadged,
    this.isPremium,
    this.isFollowing,
    this.isFollowInLoading = false,
  });

  UserItemModel copyWith({
    int? id,
    String? username,
    String? profileImage,
    bool? isBadged,
    bool? isPremium,
    bool? isFollowing,
    bool? isFollowInLoading,
  }) => UserItemModel(
    id: id ?? this.id,
    username: username ?? this.username,
    profileImage: profileImage ?? this.profileImage,
    isBadged: isBadged ?? this.isBadged,
    isPremium: isPremium ?? this.isPremium,
    isFollowing: isFollowing ?? this.isFollowing,
    isFollowInLoading: isFollowInLoading ?? this.isFollowInLoading,
  );

  @override
  List<Object?> get props => [
    id,
    username,
    profileImage,
    isBadged,
    isPremium,
    isFollowing,
    isFollowInLoading,
  ];

  static UserItemModel fromResponse1(User? response) {
    return UserItemModel(
      id: response?.id,
      username: response?.username,
      profileImage: response?.profileImage,
      isBadged: response?.isBadged,
      isPremium: response?.isPremium,
      isFollowing: response?.isFollowing,
    );
  }
}
