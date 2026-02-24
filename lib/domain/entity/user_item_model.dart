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

  const UserItemModel({
    this.id,
    this.username,
    this.profileImage,
    this.isBadged,
    this.isPremium,
    this.isFollowing,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    profileImage,
    isBadged,
    isPremium,
    isFollowing,
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
