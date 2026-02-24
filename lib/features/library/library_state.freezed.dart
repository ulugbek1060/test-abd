// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LibraryState {
  String? get error => throw _privateConstructorUsedError;
  BooksState get booksState => throw _privateConstructorUsedError;
  AuthorsState get authorsState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LibraryStateCopyWith<LibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryStateCopyWith<$Res> {
  factory $LibraryStateCopyWith(
          LibraryState value, $Res Function(LibraryState) then) =
      _$LibraryStateCopyWithImpl<$Res, LibraryState>;
  @useResult
  $Res call({String? error, BooksState booksState, AuthorsState authorsState});

  $BooksStateCopyWith<$Res> get booksState;
  $AuthorsStateCopyWith<$Res> get authorsState;
}

/// @nodoc
class _$LibraryStateCopyWithImpl<$Res, $Val extends LibraryState>
    implements $LibraryStateCopyWith<$Res> {
  _$LibraryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? booksState = null,
    Object? authorsState = null,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      booksState: null == booksState
          ? _value.booksState
          : booksState // ignore: cast_nullable_to_non_nullable
              as BooksState,
      authorsState: null == authorsState
          ? _value.authorsState
          : authorsState // ignore: cast_nullable_to_non_nullable
              as AuthorsState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BooksStateCopyWith<$Res> get booksState {
    return $BooksStateCopyWith<$Res>(_value.booksState, (value) {
      return _then(_value.copyWith(booksState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorsStateCopyWith<$Res> get authorsState {
    return $AuthorsStateCopyWith<$Res>(_value.authorsState, (value) {
      return _then(_value.copyWith(authorsState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LibraryStateImplCopyWith<$Res>
    implements $LibraryStateCopyWith<$Res> {
  factory _$$LibraryStateImplCopyWith(
          _$LibraryStateImpl value, $Res Function(_$LibraryStateImpl) then) =
      __$$LibraryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error, BooksState booksState, AuthorsState authorsState});

  @override
  $BooksStateCopyWith<$Res> get booksState;
  @override
  $AuthorsStateCopyWith<$Res> get authorsState;
}

/// @nodoc
class __$$LibraryStateImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibraryStateImpl>
    implements _$$LibraryStateImplCopyWith<$Res> {
  __$$LibraryStateImplCopyWithImpl(
      _$LibraryStateImpl _value, $Res Function(_$LibraryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? booksState = null,
    Object? authorsState = null,
  }) {
    return _then(_$LibraryStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      booksState: null == booksState
          ? _value.booksState
          : booksState // ignore: cast_nullable_to_non_nullable
              as BooksState,
      authorsState: null == authorsState
          ? _value.authorsState
          : authorsState // ignore: cast_nullable_to_non_nullable
              as AuthorsState,
    ));
  }
}

/// @nodoc

class _$LibraryStateImpl implements _LibraryState {
  const _$LibraryStateImpl(
      {this.error,
      this.booksState = const BooksState(),
      this.authorsState = const AuthorsState()});

  @override
  final String? error;
  @override
  @JsonKey()
  final BooksState booksState;
  @override
  @JsonKey()
  final AuthorsState authorsState;

  @override
  String toString() {
    return 'LibraryState(error: $error, booksState: $booksState, authorsState: $authorsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.booksState, booksState) ||
                other.booksState == booksState) &&
            (identical(other.authorsState, authorsState) ||
                other.authorsState == authorsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, booksState, authorsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryStateImplCopyWith<_$LibraryStateImpl> get copyWith =>
      __$$LibraryStateImplCopyWithImpl<_$LibraryStateImpl>(this, _$identity);
}

abstract class _LibraryState implements LibraryState {
  const factory _LibraryState(
      {final String? error,
      final BooksState booksState,
      final AuthorsState authorsState}) = _$LibraryStateImpl;

  @override
  String? get error;
  @override
  BooksState get booksState;
  @override
  AuthorsState get authorsState;
  @override
  @JsonKey(ignore: true)
  _$$LibraryStateImplCopyWith<_$LibraryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BooksState {
  String? get error => throw _privateConstructorUsedError;
  List<BookModel> get books => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BooksStateCopyWith<BooksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksStateCopyWith<$Res> {
  factory $BooksStateCopyWith(
          BooksState value, $Res Function(BooksState) then) =
      _$BooksStateCopyWithImpl<$Res, BooksState>;
  @useResult
  $Res call(
      {String? error,
      List<BookModel> books,
      String? next,
      String? previous,
      bool isLoading,
      bool isLoadingMore});
}

/// @nodoc
class _$BooksStateCopyWithImpl<$Res, $Val extends BooksState>
    implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? books = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BooksStateImplCopyWith<$Res>
    implements $BooksStateCopyWith<$Res> {
  factory _$$BooksStateImplCopyWith(
          _$BooksStateImpl value, $Res Function(_$BooksStateImpl) then) =
      __$$BooksStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? error,
      List<BookModel> books,
      String? next,
      String? previous,
      bool isLoading,
      bool isLoadingMore});
}

/// @nodoc
class __$$BooksStateImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksStateImpl>
    implements _$$BooksStateImplCopyWith<$Res> {
  __$$BooksStateImplCopyWithImpl(
      _$BooksStateImpl _value, $Res Function(_$BooksStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? books = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$BooksStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BooksStateImpl implements _BooksState {
  const _$BooksStateImpl(
      {this.error,
      final List<BookModel> books = const [],
      this.next,
      this.previous,
      this.isLoading = false,
      this.isLoadingMore = false})
      : _books = books;

  @override
  final String? error;
  final List<BookModel> _books;
  @override
  @JsonKey()
  List<BookModel> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  final String? next;
  @override
  final String? previous;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'BooksState(error: $error, books: $books, next: $next, previous: $previous, isLoading: $isLoading, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      error,
      const DeepCollectionEquality().hash(_books),
      next,
      previous,
      isLoading,
      isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksStateImplCopyWith<_$BooksStateImpl> get copyWith =>
      __$$BooksStateImplCopyWithImpl<_$BooksStateImpl>(this, _$identity);
}

abstract class _BooksState implements BooksState {
  const factory _BooksState(
      {final String? error,
      final List<BookModel> books,
      final String? next,
      final String? previous,
      final bool isLoading,
      final bool isLoadingMore}) = _$BooksStateImpl;

  @override
  String? get error;
  @override
  List<BookModel> get books;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$BooksStateImplCopyWith<_$BooksStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthorsState {
  String? get error => throw _privateConstructorUsedError;
  List<AuthorModel> get authors => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthorsStateCopyWith<AuthorsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorsStateCopyWith<$Res> {
  factory $AuthorsStateCopyWith(
          AuthorsState value, $Res Function(AuthorsState) then) =
      _$AuthorsStateCopyWithImpl<$Res, AuthorsState>;
  @useResult
  $Res call(
      {String? error,
      List<AuthorModel> authors,
      String? next,
      String? previous,
      bool isLoading,
      bool isLoadingMore});
}

/// @nodoc
class _$AuthorsStateCopyWithImpl<$Res, $Val extends AuthorsState>
    implements $AuthorsStateCopyWith<$Res> {
  _$AuthorsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? authors = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorsStateImplCopyWith<$Res>
    implements $AuthorsStateCopyWith<$Res> {
  factory _$$AuthorsStateImplCopyWith(
          _$AuthorsStateImpl value, $Res Function(_$AuthorsStateImpl) then) =
      __$$AuthorsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? error,
      List<AuthorModel> authors,
      String? next,
      String? previous,
      bool isLoading,
      bool isLoadingMore});
}

/// @nodoc
class __$$AuthorsStateImplCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res, _$AuthorsStateImpl>
    implements _$$AuthorsStateImplCopyWith<$Res> {
  __$$AuthorsStateImplCopyWithImpl(
      _$AuthorsStateImpl _value, $Res Function(_$AuthorsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? authors = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? isLoading = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$AuthorsStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: null == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthorsStateImpl implements _AuthorsState {
  const _$AuthorsStateImpl(
      {this.error,
      final List<AuthorModel> authors = const [],
      this.next,
      this.previous,
      this.isLoading = false,
      this.isLoadingMore = false})
      : _authors = authors;

  @override
  final String? error;
  final List<AuthorModel> _authors;
  @override
  @JsonKey()
  List<AuthorModel> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  final String? next;
  @override
  final String? previous;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'AuthorsState(error: $error, authors: $authors, next: $next, previous: $previous, isLoading: $isLoading, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorsStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      error,
      const DeepCollectionEquality().hash(_authors),
      next,
      previous,
      isLoading,
      isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorsStateImplCopyWith<_$AuthorsStateImpl> get copyWith =>
      __$$AuthorsStateImplCopyWithImpl<_$AuthorsStateImpl>(this, _$identity);
}

abstract class _AuthorsState implements AuthorsState {
  const factory _AuthorsState(
      {final String? error,
      final List<AuthorModel> authors,
      final String? next,
      final String? previous,
      final bool isLoading,
      final bool isLoadingMore}) = _$AuthorsStateImpl;

  @override
  String? get error;
  @override
  List<AuthorModel> get authors;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$AuthorsStateImplCopyWith<_$AuthorsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
