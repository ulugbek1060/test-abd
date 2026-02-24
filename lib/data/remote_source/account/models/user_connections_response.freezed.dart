// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_connections_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserConnectionsResponse _$UserConnectionsResponseFromJson(
    Map<String, dynamic> json) {
  return _UserConnectionsResponse.fromJson(json);
}

/// @nodoc
mixin _$UserConnectionsResponse {
  List<UserConnectionItemResponse> get followers =>
      throw _privateConstructorUsedError;
  List<UserConnectionItemResponse> get following =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserConnectionsResponseCopyWith<UserConnectionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserConnectionsResponseCopyWith<$Res> {
  factory $UserConnectionsResponseCopyWith(UserConnectionsResponse value,
          $Res Function(UserConnectionsResponse) then) =
      _$UserConnectionsResponseCopyWithImpl<$Res, UserConnectionsResponse>;
  @useResult
  $Res call(
      {List<UserConnectionItemResponse> followers,
      List<UserConnectionItemResponse> following});
}

/// @nodoc
class _$UserConnectionsResponseCopyWithImpl<$Res,
        $Val extends UserConnectionsResponse>
    implements $UserConnectionsResponseCopyWith<$Res> {
  _$UserConnectionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followers = null,
    Object? following = null,
  }) {
    return _then(_value.copyWith(
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<UserConnectionItemResponse>,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<UserConnectionItemResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserConnectionsResponseImplCopyWith<$Res>
    implements $UserConnectionsResponseCopyWith<$Res> {
  factory _$$UserConnectionsResponseImplCopyWith(
          _$UserConnectionsResponseImpl value,
          $Res Function(_$UserConnectionsResponseImpl) then) =
      __$$UserConnectionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserConnectionItemResponse> followers,
      List<UserConnectionItemResponse> following});
}

/// @nodoc
class __$$UserConnectionsResponseImplCopyWithImpl<$Res>
    extends _$UserConnectionsResponseCopyWithImpl<$Res,
        _$UserConnectionsResponseImpl>
    implements _$$UserConnectionsResponseImplCopyWith<$Res> {
  __$$UserConnectionsResponseImplCopyWithImpl(
      _$UserConnectionsResponseImpl _value,
      $Res Function(_$UserConnectionsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followers = null,
    Object? following = null,
  }) {
    return _then(_$UserConnectionsResponseImpl(
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<UserConnectionItemResponse>,
      following: null == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<UserConnectionItemResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserConnectionsResponseImpl implements _UserConnectionsResponse {
  const _$UserConnectionsResponseImpl(
      {final List<UserConnectionItemResponse> followers = const [],
      final List<UserConnectionItemResponse> following = const []})
      : _followers = followers,
        _following = following;

  factory _$UserConnectionsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserConnectionsResponseImplFromJson(json);

  final List<UserConnectionItemResponse> _followers;
  @override
  @JsonKey()
  List<UserConnectionItemResponse> get followers {
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

  final List<UserConnectionItemResponse> _following;
  @override
  @JsonKey()
  List<UserConnectionItemResponse> get following {
    if (_following is EqualUnmodifiableListView) return _following;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_following);
  }

  @override
  String toString() {
    return 'UserConnectionsResponse(followers: $followers, following: $following)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserConnectionsResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            const DeepCollectionEquality()
                .equals(other._following, _following));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_followers),
      const DeepCollectionEquality().hash(_following));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserConnectionsResponseImplCopyWith<_$UserConnectionsResponseImpl>
      get copyWith => __$$UserConnectionsResponseImplCopyWithImpl<
          _$UserConnectionsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserConnectionsResponseImplToJson(
      this,
    );
  }
}

abstract class _UserConnectionsResponse implements UserConnectionsResponse {
  const factory _UserConnectionsResponse(
          {final List<UserConnectionItemResponse> followers,
          final List<UserConnectionItemResponse> following}) =
      _$UserConnectionsResponseImpl;

  factory _UserConnectionsResponse.fromJson(Map<String, dynamic> json) =
      _$UserConnectionsResponseImpl.fromJson;

  @override
  List<UserConnectionItemResponse> get followers;
  @override
  List<UserConnectionItemResponse> get following;
  @override
  @JsonKey(ignore: true)
  _$$UserConnectionsResponseImplCopyWith<_$UserConnectionsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserConnectionItemResponse _$UserConnectionItemResponseFromJson(
    Map<String, dynamic> json) {
  return _UserConnectionItemResponse.fromJson(json);
}

/// @nodoc
mixin _$UserConnectionItemResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get first_name => throw _privateConstructorUsedError;
  String? get last_name => throw _privateConstructorUsedError;
  String? get profile_image => throw _privateConstructorUsedError;
  bool? get is_following => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserConnectionItemResponseCopyWith<UserConnectionItemResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserConnectionItemResponseCopyWith<$Res> {
  factory $UserConnectionItemResponseCopyWith(UserConnectionItemResponse value,
          $Res Function(UserConnectionItemResponse) then) =
      _$UserConnectionItemResponseCopyWithImpl<$Res,
          UserConnectionItemResponse>;
  @useResult
  $Res call(
      {int? id,
      String? username,
      String? first_name,
      String? last_name,
      String? profile_image,
      bool? is_following});
}

/// @nodoc
class _$UserConnectionItemResponseCopyWithImpl<$Res,
        $Val extends UserConnectionItemResponse>
    implements $UserConnectionItemResponseCopyWith<$Res> {
  _$UserConnectionItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? profile_image = freezed,
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
      first_name: freezed == first_name
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String?,
      last_name: freezed == last_name
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String?,
      profile_image: freezed == profile_image
          ? _value.profile_image
          : profile_image // ignore: cast_nullable_to_non_nullable
              as String?,
      is_following: freezed == is_following
          ? _value.is_following
          : is_following // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserConnectionItemResponseImplCopyWith<$Res>
    implements $UserConnectionItemResponseCopyWith<$Res> {
  factory _$$UserConnectionItemResponseImplCopyWith(
          _$UserConnectionItemResponseImpl value,
          $Res Function(_$UserConnectionItemResponseImpl) then) =
      __$$UserConnectionItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? username,
      String? first_name,
      String? last_name,
      String? profile_image,
      bool? is_following});
}

/// @nodoc
class __$$UserConnectionItemResponseImplCopyWithImpl<$Res>
    extends _$UserConnectionItemResponseCopyWithImpl<$Res,
        _$UserConnectionItemResponseImpl>
    implements _$$UserConnectionItemResponseImplCopyWith<$Res> {
  __$$UserConnectionItemResponseImplCopyWithImpl(
      _$UserConnectionItemResponseImpl _value,
      $Res Function(_$UserConnectionItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? profile_image = freezed,
    Object? is_following = freezed,
  }) {
    return _then(_$UserConnectionItemResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      first_name: freezed == first_name
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String?,
      last_name: freezed == last_name
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String?,
      profile_image: freezed == profile_image
          ? _value.profile_image
          : profile_image // ignore: cast_nullable_to_non_nullable
              as String?,
      is_following: freezed == is_following
          ? _value.is_following
          : is_following // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserConnectionItemResponseImpl implements _UserConnectionItemResponse {
  const _$UserConnectionItemResponseImpl(
      {this.id,
      this.username,
      this.first_name,
      this.last_name,
      this.profile_image,
      this.is_following});

  factory _$UserConnectionItemResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserConnectionItemResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? username;
  @override
  final String? first_name;
  @override
  final String? last_name;
  @override
  final String? profile_image;
  @override
  final bool? is_following;

  @override
  String toString() {
    return 'UserConnectionItemResponse(id: $id, username: $username, first_name: $first_name, last_name: $last_name, profile_image: $profile_image, is_following: $is_following)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserConnectionItemResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.first_name, first_name) ||
                other.first_name == first_name) &&
            (identical(other.last_name, last_name) ||
                other.last_name == last_name) &&
            (identical(other.profile_image, profile_image) ||
                other.profile_image == profile_image) &&
            (identical(other.is_following, is_following) ||
                other.is_following == is_following));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, first_name,
      last_name, profile_image, is_following);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserConnectionItemResponseImplCopyWith<_$UserConnectionItemResponseImpl>
      get copyWith => __$$UserConnectionItemResponseImplCopyWithImpl<
          _$UserConnectionItemResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserConnectionItemResponseImplToJson(
      this,
    );
  }
}

abstract class _UserConnectionItemResponse
    implements UserConnectionItemResponse {
  const factory _UserConnectionItemResponse(
      {final int? id,
      final String? username,
      final String? first_name,
      final String? last_name,
      final String? profile_image,
      final bool? is_following}) = _$UserConnectionItemResponseImpl;

  factory _UserConnectionItemResponse.fromJson(Map<String, dynamic> json) =
      _$UserConnectionItemResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get username;
  @override
  String? get first_name;
  @override
  String? get last_name;
  @override
  String? get profile_image;
  @override
  bool? get is_following;
  @override
  @JsonKey(ignore: true)
  _$$UserConnectionItemResponseImplCopyWith<_$UserConnectionItemResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
