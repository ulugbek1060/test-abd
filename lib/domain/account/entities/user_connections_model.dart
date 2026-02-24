import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/account/models/user_connections_response.dart';
import 'package:testabd/features/users/user_connection_screen.dart';

class UserConnectionsModel extends Equatable {
  final List<UserConnectionModel> followers;
  final List<UserConnectionModel> following;

  const UserConnectionsModel({
    this.followers = const [],
    this.following = const [],
  });

  // copyWith function for UserConnectionsModel
  UserConnectionsModel copyWith({
    List<UserConnectionModel>? followers,
    List<UserConnectionModel>? following,
  }) {
    return UserConnectionsModel(
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  // models without user provided userId
  UserConnectionsModel toggleIsMe(int? userId) {
    return UserConnectionsModel(
      followers: followers.map((e) {
        return e.copyWith(isMe: e.id == userId);
      }).toList(),
      following: following.map((e) {
        return e.copyWith(isMe: e.id == userId);
      }).toList(),
    );
  }

  // find user
  UserConnectionModel? findUser(int userId) {
    return followers.firstWhereOrNull((follower) => follower.id == userId) ??
        following.firstWhereOrNull((user) => user.id == userId);
  }

  // Start loading for a specific user
  UserConnectionsModel startLoadingForUser(int userId) {
    return copyWith(
      followers: followers.map((follower) {
        if (follower.id == userId) {
          return follower.startLoading();
        }
        return follower;
      }).toList(),
      following: following.map((user) {
        if (user.id == userId) {
          return user.startLoading();
        }
        return user;
      }).toList(),
    );
  }

  // Stop loading for a specific user
  UserConnectionsModel stopLoadingForUser(int userId) {
    return copyWith(
      followers: followers.map((follower) {
        if (follower.id == userId) {
          return follower.stopLoading();
        }
        return follower;
      }).toList(),
      following: following.map((user) {
        if (user.id == userId) {
          return user.stopLoading();
        }
        return user;
      }).toList(),
    );
  }

  // Toggle following with proper loading flow
  UserConnectionsModel toggleUserFollowingWithLoading(int userId) {
    return copyWith(
      followers: followers.map((follower) {
        if (follower.id == userId) {
          return follower.toggleFollowingWithLoading();
        }
        return follower;
      }).toList(),
      following: following.map((user) {
        if (user.id == userId) {
          return user.toggleFollowingWithLoading();
        }
        return user;
      }).toList(),
    );
  }

  // Toggle following with proper loading flow
  UserConnectionsModel setFollowingByUserId(int userId, bool isFollowing) {
    return copyWith(
      followers: followers.map((follower) {
        if (follower.id == userId) {
          return follower.copyWith(isFollowing: isFollowing);
        }
        return follower;
      }).toList(),
      following: following.map((user) {
        if (user.id == userId) {
          return user.copyWith(isFollowing: isFollowing);
        }
        return user;
      }).toList(),
    );
  }

  @override
  List<Object?> get props => [followers, following];

  static UserConnectionsModel fromResponse(UserConnectionsResponse result) {
    return UserConnectionsModel(
      followers: result.followers
          .map(
            (e) => UserConnectionModel(
              id: e.id ?? 0,
              username: e.username ?? '',
              firstName: e.first_name ?? '',
              lastName: e.last_name ?? '',
              profileImage: e.profile_image,
              isFollowing: e.is_following ?? false,
            ),
          )
          .toList(),
      following: result.following
          .map(
            (e) => UserConnectionModel(
              id: e.id ?? 0,
              username: e.username ?? '',
              firstName: e.first_name ?? '',
              lastName: e.last_name ?? '',
              profileImage: e.profile_image,
              isFollowing: e.is_following ?? false,
            ),
          )
          .toList(),
    );
  }
}

class UserConnectionModel extends Equatable {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String? profileImage;
  final bool isFollowing;
  final bool isLoading;
  final bool isMe;

  const UserConnectionModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
    required this.isFollowing,
    this.isLoading = false,
    this.isMe = false,
  });

  // copyWith function for UserConnectionModel
  UserConnectionModel copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? profileImage,
    bool? isFollowing,
    bool? isLoading,
    bool? isMe,
  }) {
    return UserConnectionModel(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profileImage: profileImage ?? this.profileImage,
      isFollowing: isFollowing ?? this.isFollowing,
      isLoading: isLoading ?? this.isLoading,
      isMe: isMe ?? this.isMe,
    );
  }

  // Toggle following status
  UserConnectionModel toggleFollowing() {
    return copyWith(isFollowing: !isFollowing);
  }

  // Start loading
  UserConnectionModel startLoading() {
    return copyWith(isLoading: true);
  }

  // Stop loading
  UserConnectionModel stopLoading() {
    return copyWith(isLoading: false);
  }

  // Toggle loading status
  UserConnectionModel toggleLoading() {
    return copyWith(isLoading: !isLoading);
  }

  // Toggle following with loading state
  UserConnectionModel toggleFollowingWithLoading() {
    return copyWith(
      isFollowing: !isFollowing,
      isLoading: false, // Reset loading when operation completes
    );
  }

  // Set specific loading state
  UserConnectionModel setLoading(bool loading) {
    return copyWith(isLoading: loading);
  }

  @override
  List<Object?> get props => [
    id,
    username,
    firstName,
    lastName,
    profileImage,
    isFollowing,
    isLoading,
    isMe,
  ];
}
