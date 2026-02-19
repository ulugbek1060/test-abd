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
  BookmarkState get bookmarksState => throw _privateConstructorUsedError;

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
  $Res call(
      {String? error,
      bool isLoading,
      QuestionModel? question,
      BookmarkState bookmarksState});

  $BookmarkStateCopyWith<$Res> get bookmarksState;
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
    Object? bookmarksState = null,
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
      bookmarksState: null == bookmarksState
          ? _value.bookmarksState
          : bookmarksState // ignore: cast_nullable_to_non_nullable
              as BookmarkState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookmarkStateCopyWith<$Res> get bookmarksState {
    return $BookmarkStateCopyWith<$Res>(_value.bookmarksState, (value) {
      return _then(_value.copyWith(bookmarksState: value) as $Val);
    });
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
  $Res call(
      {String? error,
      bool isLoading,
      QuestionModel? question,
      BookmarkState bookmarksState});

  @override
  $BookmarkStateCopyWith<$Res> get bookmarksState;
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
    Object? bookmarksState = null,
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
      bookmarksState: null == bookmarksState
          ? _value.bookmarksState
          : bookmarksState // ignore: cast_nullable_to_non_nullable
              as BookmarkState,
    ));
  }
}

/// @nodoc

class _$UserQuestionDetailStateImpl implements _UserQuestionDetailState {
  const _$UserQuestionDetailStateImpl(
      {this.error,
      this.isLoading = false,
      this.question,
      this.bookmarksState = const BookmarkState()});

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final QuestionModel? question;
  @override
  @JsonKey()
  final BookmarkState bookmarksState;

  @override
  String toString() {
    return 'UserQuestionDetailState(error: $error, isLoading: $isLoading, question: $question, bookmarksState: $bookmarksState)';
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
                other.question == question) &&
            (identical(other.bookmarksState, bookmarksState) ||
                other.bookmarksState == bookmarksState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, error, isLoading, question, bookmarksState);

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
      final QuestionModel? question,
      final BookmarkState bookmarksState}) = _$UserQuestionDetailStateImpl;

  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  QuestionModel? get question;
  @override
  BookmarkState get bookmarksState;
  @override
  @JsonKey(ignore: true)
  _$$UserQuestionDetailStateImplCopyWith<_$UserQuestionDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookmarkState {
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isBookmarked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookmarkStateCopyWith<BookmarkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkStateCopyWith<$Res> {
  factory $BookmarkStateCopyWith(
          BookmarkState value, $Res Function(BookmarkState) then) =
      _$BookmarkStateCopyWithImpl<$Res, BookmarkState>;
  @useResult
  $Res call({String? error, bool isLoading, bool isBookmarked});
}

/// @nodoc
class _$BookmarkStateCopyWithImpl<$Res, $Val extends BookmarkState>
    implements $BookmarkStateCopyWith<$Res> {
  _$BookmarkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
    Object? isBookmarked = null,
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
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkStateImplCopyWith<$Res>
    implements $BookmarkStateCopyWith<$Res> {
  factory _$$BookmarkStateImplCopyWith(
          _$BookmarkStateImpl value, $Res Function(_$BookmarkStateImpl) then) =
      __$$BookmarkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error, bool isLoading, bool isBookmarked});
}

/// @nodoc
class __$$BookmarkStateImplCopyWithImpl<$Res>
    extends _$BookmarkStateCopyWithImpl<$Res, _$BookmarkStateImpl>
    implements _$$BookmarkStateImplCopyWith<$Res> {
  __$$BookmarkStateImplCopyWithImpl(
      _$BookmarkStateImpl _value, $Res Function(_$BookmarkStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
    Object? isBookmarked = null,
  }) {
    return _then(_$BookmarkStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BookmarkStateImpl implements _BookmarkState {
  const _$BookmarkStateImpl(
      {this.error, this.isLoading = false, this.isBookmarked = false});

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isBookmarked;

  @override
  String toString() {
    return 'BookmarkState(error: $error, isLoading: $isLoading, isBookmarked: $isBookmarked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, isLoading, isBookmarked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkStateImplCopyWith<_$BookmarkStateImpl> get copyWith =>
      __$$BookmarkStateImplCopyWithImpl<_$BookmarkStateImpl>(this, _$identity);
}

abstract class _BookmarkState implements BookmarkState {
  const factory _BookmarkState(
      {final String? error,
      final bool isLoading,
      final bool isBookmarked}) = _$BookmarkStateImpl;

  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  bool get isBookmarked;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkStateImplCopyWith<_$BookmarkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
