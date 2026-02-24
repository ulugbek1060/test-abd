// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) {
  return _UserProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$UserProfileResponse {
  UserData? get user => throw _privateConstructorUsedError;
  UserStats? get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileResponseCopyWith<UserProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileResponseCopyWith<$Res> {
  factory $UserProfileResponseCopyWith(
          UserProfileResponse value, $Res Function(UserProfileResponse) then) =
      _$UserProfileResponseCopyWithImpl<$Res, UserProfileResponse>;
  @useResult
  $Res call({UserData? user, UserStats? stats});

  $UserDataCopyWith<$Res>? get user;
  $UserStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class _$UserProfileResponseCopyWithImpl<$Res, $Val extends UserProfileResponse>
    implements $UserProfileResponseCopyWith<$Res> {
  _$UserProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? stats = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserStats?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $UserStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileResponseImplCopyWith<$Res>
    implements $UserProfileResponseCopyWith<$Res> {
  factory _$$UserProfileResponseImplCopyWith(_$UserProfileResponseImpl value,
          $Res Function(_$UserProfileResponseImpl) then) =
      __$$UserProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserData? user, UserStats? stats});

  @override
  $UserDataCopyWith<$Res>? get user;
  @override
  $UserStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$UserProfileResponseImplCopyWithImpl<$Res>
    extends _$UserProfileResponseCopyWithImpl<$Res, _$UserProfileResponseImpl>
    implements _$$UserProfileResponseImplCopyWith<$Res> {
  __$$UserProfileResponseImplCopyWithImpl(_$UserProfileResponseImpl _value,
      $Res Function(_$UserProfileResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? stats = freezed,
  }) {
    return _then(_$UserProfileResponseImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserStats?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileResponseImpl implements _UserProfileResponse {
  const _$UserProfileResponseImpl({this.user, this.stats});

  factory _$UserProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileResponseImplFromJson(json);

  @override
  final UserData? user;
  @override
  final UserStats? stats;

  @override
  String toString() {
    return 'UserProfileResponse(user: $user, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, stats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileResponseImplCopyWith<_$UserProfileResponseImpl> get copyWith =>
      __$$UserProfileResponseImplCopyWithImpl<_$UserProfileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileResponseImplToJson(
      this,
    );
  }
}

abstract class _UserProfileResponse implements UserProfileResponse {
  const factory _UserProfileResponse(
      {final UserData? user,
      final UserStats? stats}) = _$UserProfileResponseImpl;

  factory _UserProfileResponse.fromJson(Map<String, dynamic> json) =
      _$UserProfileResponseImpl.fromJson;

  @override
  UserData? get user;
  @override
  UserStats? get stats;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileResponseImplCopyWith<_$UserProfileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  int? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_count')
  int? get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_count')
  int? get followingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following')
  bool? get isFollowing => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'join_date')
  String? get joinDate => throw _privateConstructorUsedError;
  int? get coins => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {int? id,
      String? username,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? bio,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'following_count') int? followingCount,
      @JsonKey(name: 'is_following') bool? isFollowing,
      String? level,
      @JsonKey(name: 'join_date') String? joinDate,
      int? coins});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? bio = freezed,
    Object? profileImage = freezed,
    Object? followersCount = freezed,
    Object? followingCount = freezed,
    Object? isFollowing = freezed,
    Object? level = freezed,
    Object? joinDate = freezed,
    Object? coins = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
      coins: freezed == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? username,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? bio,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'following_count') int? followingCount,
      @JsonKey(name: 'is_following') bool? isFollowing,
      String? level,
      @JsonKey(name: 'join_date') String? joinDate,
      int? coins});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? bio = freezed,
    Object? profileImage = freezed,
    Object? followersCount = freezed,
    Object? followingCount = freezed,
    Object? isFollowing = freezed,
    Object? level = freezed,
    Object? joinDate = freezed,
    Object? coins = freezed,
  }) {
    return _then(_$UserDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
      coins: freezed == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {this.id,
      this.username,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.bio,
      @JsonKey(name: 'profile_image') this.profileImage,
      @JsonKey(name: 'followers_count') this.followersCount,
      @JsonKey(name: 'following_count') this.followingCount,
      @JsonKey(name: 'is_following') this.isFollowing,
      this.level,
      @JsonKey(name: 'join_date') this.joinDate,
      this.coins});

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? username;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? bio;
  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  @JsonKey(name: 'followers_count')
  final int? followersCount;
  @override
  @JsonKey(name: 'following_count')
  final int? followingCount;
  @override
  @JsonKey(name: 'is_following')
  final bool? isFollowing;
  @override
  final String? level;
  @override
  @JsonKey(name: 'join_date')
  final String? joinDate;
  @override
  final int? coins;

  @override
  String toString() {
    return 'UserData(id: $id, username: $username, firstName: $firstName, lastName: $lastName, bio: $bio, profileImage: $profileImage, followersCount: $followersCount, followingCount: $followingCount, isFollowing: $isFollowing, level: $level, joinDate: $joinDate, coins: $coins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.coins, coins) || other.coins == coins));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
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
      coins);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {final int? id,
      final String? username,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      final String? bio,
      @JsonKey(name: 'profile_image') final String? profileImage,
      @JsonKey(name: 'followers_count') final int? followersCount,
      @JsonKey(name: 'following_count') final int? followingCount,
      @JsonKey(name: 'is_following') final bool? isFollowing,
      final String? level,
      @JsonKey(name: 'join_date') final String? joinDate,
      final int? coins}) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get username;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get bio;
  @override
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  @JsonKey(name: 'followers_count')
  int? get followersCount;
  @override
  @JsonKey(name: 'following_count')
  int? get followingCount;
  @override
  @JsonKey(name: 'is_following')
  bool? get isFollowing;
  @override
  String? get level;
  @override
  @JsonKey(name: 'join_date')
  String? get joinDate;
  @override
  int? get coins;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStats _$UserStatsFromJson(Map<String, dynamic> json) {
  return _UserStats.fromJson(json);
}

/// @nodoc
mixin _$UserStats {
  @JsonKey(name: 'total_tests')
  int? get totalTests => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answers')
  int? get correctAnswers => throw _privateConstructorUsedError;
  @JsonKey(name: 'wrong_answers')
  int? get wrongAnswers => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatsCopyWith<UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsCopyWith<$Res> {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) then) =
      _$UserStatsCopyWithImpl<$Res, UserStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_tests') int? totalTests,
      @JsonKey(name: 'correct_answers') int? correctAnswers,
      @JsonKey(name: 'wrong_answers') int? wrongAnswers,
      double? accuracy});
}

/// @nodoc
class _$UserStatsCopyWithImpl<$Res, $Val extends UserStats>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTests = freezed,
    Object? correctAnswers = freezed,
    Object? wrongAnswers = freezed,
    Object? accuracy = freezed,
  }) {
    return _then(_value.copyWith(
      totalTests: freezed == totalTests
          ? _value.totalTests
          : totalTests // ignore: cast_nullable_to_non_nullable
              as int?,
      correctAnswers: freezed == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int?,
      wrongAnswers: freezed == wrongAnswers
          ? _value.wrongAnswers
          : wrongAnswers // ignore: cast_nullable_to_non_nullable
              as int?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatsImplCopyWith<$Res>
    implements $UserStatsCopyWith<$Res> {
  factory _$$UserStatsImplCopyWith(
          _$UserStatsImpl value, $Res Function(_$UserStatsImpl) then) =
      __$$UserStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_tests') int? totalTests,
      @JsonKey(name: 'correct_answers') int? correctAnswers,
      @JsonKey(name: 'wrong_answers') int? wrongAnswers,
      double? accuracy});
}

/// @nodoc
class __$$UserStatsImplCopyWithImpl<$Res>
    extends _$UserStatsCopyWithImpl<$Res, _$UserStatsImpl>
    implements _$$UserStatsImplCopyWith<$Res> {
  __$$UserStatsImplCopyWithImpl(
      _$UserStatsImpl _value, $Res Function(_$UserStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTests = freezed,
    Object? correctAnswers = freezed,
    Object? wrongAnswers = freezed,
    Object? accuracy = freezed,
  }) {
    return _then(_$UserStatsImpl(
      totalTests: freezed == totalTests
          ? _value.totalTests
          : totalTests // ignore: cast_nullable_to_non_nullable
              as int?,
      correctAnswers: freezed == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int?,
      wrongAnswers: freezed == wrongAnswers
          ? _value.wrongAnswers
          : wrongAnswers // ignore: cast_nullable_to_non_nullable
              as int?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatsImpl implements _UserStats {
  const _$UserStatsImpl(
      {@JsonKey(name: 'total_tests') this.totalTests,
      @JsonKey(name: 'correct_answers') this.correctAnswers,
      @JsonKey(name: 'wrong_answers') this.wrongAnswers,
      this.accuracy});

  factory _$UserStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatsImplFromJson(json);

  @override
  @JsonKey(name: 'total_tests')
  final int? totalTests;
  @override
  @JsonKey(name: 'correct_answers')
  final int? correctAnswers;
  @override
  @JsonKey(name: 'wrong_answers')
  final int? wrongAnswers;
  @override
  final double? accuracy;

  @override
  String toString() {
    return 'UserStats(totalTests: $totalTests, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, accuracy: $accuracy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatsImpl &&
            (identical(other.totalTests, totalTests) ||
                other.totalTests == totalTests) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.wrongAnswers, wrongAnswers) ||
                other.wrongAnswers == wrongAnswers) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalTests, correctAnswers, wrongAnswers, accuracy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      __$$UserStatsImplCopyWithImpl<_$UserStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatsImplToJson(
      this,
    );
  }
}

abstract class _UserStats implements UserStats {
  const factory _UserStats(
      {@JsonKey(name: 'total_tests') final int? totalTests,
      @JsonKey(name: 'correct_answers') final int? correctAnswers,
      @JsonKey(name: 'wrong_answers') final int? wrongAnswers,
      final double? accuracy}) = _$UserStatsImpl;

  factory _UserStats.fromJson(Map<String, dynamic> json) =
      _$UserStatsImpl.fromJson;

  @override
  @JsonKey(name: 'total_tests')
  int? get totalTests;
  @override
  @JsonKey(name: 'correct_answers')
  int? get correctAnswers;
  @override
  @JsonKey(name: 'wrong_answers')
  int? get wrongAnswers;
  @override
  double? get accuracy;
  @override
  @JsonKey(ignore: true)
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
