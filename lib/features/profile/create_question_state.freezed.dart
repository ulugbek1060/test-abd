// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_question_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateQuestionState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<MyBlockModel> get blocks => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  List<AnswerItemModel> get answers => throw _privateConstructorUsedError;
  MyBlockModel? get selectedBlock => throw _privateConstructorUsedError;
  CategoryModel? get selectedCategory => throw _privateConstructorUsedError;
  QuestionType get questionType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateQuestionStateCopyWith<CreateQuestionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateQuestionStateCopyWith<$Res> {
  factory $CreateQuestionStateCopyWith(
          CreateQuestionState value, $Res Function(CreateQuestionState) then) =
      _$CreateQuestionStateCopyWithImpl<$Res, CreateQuestionState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      List<MyBlockModel> blocks,
      List<CategoryModel> categories,
      List<AnswerItemModel> answers,
      MyBlockModel? selectedBlock,
      CategoryModel? selectedCategory,
      QuestionType questionType});
}

/// @nodoc
class _$CreateQuestionStateCopyWithImpl<$Res, $Val extends CreateQuestionState>
    implements $CreateQuestionStateCopyWith<$Res> {
  _$CreateQuestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? blocks = null,
    Object? categories = null,
    Object? answers = null,
    Object? selectedBlock = freezed,
    Object? selectedCategory = freezed,
    Object? questionType = null,
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
      blocks: null == blocks
          ? _value.blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<MyBlockModel>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerItemModel>,
      selectedBlock: freezed == selectedBlock
          ? _value.selectedBlock
          : selectedBlock // ignore: cast_nullable_to_non_nullable
              as MyBlockModel?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateQuestionStateImplCopyWith<$Res>
    implements $CreateQuestionStateCopyWith<$Res> {
  factory _$$CreateQuestionStateImplCopyWith(_$CreateQuestionStateImpl value,
          $Res Function(_$CreateQuestionStateImpl) then) =
      __$$CreateQuestionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      List<MyBlockModel> blocks,
      List<CategoryModel> categories,
      List<AnswerItemModel> answers,
      MyBlockModel? selectedBlock,
      CategoryModel? selectedCategory,
      QuestionType questionType});
}

/// @nodoc
class __$$CreateQuestionStateImplCopyWithImpl<$Res>
    extends _$CreateQuestionStateCopyWithImpl<$Res, _$CreateQuestionStateImpl>
    implements _$$CreateQuestionStateImplCopyWith<$Res> {
  __$$CreateQuestionStateImplCopyWithImpl(_$CreateQuestionStateImpl _value,
      $Res Function(_$CreateQuestionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? blocks = null,
    Object? categories = null,
    Object? answers = null,
    Object? selectedBlock = freezed,
    Object? selectedCategory = freezed,
    Object? questionType = null,
  }) {
    return _then(_$CreateQuestionStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      blocks: null == blocks
          ? _value._blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<MyBlockModel>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerItemModel>,
      selectedBlock: freezed == selectedBlock
          ? _value.selectedBlock
          : selectedBlock // ignore: cast_nullable_to_non_nullable
              as MyBlockModel?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType,
    ));
  }
}

/// @nodoc

class _$CreateQuestionStateImpl implements _CreateQuestionState {
  const _$CreateQuestionStateImpl(
      {this.isLoading = false,
      this.error,
      final List<MyBlockModel> blocks = const [],
      final List<CategoryModel> categories = const [],
      final List<AnswerItemModel> answers = const [],
      this.selectedBlock,
      this.selectedCategory,
      this.questionType = QuestionType.singleSelect})
      : _blocks = blocks,
        _categories = categories,
        _answers = answers;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  final List<MyBlockModel> _blocks;
  @override
  @JsonKey()
  List<MyBlockModel> get blocks {
    if (_blocks is EqualUnmodifiableListView) return _blocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocks);
  }

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<AnswerItemModel> _answers;
  @override
  @JsonKey()
  List<AnswerItemModel> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final MyBlockModel? selectedBlock;
  @override
  final CategoryModel? selectedCategory;
  @override
  @JsonKey()
  final QuestionType questionType;

  @override
  String toString() {
    return 'CreateQuestionState(isLoading: $isLoading, error: $error, blocks: $blocks, categories: $categories, answers: $answers, selectedBlock: $selectedBlock, selectedCategory: $selectedCategory, questionType: $questionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateQuestionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._blocks, _blocks) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.selectedBlock, selectedBlock) ||
                other.selectedBlock == selectedBlock) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      const DeepCollectionEquality().hash(_blocks),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_answers),
      selectedBlock,
      selectedCategory,
      questionType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateQuestionStateImplCopyWith<_$CreateQuestionStateImpl> get copyWith =>
      __$$CreateQuestionStateImplCopyWithImpl<_$CreateQuestionStateImpl>(
          this, _$identity);
}

abstract class _CreateQuestionState implements CreateQuestionState {
  const factory _CreateQuestionState(
      {final bool isLoading,
      final String? error,
      final List<MyBlockModel> blocks,
      final List<CategoryModel> categories,
      final List<AnswerItemModel> answers,
      final MyBlockModel? selectedBlock,
      final CategoryModel? selectedCategory,
      final QuestionType questionType}) = _$CreateQuestionStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  List<MyBlockModel> get blocks;
  @override
  List<CategoryModel> get categories;
  @override
  List<AnswerItemModel> get answers;
  @override
  MyBlockModel? get selectedBlock;
  @override
  CategoryModel? get selectedCategory;
  @override
  QuestionType get questionType;
  @override
  @JsonKey(ignore: true)
  _$$CreateQuestionStateImplCopyWith<_$CreateQuestionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
