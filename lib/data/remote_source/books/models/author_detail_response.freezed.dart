// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthorDetailResponse _$AuthorDetailResponseFromJson(Map<String, dynamic> json) {
  return _AuthorDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthorDetailResponse {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bio')
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorDetailResponseCopyWith<AuthorDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorDetailResponseCopyWith<$Res> {
  factory $AuthorDetailResponseCopyWith(AuthorDetailResponse value,
          $Res Function(AuthorDetailResponse) then) =
      _$AuthorDetailResponseCopyWithImpl<$Res, AuthorDetailResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'bio') String? bio,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class _$AuthorDetailResponseCopyWithImpl<$Res,
        $Val extends AuthorDetailResponse>
    implements $AuthorDetailResponseCopyWith<$Res> {
  _$AuthorDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? bio = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorDetailResponseImplCopyWith<$Res>
    implements $AuthorDetailResponseCopyWith<$Res> {
  factory _$$AuthorDetailResponseImplCopyWith(_$AuthorDetailResponseImpl value,
          $Res Function(_$AuthorDetailResponseImpl) then) =
      __$$AuthorDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'bio') String? bio,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class __$$AuthorDetailResponseImplCopyWithImpl<$Res>
    extends _$AuthorDetailResponseCopyWithImpl<$Res, _$AuthorDetailResponseImpl>
    implements _$$AuthorDetailResponseImplCopyWith<$Res> {
  __$$AuthorDetailResponseImplCopyWithImpl(_$AuthorDetailResponseImpl _value,
      $Res Function(_$AuthorDetailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? bio = freezed,
    Object? image = freezed,
  }) {
    return _then(_$AuthorDetailResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorDetailResponseImpl implements _AuthorDetailResponse {
  const _$AuthorDetailResponseImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'bio') this.bio,
      @JsonKey(name: 'image') this.image});

  factory _$AuthorDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorDetailResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'bio')
  final String? bio;
  @override
  @JsonKey(name: 'image')
  final String? image;

  @override
  String toString() {
    return 'AuthorDetailResponse(id: $id, fullName: $fullName, bio: $bio, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorDetailResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, bio, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorDetailResponseImplCopyWith<_$AuthorDetailResponseImpl>
      get copyWith =>
          __$$AuthorDetailResponseImplCopyWithImpl<_$AuthorDetailResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _AuthorDetailResponse implements AuthorDetailResponse {
  const factory _AuthorDetailResponse(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'full_name') final String? fullName,
          @JsonKey(name: 'bio') final String? bio,
          @JsonKey(name: 'image') final String? image}) =
      _$AuthorDetailResponseImpl;

  factory _AuthorDetailResponse.fromJson(Map<String, dynamic> json) =
      _$AuthorDetailResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'bio')
  String? get bio;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$AuthorDetailResponseImplCopyWith<_$AuthorDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
