// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookDetailStateCopyWith<BookDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailStateCopyWith<$Res> {
  factory $BookDetailStateCopyWith(
          BookDetailState value, $Res Function(BookDetailState) then) =
      _$BookDetailStateCopyWithImpl<$Res, BookDetailState>;
  @useResult
  $Res call({bool isLoading, String? error, dynamic data});
}

/// @nodoc
class _$BookDetailStateCopyWithImpl<$Res, $Val extends BookDetailState>
    implements $BookDetailStateCopyWith<$Res> {
  _$BookDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? data = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookDetailStateImplCopyWith<$Res>
    implements $BookDetailStateCopyWith<$Res> {
  factory _$$BookDetailStateImplCopyWith(_$BookDetailStateImpl value,
          $Res Function(_$BookDetailStateImpl) then) =
      __$$BookDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, dynamic data});
}

/// @nodoc
class __$$BookDetailStateImplCopyWithImpl<$Res>
    extends _$BookDetailStateCopyWithImpl<$Res, _$BookDetailStateImpl>
    implements _$$BookDetailStateImplCopyWith<$Res> {
  __$$BookDetailStateImplCopyWithImpl(
      _$BookDetailStateImpl _value, $Res Function(_$BookDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_$BookDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$BookDetailStateImpl implements _BookDetailState {
  const _$BookDetailStateImpl({this.isLoading = false, this.error, this.data});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'BookDetailState(isLoading: $isLoading, error: $error, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, error, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDetailStateImplCopyWith<_$BookDetailStateImpl> get copyWith =>
      __$$BookDetailStateImplCopyWithImpl<_$BookDetailStateImpl>(
          this, _$identity);
}

abstract class _BookDetailState implements BookDetailState {
  const factory _BookDetailState(
      {final bool isLoading,
      final String? error,
      final dynamic data}) = _$BookDetailStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$BookDetailStateImplCopyWith<_$BookDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
