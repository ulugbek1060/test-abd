// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_block_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserBlockDetailState {
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  BlockDetailModel? get block => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserBlockDetailStateCopyWith<UserBlockDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockDetailStateCopyWith<$Res> {
  factory $UserBlockDetailStateCopyWith(UserBlockDetailState value,
          $Res Function(UserBlockDetailState) then) =
      _$UserBlockDetailStateCopyWithImpl<$Res, UserBlockDetailState>;
  @useResult
  $Res call({String? error, bool isLoading, BlockDetailModel? block});
}

/// @nodoc
class _$UserBlockDetailStateCopyWithImpl<$Res,
        $Val extends UserBlockDetailState>
    implements $UserBlockDetailStateCopyWith<$Res> {
  _$UserBlockDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
    Object? block = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      block: freezed == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as BlockDetailModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBlockDetailStateImplCopyWith<$Res>
    implements $UserBlockDetailStateCopyWith<$Res> {
  factory _$$UserBlockDetailStateImplCopyWith(_$UserBlockDetailStateImpl value,
          $Res Function(_$UserBlockDetailStateImpl) then) =
      __$$UserBlockDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error, bool isLoading, BlockDetailModel? block});
}

/// @nodoc
class __$$UserBlockDetailStateImplCopyWithImpl<$Res>
    extends _$UserBlockDetailStateCopyWithImpl<$Res, _$UserBlockDetailStateImpl>
    implements _$$UserBlockDetailStateImplCopyWith<$Res> {
  __$$UserBlockDetailStateImplCopyWithImpl(_$UserBlockDetailStateImpl _value,
      $Res Function(_$UserBlockDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
    Object? block = freezed,
  }) {
    return _then(_$UserBlockDetailStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      block: freezed == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as BlockDetailModel?,
    ));
  }
}

/// @nodoc

class _$UserBlockDetailStateImpl implements _UserBlockDetailState {
  const _$UserBlockDetailStateImpl(
      {this.error, this.isLoading = false, this.block});

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final BlockDetailModel? block;

  @override
  String toString() {
    return 'UserBlockDetailState(error: $error, isLoading: $isLoading, block: $block)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBlockDetailStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.block, block) || other.block == block));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, isLoading, block);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBlockDetailStateImplCopyWith<_$UserBlockDetailStateImpl>
      get copyWith =>
          __$$UserBlockDetailStateImplCopyWithImpl<_$UserBlockDetailStateImpl>(
              this, _$identity);
}

abstract class _UserBlockDetailState implements UserBlockDetailState {
  const factory _UserBlockDetailState(
      {final String? error,
      final bool isLoading,
      final BlockDetailModel? block}) = _$UserBlockDetailStateImpl;

  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  BlockDetailModel? get block;
  @override
  @JsonKey(ignore: true)
  _$$UserBlockDetailStateImplCopyWith<_$UserBlockDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
