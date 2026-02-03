// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_pswd_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangePswdResponse _$ChangePswdResponseFromJson(Map<String, dynamic> json) {
  return _ChangePswdResponse.fromJson(json);
}

/// @nodoc
mixin _$ChangePswdResponse {
  @JsonKey(name: 'detail')
  String? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePswdResponseCopyWith<ChangePswdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePswdResponseCopyWith<$Res> {
  factory $ChangePswdResponseCopyWith(
          ChangePswdResponse value, $Res Function(ChangePswdResponse) then) =
      _$ChangePswdResponseCopyWithImpl<$Res, ChangePswdResponse>;
  @useResult
  $Res call({@JsonKey(name: 'detail') String? detail});
}

/// @nodoc
class _$ChangePswdResponseCopyWithImpl<$Res, $Val extends ChangePswdResponse>
    implements $ChangePswdResponseCopyWith<$Res> {
  _$ChangePswdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePswdResponseImplCopyWith<$Res>
    implements $ChangePswdResponseCopyWith<$Res> {
  factory _$$ChangePswdResponseImplCopyWith(_$ChangePswdResponseImpl value,
          $Res Function(_$ChangePswdResponseImpl) then) =
      __$$ChangePswdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'detail') String? detail});
}

/// @nodoc
class __$$ChangePswdResponseImplCopyWithImpl<$Res>
    extends _$ChangePswdResponseCopyWithImpl<$Res, _$ChangePswdResponseImpl>
    implements _$$ChangePswdResponseImplCopyWith<$Res> {
  __$$ChangePswdResponseImplCopyWithImpl(_$ChangePswdResponseImpl _value,
      $Res Function(_$ChangePswdResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = freezed,
  }) {
    return _then(_$ChangePswdResponseImpl(
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePswdResponseImpl implements _ChangePswdResponse {
  const _$ChangePswdResponseImpl({@JsonKey(name: 'detail') this.detail});

  factory _$ChangePswdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePswdResponseImplFromJson(json);

  @override
  @JsonKey(name: 'detail')
  final String? detail;

  @override
  String toString() {
    return 'ChangePswdResponse(detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePswdResponseImpl &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, detail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePswdResponseImplCopyWith<_$ChangePswdResponseImpl> get copyWith =>
      __$$ChangePswdResponseImplCopyWithImpl<_$ChangePswdResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePswdResponseImplToJson(
      this,
    );
  }
}

abstract class _ChangePswdResponse implements ChangePswdResponse {
  const factory _ChangePswdResponse(
          {@JsonKey(name: 'detail') final String? detail}) =
      _$ChangePswdResponseImpl;

  factory _ChangePswdResponse.fromJson(Map<String, dynamic> json) =
      _$ChangePswdResponseImpl.fromJson;

  @override
  @JsonKey(name: 'detail')
  String? get detail;
  @override
  @JsonKey(ignore: true)
  _$$ChangePswdResponseImplCopyWith<_$ChangePswdResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
