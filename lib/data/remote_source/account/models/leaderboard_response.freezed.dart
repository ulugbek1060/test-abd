// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaderboardResponse _$LeaderboardResponseFromJson(Map<String, dynamic> json) {
  return _LeaderboardResponse.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardResponse {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<LeaderboardUserResponse> get results =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaderboardResponseCopyWith<LeaderboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardResponseCopyWith<$Res> {
  factory $LeaderboardResponseCopyWith(
          LeaderboardResponse value, $Res Function(LeaderboardResponse) then) =
      _$LeaderboardResponseCopyWithImpl<$Res, LeaderboardResponse>;
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<LeaderboardUserResponse> results});
}

/// @nodoc
class _$LeaderboardResponseCopyWithImpl<$Res, $Val extends LeaderboardResponse>
    implements $LeaderboardResponseCopyWith<$Res> {
  _$LeaderboardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardUserResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardResponseImplCopyWith<$Res>
    implements $LeaderboardResponseCopyWith<$Res> {
  factory _$$LeaderboardResponseImplCopyWith(_$LeaderboardResponseImpl value,
          $Res Function(_$LeaderboardResponseImpl) then) =
      __$$LeaderboardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<LeaderboardUserResponse> results});
}

/// @nodoc
class __$$LeaderboardResponseImplCopyWithImpl<$Res>
    extends _$LeaderboardResponseCopyWithImpl<$Res, _$LeaderboardResponseImpl>
    implements _$$LeaderboardResponseImplCopyWith<$Res> {
  __$$LeaderboardResponseImplCopyWithImpl(_$LeaderboardResponseImpl _value,
      $Res Function(_$LeaderboardResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$LeaderboardResponseImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardUserResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardResponseImpl implements _LeaderboardResponse {
  const _$LeaderboardResponseImpl(
      {this.count,
      this.next,
      this.previous,
      final List<LeaderboardUserResponse> results = const []})
      : _results = results;

  factory _$LeaderboardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardResponseImplFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<LeaderboardUserResponse> _results;
  @override
  @JsonKey()
  List<LeaderboardUserResponse> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'LeaderboardResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardResponseImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardResponseImplCopyWith<_$LeaderboardResponseImpl> get copyWith =>
      __$$LeaderboardResponseImplCopyWithImpl<_$LeaderboardResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardResponseImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardResponse implements LeaderboardResponse {
  const factory _LeaderboardResponse(
      {final int? count,
      final String? next,
      final String? previous,
      final List<LeaderboardUserResponse> results}) = _$LeaderboardResponseImpl;

  factory _LeaderboardResponse.fromJson(Map<String, dynamic> json) =
      _$LeaderboardResponseImpl.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<LeaderboardUserResponse> get results;
  @override
  @JsonKey(ignore: true)
  _$$LeaderboardResponseImplCopyWith<_$LeaderboardResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaderboardUserResponse _$LeaderboardUserResponseFromJson(
    Map<String, dynamic> json) {
  return _LeaderboardUserResponse.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardUserResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get profile_image => throw _privateConstructorUsedError;
  int? get created_tests => throw _privateConstructorUsedError;
  int? get coins => throw _privateConstructorUsedError;
  int? get today_rank => throw _privateConstructorUsedError;
  int? get yesterday_rank => throw _privateConstructorUsedError;
  String? get rank_change => throw _privateConstructorUsedError;
  int? get rank_change_value => throw _privateConstructorUsedError;
  int? get tests_solved => throw _privateConstructorUsedError;
  double? get avg_time => throw _privateConstructorUsedError;
  int? get followers => throw _privateConstructorUsedError;
  int? get following => throw _privateConstructorUsedError;
  bool? get is_following => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaderboardUserResponseCopyWith<LeaderboardUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardUserResponseCopyWith<$Res> {
  factory $LeaderboardUserResponseCopyWith(LeaderboardUserResponse value,
          $Res Function(LeaderboardUserResponse) then) =
      _$LeaderboardUserResponseCopyWithImpl<$Res, LeaderboardUserResponse>;
  @useResult
  $Res call(
      {int? id,
      String? username,
      String? profile_image,
      int? created_tests,
      int? coins,
      int? today_rank,
      int? yesterday_rank,
      String? rank_change,
      int? rank_change_value,
      int? tests_solved,
      double? avg_time,
      int? followers,
      int? following,
      bool? is_following});
}

/// @nodoc
class _$LeaderboardUserResponseCopyWithImpl<$Res,
        $Val extends LeaderboardUserResponse>
    implements $LeaderboardUserResponseCopyWith<$Res> {
  _$LeaderboardUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? profile_image = freezed,
    Object? created_tests = freezed,
    Object? coins = freezed,
    Object? today_rank = freezed,
    Object? yesterday_rank = freezed,
    Object? rank_change = freezed,
    Object? rank_change_value = freezed,
    Object? tests_solved = freezed,
    Object? avg_time = freezed,
    Object? followers = freezed,
    Object? following = freezed,
    Object? is_following = freezed,
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
      profile_image: freezed == profile_image
          ? _value.profile_image
          : profile_image // ignore: cast_nullable_to_non_nullable
              as String?,
      created_tests: freezed == created_tests
          ? _value.created_tests
          : created_tests // ignore: cast_nullable_to_non_nullable
              as int?,
      coins: freezed == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int?,
      today_rank: freezed == today_rank
          ? _value.today_rank
          : today_rank // ignore: cast_nullable_to_non_nullable
              as int?,
      yesterday_rank: freezed == yesterday_rank
          ? _value.yesterday_rank
          : yesterday_rank // ignore: cast_nullable_to_non_nullable
              as int?,
      rank_change: freezed == rank_change
          ? _value.rank_change
          : rank_change // ignore: cast_nullable_to_non_nullable
              as String?,
      rank_change_value: freezed == rank_change_value
          ? _value.rank_change_value
          : rank_change_value // ignore: cast_nullable_to_non_nullable
              as int?,
      tests_solved: freezed == tests_solved
          ? _value.tests_solved
          : tests_solved // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_time: freezed == avg_time
          ? _value.avg_time
          : avg_time // ignore: cast_nullable_to_non_nullable
              as double?,
      followers: freezed == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int?,
      following: freezed == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as int?,
      is_following: freezed == is_following
          ? _value.is_following
          : is_following // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardUserResponseImplCopyWith<$Res>
    implements $LeaderboardUserResponseCopyWith<$Res> {
  factory _$$LeaderboardUserResponseImplCopyWith(
          _$LeaderboardUserResponseImpl value,
          $Res Function(_$LeaderboardUserResponseImpl) then) =
      __$$LeaderboardUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? username,
      String? profile_image,
      int? created_tests,
      int? coins,
      int? today_rank,
      int? yesterday_rank,
      String? rank_change,
      int? rank_change_value,
      int? tests_solved,
      double? avg_time,
      int? followers,
      int? following,
      bool? is_following});
}

/// @nodoc
class __$$LeaderboardUserResponseImplCopyWithImpl<$Res>
    extends _$LeaderboardUserResponseCopyWithImpl<$Res,
        _$LeaderboardUserResponseImpl>
    implements _$$LeaderboardUserResponseImplCopyWith<$Res> {
  __$$LeaderboardUserResponseImplCopyWithImpl(
      _$LeaderboardUserResponseImpl _value,
      $Res Function(_$LeaderboardUserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? profile_image = freezed,
    Object? created_tests = freezed,
    Object? coins = freezed,
    Object? today_rank = freezed,
    Object? yesterday_rank = freezed,
    Object? rank_change = freezed,
    Object? rank_change_value = freezed,
    Object? tests_solved = freezed,
    Object? avg_time = freezed,
    Object? followers = freezed,
    Object? following = freezed,
    Object? is_following = freezed,
  }) {
    return _then(_$LeaderboardUserResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profile_image: freezed == profile_image
          ? _value.profile_image
          : profile_image // ignore: cast_nullable_to_non_nullable
              as String?,
      created_tests: freezed == created_tests
          ? _value.created_tests
          : created_tests // ignore: cast_nullable_to_non_nullable
              as int?,
      coins: freezed == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int?,
      today_rank: freezed == today_rank
          ? _value.today_rank
          : today_rank // ignore: cast_nullable_to_non_nullable
              as int?,
      yesterday_rank: freezed == yesterday_rank
          ? _value.yesterday_rank
          : yesterday_rank // ignore: cast_nullable_to_non_nullable
              as int?,
      rank_change: freezed == rank_change
          ? _value.rank_change
          : rank_change // ignore: cast_nullable_to_non_nullable
              as String?,
      rank_change_value: freezed == rank_change_value
          ? _value.rank_change_value
          : rank_change_value // ignore: cast_nullable_to_non_nullable
              as int?,
      tests_solved: freezed == tests_solved
          ? _value.tests_solved
          : tests_solved // ignore: cast_nullable_to_non_nullable
              as int?,
      avg_time: freezed == avg_time
          ? _value.avg_time
          : avg_time // ignore: cast_nullable_to_non_nullable
              as double?,
      followers: freezed == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int?,
      following: freezed == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as int?,
      is_following: freezed == is_following
          ? _value.is_following
          : is_following // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardUserResponseImpl implements _LeaderboardUserResponse {
  const _$LeaderboardUserResponseImpl(
      {this.id,
      this.username,
      this.profile_image,
      this.created_tests,
      this.coins,
      this.today_rank,
      this.yesterday_rank,
      this.rank_change,
      this.rank_change_value,
      this.tests_solved,
      this.avg_time,
      this.followers,
      this.following,
      this.is_following});

  factory _$LeaderboardUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardUserResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? username;
  @override
  final String? profile_image;
  @override
  final int? created_tests;
  @override
  final int? coins;
  @override
  final int? today_rank;
  @override
  final int? yesterday_rank;
  @override
  final String? rank_change;
  @override
  final int? rank_change_value;
  @override
  final int? tests_solved;
  @override
  final double? avg_time;
  @override
  final int? followers;
  @override
  final int? following;
  @override
  final bool? is_following;

  @override
  String toString() {
    return 'LeaderboardUserResponse(id: $id, username: $username, profile_image: $profile_image, created_tests: $created_tests, coins: $coins, today_rank: $today_rank, yesterday_rank: $yesterday_rank, rank_change: $rank_change, rank_change_value: $rank_change_value, tests_solved: $tests_solved, avg_time: $avg_time, followers: $followers, following: $following, is_following: $is_following)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardUserResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profile_image, profile_image) ||
                other.profile_image == profile_image) &&
            (identical(other.created_tests, created_tests) ||
                other.created_tests == created_tests) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.today_rank, today_rank) ||
                other.today_rank == today_rank) &&
            (identical(other.yesterday_rank, yesterday_rank) ||
                other.yesterday_rank == yesterday_rank) &&
            (identical(other.rank_change, rank_change) ||
                other.rank_change == rank_change) &&
            (identical(other.rank_change_value, rank_change_value) ||
                other.rank_change_value == rank_change_value) &&
            (identical(other.tests_solved, tests_solved) ||
                other.tests_solved == tests_solved) &&
            (identical(other.avg_time, avg_time) ||
                other.avg_time == avg_time) &&
            (identical(other.followers, followers) ||
                other.followers == followers) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.is_following, is_following) ||
                other.is_following == is_following));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      profile_image,
      created_tests,
      coins,
      today_rank,
      yesterday_rank,
      rank_change,
      rank_change_value,
      tests_solved,
      avg_time,
      followers,
      following,
      is_following);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardUserResponseImplCopyWith<_$LeaderboardUserResponseImpl>
      get copyWith => __$$LeaderboardUserResponseImplCopyWithImpl<
          _$LeaderboardUserResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardUserResponseImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardUserResponse implements LeaderboardUserResponse {
  const factory _LeaderboardUserResponse(
      {final int? id,
      final String? username,
      final String? profile_image,
      final int? created_tests,
      final int? coins,
      final int? today_rank,
      final int? yesterday_rank,
      final String? rank_change,
      final int? rank_change_value,
      final int? tests_solved,
      final double? avg_time,
      final int? followers,
      final int? following,
      final bool? is_following}) = _$LeaderboardUserResponseImpl;

  factory _LeaderboardUserResponse.fromJson(Map<String, dynamic> json) =
      _$LeaderboardUserResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get username;
  @override
  String? get profile_image;
  @override
  int? get created_tests;
  @override
  int? get coins;
  @override
  int? get today_rank;
  @override
  int? get yesterday_rank;
  @override
  String? get rank_change;
  @override
  int? get rank_change_value;
  @override
  int? get tests_solved;
  @override
  double? get avg_time;
  @override
  int? get followers;
  @override
  int? get following;
  @override
  bool? get is_following;
  @override
  @JsonKey(ignore: true)
  _$$LeaderboardUserResponseImplCopyWith<_$LeaderboardUserResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
