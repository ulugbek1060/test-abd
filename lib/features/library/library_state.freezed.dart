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
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  List<BookModel> get books => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;
  String get previous => throw _privateConstructorUsedError;

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
  $Res call(
      {String? error,
      bool isLoading,
      bool isLoadingMore,
      List<BookModel> books,
      String next,
      String previous});
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
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? books = null,
    Object? next = null,
    Object? previous = null,
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
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  $Res call(
      {String? error,
      bool isLoading,
      bool isLoadingMore,
      List<BookModel> books,
      String next,
      String previous});
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
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? books = null,
    Object? next = null,
    Object? previous = null,
  }) {
    return _then(_$LibraryStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LibraryStateImpl implements _LibraryState {
  const _$LibraryStateImpl(
      {this.error,
      this.isLoading = false,
      this.isLoadingMore = false,
      final List<BookModel> books = const [],
      this.next = '',
      this.previous = ''})
      : _books = books;

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  final List<BookModel> _books;
  @override
  @JsonKey()
  List<BookModel> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  @JsonKey()
  final String next;
  @override
  @JsonKey()
  final String previous;

  @override
  String toString() {
    return 'LibraryState(error: $error, isLoading: $isLoading, isLoadingMore: $isLoadingMore, books: $books, next: $next, previous: $previous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, isLoading, isLoadingMore,
      const DeepCollectionEquality().hash(_books), next, previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryStateImplCopyWith<_$LibraryStateImpl> get copyWith =>
      __$$LibraryStateImplCopyWithImpl<_$LibraryStateImpl>(this, _$identity);
}

abstract class _LibraryState implements LibraryState {
  const factory _LibraryState(
      {final String? error,
      final bool isLoading,
      final bool isLoadingMore,
      final List<BookModel> books,
      final String next,
      final String previous}) = _$LibraryStateImpl;

  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  List<BookModel> get books;
  @override
  String get next;
  @override
  String get previous;
  @override
  @JsonKey(ignore: true)
  _$$LibraryStateImplCopyWith<_$LibraryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
