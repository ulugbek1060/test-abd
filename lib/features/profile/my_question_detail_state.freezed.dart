// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_question_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyQuestionDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  QuestionModel? get question => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyQuestionDetailStateCopyWith<MyQuestionDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyQuestionDetailStateCopyWith<$Res> {
  factory $MyQuestionDetailStateCopyWith(MyQuestionDetailState value,
          $Res Function(MyQuestionDetailState) then) =
      _$MyQuestionDetailStateCopyWithImpl<$Res, MyQuestionDetailState>;
  @useResult
  $Res call({bool isLoading, String? error, QuestionModel? question});
}

/// @nodoc
class _$MyQuestionDetailStateCopyWithImpl<$Res,
        $Val extends MyQuestionDetailState>
    implements $MyQuestionDetailStateCopyWith<$Res> {
  _$MyQuestionDetailStateCopyWithImpl(this._value, this._then);

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
abstract class _$$MyQuestionDetailStateImplCopyWith<$Res>
    implements $MyQuestionDetailStateCopyWith<$Res> {
  factory _$$MyQuestionDetailStateImplCopyWith(
          _$MyQuestionDetailStateImpl value,
          $Res Function(_$MyQuestionDetailStateImpl) then) =
      __$$MyQuestionDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, QuestionModel? question});
}

/// @nodoc
class __$$MyQuestionDetailStateImplCopyWithImpl<$Res>
    extends _$MyQuestionDetailStateCopyWithImpl<$Res,
        _$MyQuestionDetailStateImpl>
    implements _$$MyQuestionDetailStateImplCopyWith<$Res> {
  __$$MyQuestionDetailStateImplCopyWithImpl(_$MyQuestionDetailStateImpl _value,
      $Res Function(_$MyQuestionDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? question = freezed,
  }) {
    return _then(_$MyQuestionDetailStateImpl(
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

class _$MyQuestionDetailStateImpl implements _MyQuestionDetailState {
  const _$MyQuestionDetailStateImpl(
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
    return 'MyQuestionDetailState(isLoading: $isLoading, error: $error, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyQuestionDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.question, question));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(question));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyQuestionDetailStateImplCopyWith<_$MyQuestionDetailStateImpl>
      get copyWith => __$$MyQuestionDetailStateImplCopyWithImpl<
          _$MyQuestionDetailStateImpl>(this, _$identity);
}

abstract class _MyQuestionDetailState implements MyQuestionDetailState {
  const factory _MyQuestionDetailState(
      {final bool isLoading,
      final String? error,
      final QuestionModel? question}) = _$MyQuestionDetailStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  QuestionModel? get question;
  @override
  @JsonKey(ignore: true)
  _$$MyQuestionDetailStateImplCopyWith<_$MyQuestionDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
