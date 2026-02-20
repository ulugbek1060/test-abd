// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationsResponse _$NotificationsResponseFromJson(
    Map<String, dynamic> json) {
  return _NotificationsResponse.fromJson(json);
}

/// @nodoc
mixin _$NotificationsResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get verb => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  dynamic get actor => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  dynamic get contentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'object_id')
  dynamic get objectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool? get isRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsResponseCopyWith<NotificationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsResponseCopyWith<$Res> {
  factory $NotificationsResponseCopyWith(NotificationsResponse value,
          $Res Function(NotificationsResponse) then) =
      _$NotificationsResponseCopyWithImpl<$Res, NotificationsResponse>;
  @useResult
  $Res call(
      {int? id,
      String? verb,
      String? message,
      dynamic actor,
      @JsonKey(name: 'content_type') dynamic contentType,
      @JsonKey(name: 'object_id') dynamic objectId,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'is_read') bool? isRead});
}

/// @nodoc
class _$NotificationsResponseCopyWithImpl<$Res,
        $Val extends NotificationsResponse>
    implements $NotificationsResponseCopyWith<$Res> {
  _$NotificationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? verb = freezed,
    Object? message = freezed,
    Object? actor = freezed,
    Object? contentType = freezed,
    Object? objectId = freezed,
    Object? createdAt = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      verb: freezed == verb
          ? _value.verb
          : verb // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      actor: freezed == actor
          ? _value.actor
          : actor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsResponseImplCopyWith<$Res>
    implements $NotificationsResponseCopyWith<$Res> {
  factory _$$NotificationsResponseImplCopyWith(
          _$NotificationsResponseImpl value,
          $Res Function(_$NotificationsResponseImpl) then) =
      __$$NotificationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? verb,
      String? message,
      dynamic actor,
      @JsonKey(name: 'content_type') dynamic contentType,
      @JsonKey(name: 'object_id') dynamic objectId,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'is_read') bool? isRead});
}

/// @nodoc
class __$$NotificationsResponseImplCopyWithImpl<$Res>
    extends _$NotificationsResponseCopyWithImpl<$Res,
        _$NotificationsResponseImpl>
    implements _$$NotificationsResponseImplCopyWith<$Res> {
  __$$NotificationsResponseImplCopyWithImpl(_$NotificationsResponseImpl _value,
      $Res Function(_$NotificationsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? verb = freezed,
    Object? message = freezed,
    Object? actor = freezed,
    Object? contentType = freezed,
    Object? objectId = freezed,
    Object? createdAt = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_$NotificationsResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      verb: freezed == verb
          ? _value.verb
          : verb // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      actor: freezed == actor
          ? _value.actor
          : actor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationsResponseImpl implements _NotificationsResponse {
  const _$NotificationsResponseImpl(
      {this.id,
      this.verb,
      this.message,
      this.actor,
      @JsonKey(name: 'content_type') this.contentType,
      @JsonKey(name: 'object_id') this.objectId,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'is_read') this.isRead});

  factory _$NotificationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? verb;
  @override
  final String? message;
  @override
  final dynamic actor;
  @override
  @JsonKey(name: 'content_type')
  final dynamic contentType;
  @override
  @JsonKey(name: 'object_id')
  final dynamic objectId;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'is_read')
  final bool? isRead;

  @override
  String toString() {
    return 'NotificationsResponse(id: $id, verb: $verb, message: $message, actor: $actor, contentType: $contentType, objectId: $objectId, createdAt: $createdAt, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.verb, verb) || other.verb == verb) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.actor, actor) &&
            const DeepCollectionEquality()
                .equals(other.contentType, contentType) &&
            const DeepCollectionEquality().equals(other.objectId, objectId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      verb,
      message,
      const DeepCollectionEquality().hash(actor),
      const DeepCollectionEquality().hash(contentType),
      const DeepCollectionEquality().hash(objectId),
      createdAt,
      isRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsResponseImplCopyWith<_$NotificationsResponseImpl>
      get copyWith => __$$NotificationsResponseImplCopyWithImpl<
          _$NotificationsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsResponseImplToJson(
      this,
    );
  }
}

abstract class _NotificationsResponse implements NotificationsResponse {
  const factory _NotificationsResponse(
          {final int? id,
          final String? verb,
          final String? message,
          final dynamic actor,
          @JsonKey(name: 'content_type') final dynamic contentType,
          @JsonKey(name: 'object_id') final dynamic objectId,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'is_read') final bool? isRead}) =
      _$NotificationsResponseImpl;

  factory _NotificationsResponse.fromJson(Map<String, dynamic> json) =
      _$NotificationsResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get verb;
  @override
  String? get message;
  @override
  dynamic get actor;
  @override
  @JsonKey(name: 'content_type')
  dynamic get contentType;
  @override
  @JsonKey(name: 'object_id')
  dynamic get objectId;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'is_read')
  bool? get isRead;
  @override
  @JsonKey(ignore: true)
  _$$NotificationsResponseImplCopyWith<_$NotificationsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
