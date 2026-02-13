// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_question_data_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateQuestionDataRequest _$CreateQuestionDataRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateQuestionDataRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateQuestionDataRequest {
  @JsonKey(name: 'test')
  int? get test => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_index')
  int? get orderIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'answers')
  List<CreateAnswerRequest>? get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateQuestionDataRequestCopyWith<CreateQuestionDataRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateQuestionDataRequestCopyWith<$Res> {
  factory $CreateQuestionDataRequestCopyWith(CreateQuestionDataRequest value,
          $Res Function(CreateQuestionDataRequest) then) =
      _$CreateQuestionDataRequestCopyWithImpl<$Res, CreateQuestionDataRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'test') int? test,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'order_index') int? orderIndex,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'answers') List<CreateAnswerRequest>? answers});
}

/// @nodoc
class _$CreateQuestionDataRequestCopyWithImpl<$Res,
        $Val extends CreateQuestionDataRequest>
    implements $CreateQuestionDataRequestCopyWith<$Res> {
  _$CreateQuestionDataRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? test = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? orderIndex = freezed,
    Object? categoryId = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      orderIndex: freezed == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<CreateAnswerRequest>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateQuestionDataRequestImplCopyWith<$Res>
    implements $CreateQuestionDataRequestCopyWith<$Res> {
  factory _$$CreateQuestionDataRequestImplCopyWith(
          _$CreateQuestionDataRequestImpl value,
          $Res Function(_$CreateQuestionDataRequestImpl) then) =
      __$$CreateQuestionDataRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'test') int? test,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'order_index') int? orderIndex,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'answers') List<CreateAnswerRequest>? answers});
}

/// @nodoc
class __$$CreateQuestionDataRequestImplCopyWithImpl<$Res>
    extends _$CreateQuestionDataRequestCopyWithImpl<$Res,
        _$CreateQuestionDataRequestImpl>
    implements _$$CreateQuestionDataRequestImplCopyWith<$Res> {
  __$$CreateQuestionDataRequestImplCopyWithImpl(
      _$CreateQuestionDataRequestImpl _value,
      $Res Function(_$CreateQuestionDataRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? test = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? orderIndex = freezed,
    Object? categoryId = freezed,
    Object? answers = freezed,
  }) {
    return _then(_$CreateQuestionDataRequestImpl(
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      orderIndex: freezed == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: freezed == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<CreateAnswerRequest>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateQuestionDataRequestImpl implements _CreateQuestionDataRequest {
  const _$CreateQuestionDataRequestImpl(
      {@JsonKey(name: 'test') this.test,
      @JsonKey(name: 'question_text') this.questionText,
      @JsonKey(name: 'question_type') this.questionType,
      @JsonKey(name: 'order_index') this.orderIndex,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'answers') final List<CreateAnswerRequest>? answers})
      : _answers = answers;

  factory _$CreateQuestionDataRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateQuestionDataRequestImplFromJson(json);

  @override
  @JsonKey(name: 'test')
  final int? test;
  @override
  @JsonKey(name: 'question_text')
  final String? questionText;
  @override
  @JsonKey(name: 'question_type')
  final String? questionType;
  @override
  @JsonKey(name: 'order_index')
  final int? orderIndex;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  final List<CreateAnswerRequest>? _answers;
  @override
  @JsonKey(name: 'answers')
  List<CreateAnswerRequest>? get answers {
    final value = _answers;
    if (value == null) return null;
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateQuestionDataRequest(test: $test, questionText: $questionText, questionType: $questionType, orderIndex: $orderIndex, categoryId: $categoryId, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateQuestionDataRequestImpl &&
            (identical(other.test, test) || other.test == test) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, test, questionText, questionType,
      orderIndex, categoryId, const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateQuestionDataRequestImplCopyWith<_$CreateQuestionDataRequestImpl>
      get copyWith => __$$CreateQuestionDataRequestImplCopyWithImpl<
          _$CreateQuestionDataRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateQuestionDataRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateQuestionDataRequest implements CreateQuestionDataRequest {
  const factory _CreateQuestionDataRequest(
          {@JsonKey(name: 'test') final int? test,
          @JsonKey(name: 'question_text') final String? questionText,
          @JsonKey(name: 'question_type') final String? questionType,
          @JsonKey(name: 'order_index') final int? orderIndex,
          @JsonKey(name: 'category_id') final int? categoryId,
          @JsonKey(name: 'answers') final List<CreateAnswerRequest>? answers}) =
      _$CreateQuestionDataRequestImpl;

  factory _CreateQuestionDataRequest.fromJson(Map<String, dynamic> json) =
      _$CreateQuestionDataRequestImpl.fromJson;

  @override
  @JsonKey(name: 'test')
  int? get test;
  @override
  @JsonKey(name: 'question_text')
  String? get questionText;
  @override
  @JsonKey(name: 'question_type')
  String? get questionType;
  @override
  @JsonKey(name: 'order_index')
  int? get orderIndex;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'answers')
  List<CreateAnswerRequest>? get answers;
  @override
  @JsonKey(ignore: true)
  _$$CreateQuestionDataRequestImplCopyWith<_$CreateQuestionDataRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateAnswerRequest _$CreateAnswerRequestFromJson(Map<String, dynamic> json) {
  return _CreateAnswerRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateAnswerRequest {
  @JsonKey(name: 'letter')
  String? get letter => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_text')
  String? get answerText => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool? get isCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateAnswerRequestCopyWith<CreateAnswerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAnswerRequestCopyWith<$Res> {
  factory $CreateAnswerRequestCopyWith(
          CreateAnswerRequest value, $Res Function(CreateAnswerRequest) then) =
      _$CreateAnswerRequestCopyWithImpl<$Res, CreateAnswerRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'letter') String? letter,
      @JsonKey(name: 'answer_text') String? answerText,
      @JsonKey(name: 'is_correct') bool? isCorrect});
}

/// @nodoc
class _$CreateAnswerRequestCopyWithImpl<$Res, $Val extends CreateAnswerRequest>
    implements $CreateAnswerRequestCopyWith<$Res> {
  _$CreateAnswerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letter = freezed,
    Object? answerText = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_value.copyWith(
      letter: freezed == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String?,
      answerText: freezed == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: freezed == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateAnswerRequestImplCopyWith<$Res>
    implements $CreateAnswerRequestCopyWith<$Res> {
  factory _$$CreateAnswerRequestImplCopyWith(_$CreateAnswerRequestImpl value,
          $Res Function(_$CreateAnswerRequestImpl) then) =
      __$$CreateAnswerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'letter') String? letter,
      @JsonKey(name: 'answer_text') String? answerText,
      @JsonKey(name: 'is_correct') bool? isCorrect});
}

/// @nodoc
class __$$CreateAnswerRequestImplCopyWithImpl<$Res>
    extends _$CreateAnswerRequestCopyWithImpl<$Res, _$CreateAnswerRequestImpl>
    implements _$$CreateAnswerRequestImplCopyWith<$Res> {
  __$$CreateAnswerRequestImplCopyWithImpl(_$CreateAnswerRequestImpl _value,
      $Res Function(_$CreateAnswerRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letter = freezed,
    Object? answerText = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_$CreateAnswerRequestImpl(
      letter: freezed == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String?,
      answerText: freezed == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: freezed == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateAnswerRequestImpl implements _CreateAnswerRequest {
  const _$CreateAnswerRequestImpl(
      {@JsonKey(name: 'letter') this.letter,
      @JsonKey(name: 'answer_text') this.answerText,
      @JsonKey(name: 'is_correct') this.isCorrect});

  factory _$CreateAnswerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAnswerRequestImplFromJson(json);

  @override
  @JsonKey(name: 'letter')
  final String? letter;
  @override
  @JsonKey(name: 'answer_text')
  final String? answerText;
  @override
  @JsonKey(name: 'is_correct')
  final bool? isCorrect;

  @override
  String toString() {
    return 'CreateAnswerRequest(letter: $letter, answerText: $answerText, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAnswerRequestImpl &&
            (identical(other.letter, letter) || other.letter == letter) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, letter, answerText, isCorrect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAnswerRequestImplCopyWith<_$CreateAnswerRequestImpl> get copyWith =>
      __$$CreateAnswerRequestImplCopyWithImpl<_$CreateAnswerRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAnswerRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateAnswerRequest implements CreateAnswerRequest {
  const factory _CreateAnswerRequest(
          {@JsonKey(name: 'letter') final String? letter,
          @JsonKey(name: 'answer_text') final String? answerText,
          @JsonKey(name: 'is_correct') final bool? isCorrect}) =
      _$CreateAnswerRequestImpl;

  factory _CreateAnswerRequest.fromJson(Map<String, dynamic> json) =
      _$CreateAnswerRequestImpl.fromJson;

  @override
  @JsonKey(name: 'letter')
  String? get letter;
  @override
  @JsonKey(name: 'answer_text')
  String? get answerText;
  @override
  @JsonKey(name: 'is_correct')
  bool? get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$$CreateAnswerRequestImplCopyWith<_$CreateAnswerRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
