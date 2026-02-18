// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_block_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyBlockDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  BlockDetailModel? get blockDetail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyBlockDetailStateCopyWith<MyBlockDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBlockDetailStateCopyWith<$Res> {
  factory $MyBlockDetailStateCopyWith(
          MyBlockDetailState value, $Res Function(MyBlockDetailState) then) =
      _$MyBlockDetailStateCopyWithImpl<$Res, MyBlockDetailState>;
  @useResult
  $Res call({bool isLoading, String? error, BlockDetailModel? blockDetail});
}

/// @nodoc
class _$MyBlockDetailStateCopyWithImpl<$Res, $Val extends MyBlockDetailState>
    implements $MyBlockDetailStateCopyWith<$Res> {
  _$MyBlockDetailStateCopyWithImpl(this._value, this._then);

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
abstract class _$$MyBlockDetailStateImplCopyWith<$Res>
    implements $MyBlockDetailStateCopyWith<$Res> {
  factory _$$MyBlockDetailStateImplCopyWith(_$MyBlockDetailStateImpl value,
          $Res Function(_$MyBlockDetailStateImpl) then) =
      __$$MyBlockDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, BlockDetailModel? blockDetail});
}

/// @nodoc
class __$$MyBlockDetailStateImplCopyWithImpl<$Res>
    extends _$MyBlockDetailStateCopyWithImpl<$Res, _$MyBlockDetailStateImpl>
    implements _$$MyBlockDetailStateImplCopyWith<$Res> {
  __$$MyBlockDetailStateImplCopyWithImpl(_$MyBlockDetailStateImpl _value,
      $Res Function(_$MyBlockDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? blockDetail = freezed,
  }) {
    return _then(_$MyBlockDetailStateImpl(
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

class _$MyBlockDetailStateImpl implements _MyBlockDetailState {
  const _$MyBlockDetailStateImpl(
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
    return 'MyBlockDetailState(isLoading: $isLoading, error: $error, blockDetail: $blockDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyBlockDetailStateImpl &&
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
  _$$MyBlockDetailStateImplCopyWith<_$MyBlockDetailStateImpl> get copyWith =>
      __$$MyBlockDetailStateImplCopyWithImpl<_$MyBlockDetailStateImpl>(
          this, _$identity);
}

abstract class _MyBlockDetailState implements MyBlockDetailState {
  const factory _MyBlockDetailState(
      {final bool isLoading,
      final String? error,
      final BlockDetailModel? blockDetail}) = _$MyBlockDetailStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  BlockDetailModel? get blockDetail;
  @override
  @JsonKey(ignore: true)
  _$$MyBlockDetailStateImplCopyWith<_$MyBlockDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
