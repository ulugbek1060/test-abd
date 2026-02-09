// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlockDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  BlockDetailModel? get blockDetail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockDetailStateCopyWith<BlockDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockDetailStateCopyWith<$Res> {
  factory $BlockDetailStateCopyWith(
          BlockDetailState value, $Res Function(BlockDetailState) then) =
      _$BlockDetailStateCopyWithImpl<$Res, BlockDetailState>;
  @useResult
  $Res call({bool isLoading, String? error, BlockDetailModel? blockDetail});
}

/// @nodoc
class _$BlockDetailStateCopyWithImpl<$Res, $Val extends BlockDetailState>
    implements $BlockDetailStateCopyWith<$Res> {
  _$BlockDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? blockDetail = freezed,
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
      blockDetail: freezed == blockDetail
          ? _value.blockDetail
          : blockDetail // ignore: cast_nullable_to_non_nullable
              as BlockDetailModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockDetailStateImplCopyWith<$Res>
    implements $BlockDetailStateCopyWith<$Res> {
  factory _$$BlockDetailStateImplCopyWith(_$BlockDetailStateImpl value,
          $Res Function(_$BlockDetailStateImpl) then) =
      __$$BlockDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, BlockDetailModel? blockDetail});
}

/// @nodoc
class __$$BlockDetailStateImplCopyWithImpl<$Res>
    extends _$BlockDetailStateCopyWithImpl<$Res, _$BlockDetailStateImpl>
    implements _$$BlockDetailStateImplCopyWith<$Res> {
  __$$BlockDetailStateImplCopyWithImpl(_$BlockDetailStateImpl _value,
      $Res Function(_$BlockDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? blockDetail = freezed,
  }) {
    return _then(_$BlockDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      blockDetail: freezed == blockDetail
          ? _value.blockDetail
          : blockDetail // ignore: cast_nullable_to_non_nullable
              as BlockDetailModel?,
    ));
  }
}

/// @nodoc

class _$BlockDetailStateImpl implements _BlockDetailState {
  const _$BlockDetailStateImpl(
      {this.isLoading = false, this.error, this.blockDetail});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final BlockDetailModel? blockDetail;

  @override
  String toString() {
    return 'BlockDetailState(isLoading: $isLoading, error: $error, blockDetail: $blockDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.blockDetail, blockDetail) ||
                other.blockDetail == blockDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, blockDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockDetailStateImplCopyWith<_$BlockDetailStateImpl> get copyWith =>
      __$$BlockDetailStateImplCopyWithImpl<_$BlockDetailStateImpl>(
          this, _$identity);
}

abstract class _BlockDetailState implements BlockDetailState {
  const factory _BlockDetailState(
      {final bool isLoading,
      final String? error,
      final BlockDetailModel? blockDetail}) = _$BlockDetailStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  BlockDetailModel? get blockDetail;
  @override
  @JsonKey(ignore: true)
  _$$BlockDetailStateImplCopyWith<_$BlockDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
