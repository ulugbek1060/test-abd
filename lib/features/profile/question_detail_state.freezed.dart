// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuestionDetailState {
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionDetailStateCopyWith<QuestionDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionDetailStateCopyWith<$Res> {
  factory $QuestionDetailStateCopyWith(
          QuestionDetailState value, $Res Function(QuestionDetailState) then) =
      _$QuestionDetailStateCopyWithImpl<$Res, QuestionDetailState>;
  @useResult
  $Res call({String? error, bool isLoading});
}

/// @nodoc
class _$QuestionDetailStateCopyWithImpl<$Res, $Val extends QuestionDetailState>
    implements $QuestionDetailStateCopyWith<$Res> {
  _$QuestionDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionDetailStateImplCopyWith<$Res>
    implements $QuestionDetailStateCopyWith<$Res> {
  factory _$$QuestionDetailStateImplCopyWith(_$QuestionDetailStateImpl value,
          $Res Function(_$QuestionDetailStateImpl) then) =
      __$$QuestionDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error, bool isLoading});
}

/// @nodoc
class __$$QuestionDetailStateImplCopyWithImpl<$Res>
    extends _$QuestionDetailStateCopyWithImpl<$Res, _$QuestionDetailStateImpl>
    implements _$$QuestionDetailStateImplCopyWith<$Res> {
  __$$QuestionDetailStateImplCopyWithImpl(_$QuestionDetailStateImpl _value,
      $Res Function(_$QuestionDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$QuestionDetailStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QuestionDetailStateImpl implements _QuestionDetailState {
  const _$QuestionDetailStateImpl({this.error, this.isLoading = false});

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'QuestionDetailState(error: $error, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionDetailStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionDetailStateImplCopyWith<_$QuestionDetailStateImpl> get copyWith =>
      __$$QuestionDetailStateImplCopyWithImpl<_$QuestionDetailStateImpl>(
          this, _$identity);
}

abstract class _QuestionDetailState implements QuestionDetailState {
  const factory _QuestionDetailState(
      {final String? error, final bool isLoading}) = _$QuestionDetailStateImpl;

  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$QuestionDetailStateImplCopyWith<_$QuestionDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
