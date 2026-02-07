// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  FollowedQuizState get followedQuizStata => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({FollowedQuizState followedQuizStata});

  $FollowedQuizStateCopyWith<$Res> get followedQuizStata;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followedQuizStata = null,
  }) {
    return _then(_value.copyWith(
      followedQuizStata: null == followedQuizStata
          ? _value.followedQuizStata
          : followedQuizStata // ignore: cast_nullable_to_non_nullable
              as FollowedQuizState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FollowedQuizStateCopyWith<$Res> get followedQuizStata {
    return $FollowedQuizStateCopyWith<$Res>(_value.followedQuizStata, (value) {
      return _then(_value.copyWith(followedQuizStata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FollowedQuizState followedQuizStata});

  @override
  $FollowedQuizStateCopyWith<$Res> get followedQuizStata;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followedQuizStata = null,
  }) {
    return _then(_$HomeStateImpl(
      followedQuizStata: null == followedQuizStata
          ? _value.followedQuizStata
          : followedQuizStata // ignore: cast_nullable_to_non_nullable
              as FollowedQuizState,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({this.followedQuizStata = const FollowedQuizState()});

  @override
  @JsonKey()
  final FollowedQuizState followedQuizStata;

  @override
  String toString() {
    return 'HomeState(followedQuizStata: $followedQuizStata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.followedQuizStata, followedQuizStata) ||
                other.followedQuizStata == followedQuizStata));
  }

  @override
  int get hashCode => Object.hash(runtimeType, followedQuizStata);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({final FollowedQuizState followedQuizStata}) =
      _$HomeStateImpl;

  @override
  FollowedQuizState get followedQuizStata;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FollowedQuizState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadMore => throw _privateConstructorUsedError;
  List<QuestionModel> get questions => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  int get nextPage => throw _privateConstructorUsedError;
  int get previousPage => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowedQuizStateCopyWith<FollowedQuizState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowedQuizStateCopyWith<$Res> {
  factory $FollowedQuizStateCopyWith(
          FollowedQuizState value, $Res Function(FollowedQuizState) then) =
      _$FollowedQuizStateCopyWithImpl<$Res, FollowedQuizState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadMore,
      List<QuestionModel> questions,
      bool isLastPage,
      int nextPage,
      int previousPage,
      String? error});
}

/// @nodoc
class _$FollowedQuizStateCopyWithImpl<$Res, $Val extends FollowedQuizState>
    implements $FollowedQuizStateCopyWith<$Res> {
  _$FollowedQuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadMore = null,
    Object? questions = null,
    Object? isLastPage = null,
    Object? nextPage = null,
    Object? previousPage = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMore: null == isLoadMore
          ? _value.isLoadMore
          : isLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      previousPage: null == previousPage
          ? _value.previousPage
          : previousPage // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowedQuizStateImplCopyWith<$Res>
    implements $FollowedQuizStateCopyWith<$Res> {
  factory _$$FollowedQuizStateImplCopyWith(_$FollowedQuizStateImpl value,
          $Res Function(_$FollowedQuizStateImpl) then) =
      __$$FollowedQuizStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadMore,
      List<QuestionModel> questions,
      bool isLastPage,
      int nextPage,
      int previousPage,
      String? error});
}

/// @nodoc
class __$$FollowedQuizStateImplCopyWithImpl<$Res>
    extends _$FollowedQuizStateCopyWithImpl<$Res, _$FollowedQuizStateImpl>
    implements _$$FollowedQuizStateImplCopyWith<$Res> {
  __$$FollowedQuizStateImplCopyWithImpl(_$FollowedQuizStateImpl _value,
      $Res Function(_$FollowedQuizStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadMore = null,
    Object? questions = null,
    Object? isLastPage = null,
    Object? nextPage = null,
    Object? previousPage = null,
    Object? error = freezed,
  }) {
    return _then(_$FollowedQuizStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMore: null == isLoadMore
          ? _value.isLoadMore
          : isLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      previousPage: null == previousPage
          ? _value.previousPage
          : previousPage // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FollowedQuizStateImpl implements _FollowedQuizState {
  const _$FollowedQuizStateImpl(
      {this.isLoading = false,
      this.isLoadMore = false,
      final List<QuestionModel> questions = const [],
      this.isLastPage = false,
      this.nextPage = 1,
      this.previousPage = 1,
      this.error})
      : _questions = questions;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadMore;
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
  final bool isLastPage;
  @override
  @JsonKey()
  final int nextPage;
  @override
  @JsonKey()
  final int previousPage;
  @override
  final String? error;

  @override
  String toString() {
    return 'FollowedQuizState(isLoading: $isLoading, isLoadMore: $isLoadMore, questions: $questions, isLastPage: $isLastPage, nextPage: $nextPage, previousPage: $previousPage, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowedQuizStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadMore, isLoadMore) ||
                other.isLoadMore == isLoadMore) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.previousPage, previousPage) ||
                other.previousPage == previousPage) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoadMore,
      const DeepCollectionEquality().hash(_questions),
      isLastPage,
      nextPage,
      previousPage,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowedQuizStateImplCopyWith<_$FollowedQuizStateImpl> get copyWith =>
      __$$FollowedQuizStateImplCopyWithImpl<_$FollowedQuizStateImpl>(
          this, _$identity);
}

abstract class _FollowedQuizState implements FollowedQuizState {
  const factory _FollowedQuizState(
      {final bool isLoading,
      final bool isLoadMore,
      final List<QuestionModel> questions,
      final bool isLastPage,
      final int nextPage,
      final int previousPage,
      final String? error}) = _$FollowedQuizStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isLoadMore;
  @override
  List<QuestionModel> get questions;
  @override
  bool get isLastPage;
  @override
  int get nextPage;
  @override
  int get previousPage;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$FollowedQuizStateImplCopyWith<_$FollowedQuizStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
