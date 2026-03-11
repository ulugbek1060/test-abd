// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'read_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReadBookState {
  bool get isLoading => throw _privateConstructorUsedError;
  int? get bookId => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get currentPage => throw _privateConstructorUsedError;
  String? get pdfPath => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadBookStateCopyWith<ReadBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadBookStateCopyWith<$Res> {
  factory $ReadBookStateCopyWith(
          ReadBookState value, $Res Function(ReadBookState) then) =
      _$ReadBookStateCopyWithImpl<$Res, ReadBookState>;
  @useResult
  $Res call(
      {bool isLoading,
      int? bookId,
      int? totalPages,
      int? currentPage,
      String? pdfPath,
      String? error});
}

/// @nodoc
class _$ReadBookStateCopyWithImpl<$Res, $Val extends ReadBookState>
    implements $ReadBookStateCopyWith<$Res> {
  _$ReadBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bookId = freezed,
    Object? totalPages = freezed,
    Object? currentPage = freezed,
    Object? pdfPath = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      pdfPath: freezed == pdfPath
          ? _value.pdfPath
          : pdfPath // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadBookStateImplCopyWith<$Res>
    implements $ReadBookStateCopyWith<$Res> {
  factory _$$ReadBookStateImplCopyWith(
          _$ReadBookStateImpl value, $Res Function(_$ReadBookStateImpl) then) =
      __$$ReadBookStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int? bookId,
      int? totalPages,
      int? currentPage,
      String? pdfPath,
      String? error});
}

/// @nodoc
class __$$ReadBookStateImplCopyWithImpl<$Res>
    extends _$ReadBookStateCopyWithImpl<$Res, _$ReadBookStateImpl>
    implements _$$ReadBookStateImplCopyWith<$Res> {
  __$$ReadBookStateImplCopyWithImpl(
      _$ReadBookStateImpl _value, $Res Function(_$ReadBookStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bookId = freezed,
    Object? totalPages = freezed,
    Object? currentPage = freezed,
    Object? pdfPath = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ReadBookStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      pdfPath: freezed == pdfPath
          ? _value.pdfPath
          : pdfPath // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReadBookStateImpl implements _ReadBookState {
  const _$ReadBookStateImpl(
      {this.isLoading = false,
      this.bookId,
      this.totalPages,
      this.currentPage,
      this.pdfPath,
      this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final int? bookId;
  @override
  final int? totalPages;
  @override
  final int? currentPage;
  @override
  final String? pdfPath;
  @override
  final String? error;

  @override
  String toString() {
    return 'ReadBookState(isLoading: $isLoading, bookId: $bookId, totalPages: $totalPages, currentPage: $currentPage, pdfPath: $pdfPath, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadBookStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.pdfPath, pdfPath) || other.pdfPath == pdfPath) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, bookId, totalPages, currentPage, pdfPath, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadBookStateImplCopyWith<_$ReadBookStateImpl> get copyWith =>
      __$$ReadBookStateImplCopyWithImpl<_$ReadBookStateImpl>(this, _$identity);
}

abstract class _ReadBookState implements ReadBookState {
  const factory _ReadBookState(
      {final bool isLoading,
      final int? bookId,
      final int? totalPages,
      final int? currentPage,
      final String? pdfPath,
      final String? error}) = _$ReadBookStateImpl;

  @override
  bool get isLoading;
  @override
  int? get bookId;
  @override
  int? get totalPages;
  @override
  int? get currentPage;
  @override
  String? get pdfPath;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$ReadBookStateImplCopyWith<_$ReadBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
