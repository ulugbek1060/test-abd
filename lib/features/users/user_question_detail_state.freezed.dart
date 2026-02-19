// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_question_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserQuestionDetailState {
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  QuestionModel? get question => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserQuestionDetailStateCopyWith<UserQuestionDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserQuestionDetailStateCopyWith<$Res> {
  factory $UserQuestionDetailStateCopyWith(UserQuestionDetailState value,
          $Res Function(UserQuestionDetailState) then) =
      _$UserQuestionDetailStateCopyWithImpl<$Res, UserQuestionDetailState>;
  @useResult
  $Res call({String? error, bool isLoading, QuestionModel? question});
}

/// @nodoc
class _$UserQuestionDetailStateCopyWithImpl<$Res,
        $Val extends UserQuestionDetailState>
    implements $UserQuestionDetailStateCopyWith<$Res> {
  _$UserQuestionDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
    Object? question = freezed,
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
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserQuestionDetailStateImplCopyWith<$Res>
    implements $UserQuestionDetailStateCopyWith<$Res> {
  factory _$$UserQuestionDetailStateImplCopyWith(
          _$UserQuestionDetailStateImpl value,
          $Res Function(_$UserQuestionDetailStateImpl) then) =
      __$$UserQuestionDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error, bool isLoading, QuestionModel? question});
}

/// @nodoc
class __$$UserQuestionDetailStateImplCopyWithImpl<$Res>
    extends _$UserQuestionDetailStateCopyWithImpl<$Res,
        _$UserQuestionDetailStateImpl>
    implements _$$UserQuestionDetailStateImplCopyWith<$Res> {
  __$$UserQuestionDetailStateImplCopyWithImpl(
      _$UserQuestionDetailStateImpl _value,
      $Res Function(_$UserQuestionDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
    Object? question = freezed,
  }) {
    return _then(_$UserQuestionDetailStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionModel?,
    ));
  }
}

/// @nodoc

class _$UserQuestionDetailStateImpl implements _UserQuestionDetailState {
  const _$UserQuestionDetailStateImpl(
      {this.error, this.isLoading = false, this.question});

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final QuestionModel? question;

  @override
  String toString() {
    return 'UserQuestionDetailState(error: $error, isLoading: $isLoading, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserQuestionDetailStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, isLoading, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserQuestionDetailStateImplCopyWith<_$UserQuestionDetailStateImpl>
      get copyWith => __$$UserQuestionDetailStateImplCopyWithImpl<
          _$UserQuestionDetailStateImpl>(this, _$identity);
}

abstract class _UserQuestionDetailState implements UserQuestionDetailState {
  const factory _UserQuestionDetailState(
      {final String? error,
      final bool isLoading,
      final QuestionModel? question}) = _$UserQuestionDetailStateImpl;

  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  QuestionModel? get question;
  @override
  @JsonKey(ignore: true)
  _$$UserQuestionDetailStateImplCopyWith<_$UserQuestionDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
