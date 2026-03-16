// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_mark_question_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookMarkQuestionDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  QuestionModel? get question => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookMarkQuestionDetailStateCopyWith<BookMarkQuestionDetailState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookMarkQuestionDetailStateCopyWith<$Res> {
  factory $BookMarkQuestionDetailStateCopyWith(
          BookMarkQuestionDetailState value,
          $Res Function(BookMarkQuestionDetailState) then) =
      _$BookMarkQuestionDetailStateCopyWithImpl<$Res,
          BookMarkQuestionDetailState>;
  @useResult
  $Res call({bool isLoading, String? error, QuestionModel? question});
}

/// @nodoc
class _$BookMarkQuestionDetailStateCopyWithImpl<$Res,
        $Val extends BookMarkQuestionDetailState>
    implements $BookMarkQuestionDetailStateCopyWith<$Res> {
  _$BookMarkQuestionDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? question = freezed,
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
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookMarkQuestionDetailStateImplCopyWith<$Res>
    implements $BookMarkQuestionDetailStateCopyWith<$Res> {
  factory _$$BookMarkQuestionDetailStateImplCopyWith(
          _$BookMarkQuestionDetailStateImpl value,
          $Res Function(_$BookMarkQuestionDetailStateImpl) then) =
      __$$BookMarkQuestionDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, QuestionModel? question});
}

/// @nodoc
class __$$BookMarkQuestionDetailStateImplCopyWithImpl<$Res>
    extends _$BookMarkQuestionDetailStateCopyWithImpl<$Res,
        _$BookMarkQuestionDetailStateImpl>
    implements _$$BookMarkQuestionDetailStateImplCopyWith<$Res> {
  __$$BookMarkQuestionDetailStateImplCopyWithImpl(
      _$BookMarkQuestionDetailStateImpl _value,
      $Res Function(_$BookMarkQuestionDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? question = freezed,
  }) {
    return _then(_$BookMarkQuestionDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionModel?,
    ));
  }
}

/// @nodoc

class _$BookMarkQuestionDetailStateImpl
    implements _BookMarkQuestionDetailState {
  const _$BookMarkQuestionDetailStateImpl(
      {this.isLoading = false, this.error, this.question});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final QuestionModel? question;

  @override
  String toString() {
    return 'BookMarkQuestionDetailState(isLoading: $isLoading, error: $error, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookMarkQuestionDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookMarkQuestionDetailStateImplCopyWith<_$BookMarkQuestionDetailStateImpl>
      get copyWith => __$$BookMarkQuestionDetailStateImplCopyWithImpl<
          _$BookMarkQuestionDetailStateImpl>(this, _$identity);
}

abstract class _BookMarkQuestionDetailState
    implements BookMarkQuestionDetailState {
  const factory _BookMarkQuestionDetailState(
      {final bool isLoading,
      final String? error,
      final QuestionModel? question}) = _$BookMarkQuestionDetailStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  QuestionModel? get question;
  @override
  @JsonKey(ignore: true)
  _$$BookMarkQuestionDetailStateImplCopyWith<_$BookMarkQuestionDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
