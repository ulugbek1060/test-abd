// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_questions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookmarkQuestionsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get isLast => throw _privateConstructorUsedError;
  List<QuestionModel> get questions => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int get next => throw _privateConstructorUsedError;
  int get previous => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookmarkQuestionsStateCopyWith<BookmarkQuestionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkQuestionsStateCopyWith<$Res> {
  factory $BookmarkQuestionsStateCopyWith(BookmarkQuestionsState value,
          $Res Function(BookmarkQuestionsState) then) =
      _$BookmarkQuestionsStateCopyWithImpl<$Res, BookmarkQuestionsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingMore,
      bool isLast,
      List<QuestionModel> questions,
      String? error,
      int next,
      int previous});
}

/// @nodoc
class _$BookmarkQuestionsStateCopyWithImpl<$Res,
        $Val extends BookmarkQuestionsState>
    implements $BookmarkQuestionsStateCopyWith<$Res> {
  _$BookmarkQuestionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? isLast = null,
    Object? questions = null,
    Object? error = freezed,
    Object? next = null,
    Object? previous = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLast: null == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkQuestionsStateImplCopyWith<$Res>
    implements $BookmarkQuestionsStateCopyWith<$Res> {
  factory _$$BookmarkQuestionsStateImplCopyWith(
          _$BookmarkQuestionsStateImpl value,
          $Res Function(_$BookmarkQuestionsStateImpl) then) =
      __$$BookmarkQuestionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingMore,
      bool isLast,
      List<QuestionModel> questions,
      String? error,
      int next,
      int previous});
}

/// @nodoc
class __$$BookmarkQuestionsStateImplCopyWithImpl<$Res>
    extends _$BookmarkQuestionsStateCopyWithImpl<$Res,
        _$BookmarkQuestionsStateImpl>
    implements _$$BookmarkQuestionsStateImplCopyWith<$Res> {
  __$$BookmarkQuestionsStateImplCopyWithImpl(
      _$BookmarkQuestionsStateImpl _value,
      $Res Function(_$BookmarkQuestionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? isLast = null,
    Object? questions = null,
    Object? error = freezed,
    Object? next = null,
    Object? previous = null,
  }) {
    return _then(_$BookmarkQuestionsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLast: null == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BookmarkQuestionsStateImpl implements _BookmarkQuestionsState {
  const _$BookmarkQuestionsStateImpl(
      {this.isLoading = false,
      this.isLoadingMore = false,
      this.isLast = false,
      final List<QuestionModel> questions = const [],
      this.error = null,
      this.next = 1,
      this.previous = 1})
      : _questions = questions;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool isLast;
  final List<QuestionModel> _questions;
  @override
  @JsonKey()
  List<QuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  @JsonKey()
  final String? error;
  @override
  @JsonKey()
  final int next;
  @override
  @JsonKey()
  final int previous;

  @override
  String toString() {
    return 'BookmarkQuestionsState(isLoading: $isLoading, isLoadingMore: $isLoadingMore, isLast: $isLast, questions: $questions, error: $error, next: $next, previous: $previous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkQuestionsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.isLast, isLast) || other.isLast == isLast) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isLoadingMore, isLast,
      const DeepCollectionEquality().hash(_questions), error, next, previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkQuestionsStateImplCopyWith<_$BookmarkQuestionsStateImpl>
      get copyWith => __$$BookmarkQuestionsStateImplCopyWithImpl<
          _$BookmarkQuestionsStateImpl>(this, _$identity);
}

abstract class _BookmarkQuestionsState implements BookmarkQuestionsState {
  const factory _BookmarkQuestionsState(
      {final bool isLoading,
      final bool isLoadingMore,
      final bool isLast,
      final List<QuestionModel> questions,
      final String? error,
      final int next,
      final int previous}) = _$BookmarkQuestionsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get isLast;
  @override
  List<QuestionModel> get questions;
  @override
  String? get error;
  @override
  int get next;
  @override
  int get previous;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkQuestionsStateImplCopyWith<_$BookmarkQuestionsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
