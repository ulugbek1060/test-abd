// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_pswd_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChangePswdState {
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangePswdStateCopyWith<ChangePswdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePswdStateCopyWith<$Res> {
  factory $ChangePswdStateCopyWith(
          ChangePswdState value, $Res Function(ChangePswdState) then) =
      _$ChangePswdStateCopyWithImpl<$Res, ChangePswdState>;
  @useResult
  $Res call({String? error, bool isLoading, bool isSuccess});
}

/// @nodoc
class _$ChangePswdStateCopyWithImpl<$Res, $Val extends ChangePswdState>
    implements $ChangePswdStateCopyWith<$Res> {
  _$ChangePswdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
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
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePswdStateImplCopyWith<$Res>
    implements $ChangePswdStateCopyWith<$Res> {
  factory _$$ChangePswdStateImplCopyWith(_$ChangePswdStateImpl value,
          $Res Function(_$ChangePswdStateImpl) then) =
      __$$ChangePswdStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error, bool isLoading, bool isSuccess});
}

/// @nodoc
class __$$ChangePswdStateImplCopyWithImpl<$Res>
    extends _$ChangePswdStateCopyWithImpl<$Res, _$ChangePswdStateImpl>
    implements _$$ChangePswdStateImplCopyWith<$Res> {
  __$$ChangePswdStateImplCopyWithImpl(
      _$ChangePswdStateImpl _value, $Res Function(_$ChangePswdStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
  }) {
    return _then(_$ChangePswdStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangePswdStateImpl implements _ChangePswdState {
  const _$ChangePswdStateImpl(
      {this.error, this.isLoading = false, this.isSuccess = true});

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;

  @override
  String toString() {
    return 'ChangePswdState(error: $error, isLoading: $isLoading, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePswdStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, isLoading, isSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePswdStateImplCopyWith<_$ChangePswdStateImpl> get copyWith =>
      __$$ChangePswdStateImplCopyWithImpl<_$ChangePswdStateImpl>(
          this, _$identity);
}

abstract class _ChangePswdState implements ChangePswdState {
  const factory _ChangePswdState(
      {final String? error,
      final bool isLoading,
      final bool isSuccess}) = _$ChangePswdStateImpl;

  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  @JsonKey(ignore: true)
  _$$ChangePswdStateImplCopyWith<_$ChangePswdStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
