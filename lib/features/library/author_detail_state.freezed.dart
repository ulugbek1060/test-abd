// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthorDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthorDetailStateCopyWith<AuthorDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorDetailStateCopyWith<$Res> {
  factory $AuthorDetailStateCopyWith(
          AuthorDetailState value, $Res Function(AuthorDetailState) then) =
      _$AuthorDetailStateCopyWithImpl<$Res, AuthorDetailState>;
  @useResult
  $Res call({bool isLoading, String? error, dynamic data});
}

/// @nodoc
class _$AuthorDetailStateCopyWithImpl<$Res, $Val extends AuthorDetailState>
    implements $AuthorDetailStateCopyWith<$Res> {
  _$AuthorDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorDetailStateImplCopyWith<$Res>
    implements $AuthorDetailStateCopyWith<$Res> {
  factory _$$AuthorDetailStateImplCopyWith(_$AuthorDetailStateImpl value,
          $Res Function(_$AuthorDetailStateImpl) then) =
      __$$AuthorDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, dynamic data});
}

/// @nodoc
class __$$AuthorDetailStateImplCopyWithImpl<$Res>
    extends _$AuthorDetailStateCopyWithImpl<$Res, _$AuthorDetailStateImpl>
    implements _$$AuthorDetailStateImplCopyWith<$Res> {
  __$$AuthorDetailStateImplCopyWithImpl(_$AuthorDetailStateImpl _value,
      $Res Function(_$AuthorDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_$AuthorDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AuthorDetailStateImpl implements _AuthorDetailState {
  const _$AuthorDetailStateImpl(
      {this.isLoading = false, this.error, this.data});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'AuthorDetailState(isLoading: $isLoading, error: $error, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, error, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorDetailStateImplCopyWith<_$AuthorDetailStateImpl> get copyWith =>
      __$$AuthorDetailStateImplCopyWithImpl<_$AuthorDetailStateImpl>(
          this, _$identity);
}

abstract class _AuthorDetailState implements AuthorDetailState {
  const factory _AuthorDetailState(
      {final bool isLoading,
      final String? error,
      final dynamic data}) = _$AuthorDetailStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$AuthorDetailStateImplCopyWith<_$AuthorDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
