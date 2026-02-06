// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_block_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateBlockState {
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  MyBlockModel? get block => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  CategoryModel? get selectedCategory => throw _privateConstructorUsedError;
  AccessType get selectedAccessType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateBlockStateCopyWith<CreateBlockState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBlockStateCopyWith<$Res> {
  factory $CreateBlockStateCopyWith(
          CreateBlockState value, $Res Function(CreateBlockState) then) =
      _$CreateBlockStateCopyWithImpl<$Res, CreateBlockState>;
  @useResult
  $Res call(
      {String? error,
      bool isLoading,
      MyBlockModel? block,
      List<CategoryModel> categories,
      CategoryModel? selectedCategory,
      AccessType selectedAccessType});
}

/// @nodoc
class _$CreateBlockStateCopyWithImpl<$Res, $Val extends CreateBlockState>
    implements $CreateBlockStateCopyWith<$Res> {
  _$CreateBlockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
    Object? block = freezed,
    Object? categories = null,
    Object? selectedCategory = freezed,
    Object? selectedAccessType = null,
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
      block: freezed == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as MyBlockModel?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      selectedAccessType: null == selectedAccessType
          ? _value.selectedAccessType
          : selectedAccessType // ignore: cast_nullable_to_non_nullable
              as AccessType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBlockStateImplCopyWith<$Res>
    implements $CreateBlockStateCopyWith<$Res> {
  factory _$$CreateBlockStateImplCopyWith(_$CreateBlockStateImpl value,
          $Res Function(_$CreateBlockStateImpl) then) =
      __$$CreateBlockStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? error,
      bool isLoading,
      MyBlockModel? block,
      List<CategoryModel> categories,
      CategoryModel? selectedCategory,
      AccessType selectedAccessType});
}

/// @nodoc
class __$$CreateBlockStateImplCopyWithImpl<$Res>
    extends _$CreateBlockStateCopyWithImpl<$Res, _$CreateBlockStateImpl>
    implements _$$CreateBlockStateImplCopyWith<$Res> {
  __$$CreateBlockStateImplCopyWithImpl(_$CreateBlockStateImpl _value,
      $Res Function(_$CreateBlockStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isLoading = null,
    Object? block = freezed,
    Object? categories = null,
    Object? selectedCategory = freezed,
    Object? selectedAccessType = null,
  }) {
    return _then(_$CreateBlockStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      block: freezed == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as MyBlockModel?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      selectedAccessType: null == selectedAccessType
          ? _value.selectedAccessType
          : selectedAccessType // ignore: cast_nullable_to_non_nullable
              as AccessType,
    ));
  }
}

/// @nodoc

class _$CreateBlockStateImpl implements _CreateBlockState {
  const _$CreateBlockStateImpl(
      {this.error,
      this.isLoading = false,
      this.block,
      final List<CategoryModel> categories = const [],
      this.selectedCategory,
      this.selectedAccessType = AccessType.public})
      : _categories = categories;

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final MyBlockModel? block;
  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final CategoryModel? selectedCategory;
  @override
  @JsonKey()
  final AccessType selectedAccessType;

  @override
  String toString() {
    return 'CreateBlockState(error: $error, isLoading: $isLoading, block: $block, categories: $categories, selectedCategory: $selectedCategory, selectedAccessType: $selectedAccessType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBlockStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.block, block) || other.block == block) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedAccessType, selectedAccessType) ||
                other.selectedAccessType == selectedAccessType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      error,
      isLoading,
      block,
      const DeepCollectionEquality().hash(_categories),
      selectedCategory,
      selectedAccessType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBlockStateImplCopyWith<_$CreateBlockStateImpl> get copyWith =>
      __$$CreateBlockStateImplCopyWithImpl<_$CreateBlockStateImpl>(
          this, _$identity);
}

abstract class _CreateBlockState implements CreateBlockState {
  const factory _CreateBlockState(
      {final String? error,
      final bool isLoading,
      final MyBlockModel? block,
      final List<CategoryModel> categories,
      final CategoryModel? selectedCategory,
      final AccessType selectedAccessType}) = _$CreateBlockStateImpl;

  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  MyBlockModel? get block;
  @override
  List<CategoryModel> get categories;
  @override
  CategoryModel? get selectedCategory;
  @override
  AccessType get selectedAccessType;
  @override
  @JsonKey(ignore: true)
  _$$CreateBlockStateImplCopyWith<_$CreateBlockStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
