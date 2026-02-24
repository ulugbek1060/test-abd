// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referrals_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReferralsListResponse _$ReferralsListResponseFromJson(
    Map<String, dynamic> json) {
  return _ReferralsListResponse.fromJson(json);
}

/// @nodoc
mixin _$ReferralsListResponse {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'next')
  String? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous')
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  List<Referral>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralsListResponseCopyWith<ReferralsListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralsListResponseCopyWith<$Res> {
  factory $ReferralsListResponseCopyWith(ReferralsListResponse value,
          $Res Function(ReferralsListResponse) then) =
      _$ReferralsListResponseCopyWithImpl<$Res, ReferralsListResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'previous') String? previous,
      @JsonKey(name: 'results') List<Referral>? results});
}

/// @nodoc
class _$ReferralsListResponseCopyWithImpl<$Res,
        $Val extends ReferralsListResponse>
    implements $ReferralsListResponseCopyWith<$Res> {
  _$ReferralsListResponseCopyWithImpl(this._value, this._then);

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
    Object? results = freezed,
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
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Referral>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralsListResponseImplCopyWith<$Res>
    implements $ReferralsListResponseCopyWith<$Res> {
  factory _$$ReferralsListResponseImplCopyWith(
          _$ReferralsListResponseImpl value,
          $Res Function(_$ReferralsListResponseImpl) then) =
      __$$ReferralsListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'previous') String? previous,
      @JsonKey(name: 'results') List<Referral>? results});
}

/// @nodoc
class __$$ReferralsListResponseImplCopyWithImpl<$Res>
    extends _$ReferralsListResponseCopyWithImpl<$Res,
        _$ReferralsListResponseImpl>
    implements _$$ReferralsListResponseImplCopyWith<$Res> {
  __$$ReferralsListResponseImplCopyWithImpl(_$ReferralsListResponseImpl _value,
      $Res Function(_$ReferralsListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$ReferralsListResponseImpl(
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
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Referral>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralsListResponseImpl implements _ReferralsListResponse {
  const _$ReferralsListResponseImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'next') this.next,
      @JsonKey(name: 'previous') this.previous,
      @JsonKey(name: 'results') final List<Referral>? results})
      : _results = results;

  factory _$ReferralsListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralsListResponseImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'next')
  final String? next;
  @override
  @JsonKey(name: 'previous')
  final String? previous;
  final List<Referral>? _results;
  @override
  @JsonKey(name: 'results')
  List<Referral>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReferralsListResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralsListResponseImpl &&
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
  _$$ReferralsListResponseImplCopyWith<_$ReferralsListResponseImpl>
      get copyWith => __$$ReferralsListResponseImplCopyWithImpl<
          _$ReferralsListResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralsListResponseImplToJson(
      this,
    );
  }
}

abstract class _ReferralsListResponse implements ReferralsListResponse {
  const factory _ReferralsListResponse(
          {@JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'next') final String? next,
          @JsonKey(name: 'previous') final String? previous,
          @JsonKey(name: 'results') final List<Referral>? results}) =
      _$ReferralsListResponseImpl;

  factory _ReferralsListResponse.fromJson(Map<String, dynamic> json) =
      _$ReferralsListResponseImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'next')
  String? get next;
  @override
  @JsonKey(name: 'previous')
  String? get previous;
  @override
  @JsonKey(name: 'results')
  List<Referral>? get results;
  @override
  @JsonKey(ignore: true)
  _$$ReferralsListResponseImplCopyWith<_$ReferralsListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Referral _$ReferralFromJson(Map<String, dynamic> json) {
  return _Referral.fromJson(json);
}

/// @nodoc
mixin _$Referral {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'referred')
  Referred? get referred => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralCopyWith<Referral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCopyWith<$Res> {
  factory $ReferralCopyWith(Referral value, $Res Function(Referral) then) =
      _$ReferralCopyWithImpl<$Res, Referral>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'referred') Referred? referred,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  $ReferredCopyWith<$Res>? get referred;
}

/// @nodoc
class _$ReferralCopyWithImpl<$Res, $Val extends Referral>
    implements $ReferralCopyWith<$Res> {
  _$ReferralCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? referred = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      referred: freezed == referred
          ? _value.referred
          : referred // ignore: cast_nullable_to_non_nullable
              as Referred?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferredCopyWith<$Res>? get referred {
    if (_value.referred == null) {
      return null;
    }

    return $ReferredCopyWith<$Res>(_value.referred!, (value) {
      return _then(_value.copyWith(referred: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReferralImplCopyWith<$Res>
    implements $ReferralCopyWith<$Res> {
  factory _$$ReferralImplCopyWith(
          _$ReferralImpl value, $Res Function(_$ReferralImpl) then) =
      __$$ReferralImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'referred') Referred? referred,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  @override
  $ReferredCopyWith<$Res>? get referred;
}

/// @nodoc
class __$$ReferralImplCopyWithImpl<$Res>
    extends _$ReferralCopyWithImpl<$Res, _$ReferralImpl>
    implements _$$ReferralImplCopyWith<$Res> {
  __$$ReferralImplCopyWithImpl(
      _$ReferralImpl _value, $Res Function(_$ReferralImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? referred = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ReferralImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      referred: freezed == referred
          ? _value.referred
          : referred // ignore: cast_nullable_to_non_nullable
              as Referred?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralImpl implements _Referral {
  const _$ReferralImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'referred') this.referred,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$ReferralImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'referred')
  final Referred? referred;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Referral(id: $id, referred: $referred, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.referred, referred) ||
                other.referred == referred) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, referred, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralImplCopyWith<_$ReferralImpl> get copyWith =>
      __$$ReferralImplCopyWithImpl<_$ReferralImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralImplToJson(
      this,
    );
  }
}

abstract class _Referral implements Referral {
  const factory _Referral(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'referred') final Referred? referred,
      @JsonKey(name: 'created_at') final DateTime? createdAt}) = _$ReferralImpl;

  factory _Referral.fromJson(Map<String, dynamic> json) =
      _$ReferralImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'referred')
  Referred? get referred;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ReferralImplCopyWith<_$ReferralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Referred _$ReferredFromJson(Map<String, dynamic> json) {
  return _Referred.fromJson(json);
}

/// @nodoc
mixin _$Referred {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following')
  bool? get isFollowing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferredCopyWith<Referred> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferredCopyWith<$Res> {
  factory $ReferredCopyWith(Referred value, $Res Function(Referred) then) =
      _$ReferredCopyWithImpl<$Res, Referred>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'is_following') bool? isFollowing});
}

/// @nodoc
class _$ReferredCopyWithImpl<$Res, $Val extends Referred>
    implements $ReferredCopyWith<$Res> {
  _$ReferredCopyWithImpl(this._value, this._then);

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
    Object? profileImage = freezed,
    Object? isFollowing = freezed,
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
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferredImplCopyWith<$Res>
    implements $ReferredCopyWith<$Res> {
  factory _$$ReferredImplCopyWith(
          _$ReferredImpl value, $Res Function(_$ReferredImpl) then) =
      __$$ReferredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'is_following') bool? isFollowing});
}

/// @nodoc
class __$$ReferredImplCopyWithImpl<$Res>
    extends _$ReferredCopyWithImpl<$Res, _$ReferredImpl>
    implements _$$ReferredImplCopyWith<$Res> {
  __$$ReferredImplCopyWithImpl(
      _$ReferredImpl _value, $Res Function(_$ReferredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? isFollowing = freezed,
  }) {
    return _then(_$ReferredImpl(
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
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferredImpl implements _Referred {
  const _$ReferredImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'profile_image') this.profileImage,
      @JsonKey(name: 'is_following') this.isFollowing});

  factory _$ReferredImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferredImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  @JsonKey(name: 'is_following')
  final bool? isFollowing;

  @override
  String toString() {
    return 'Referred(id: $id, username: $username, firstName: $firstName, lastName: $lastName, profileImage: $profileImage, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferredImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, firstName,
      lastName, profileImage, isFollowing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferredImplCopyWith<_$ReferredImpl> get copyWith =>
      __$$ReferredImplCopyWithImpl<_$ReferredImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferredImplToJson(
      this,
    );
  }
}

abstract class _Referred implements Referred {
  const factory _Referred(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'username') final String? username,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'profile_image') final String? profileImage,
      @JsonKey(name: 'is_following') final bool? isFollowing}) = _$ReferredImpl;

  factory _Referred.fromJson(Map<String, dynamic> json) =
      _$ReferredImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  @JsonKey(name: 'is_following')
  bool? get isFollowing;
  @override
  @JsonKey(ignore: true)
  _$$ReferredImplCopyWith<_$ReferredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
