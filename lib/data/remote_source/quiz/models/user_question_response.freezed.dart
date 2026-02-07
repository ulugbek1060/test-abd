// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_question_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserQuestionResponse _$UserQuestionResponseFromJson(Map<String, dynamic> json) {
  return _UserQuestionResponse.fromJson(json);
}

/// @nodoc
mixin _$UserQuestionResponse {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'test')
  int? get test => throw _privateConstructorUsedError;
  @JsonKey(name: 'testTitle')
  String? get testTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'questionText')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'questionType')
  String? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderIndex')
  int? get orderIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  String? get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'answers')
  List<Answer> get answers => throw _privateConstructorUsedError;
  @JsonKey(name: 'testDescription')
  String? get testDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'correctAnswerText')
  String? get correctAnswerText => throw _privateConstructorUsedError;
  @JsonKey(name: 'answerLanguage')
  String? get answerLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'correctCount')
  int? get correctCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'wrongCount')
  int? get wrongCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficultyPercentage')
  double? get difficultyPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'userAttemptCount')
  int? get userAttemptCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'roundImage')
  String? get roundImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'isBookmarked')
  bool? get isBookmarked => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFollowing')
  bool? get isFollowing => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  Category? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserQuestionResponseCopyWith<UserQuestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserQuestionResponseCopyWith<$Res> {
  factory $UserQuestionResponseCopyWith(UserQuestionResponse value,
          $Res Function(UserQuestionResponse) then) =
      _$UserQuestionResponseCopyWithImpl<$Res, UserQuestionResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'test') int? test,
      @JsonKey(name: 'testTitle') String? testTitle,
      @JsonKey(name: 'questionText') String? questionText,
      @JsonKey(name: 'questionType') String? questionType,
      @JsonKey(name: 'orderIndex') int? orderIndex,
      @JsonKey(name: 'media') String? media,
      @JsonKey(name: 'answers') List<Answer> answers,
      @JsonKey(name: 'testDescription') String? testDescription,
      @JsonKey(name: 'correctAnswerText') String? correctAnswerText,
      @JsonKey(name: 'answerLanguage') String? answerLanguage,
      @JsonKey(name: 'correctCount') int? correctCount,
      @JsonKey(name: 'wrongCount') int? wrongCount,
      @JsonKey(name: 'difficultyPercentage') double? difficultyPercentage,
      @JsonKey(name: 'userAttemptCount') int? userAttemptCount,
      @JsonKey(name: 'user') User? user,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'roundImage') String? roundImage,
      @JsonKey(name: 'isBookmarked') bool? isBookmarked,
      @JsonKey(name: 'isFollowing') bool? isFollowing,
      @JsonKey(name: 'category') Category? category});

  $UserCopyWith<$Res>? get user;
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$UserQuestionResponseCopyWithImpl<$Res,
        $Val extends UserQuestionResponse>
    implements $UserQuestionResponseCopyWith<$Res> {
  _$UserQuestionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? test = freezed,
    Object? testTitle = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? orderIndex = freezed,
    Object? media = freezed,
    Object? answers = null,
    Object? testDescription = freezed,
    Object? correctAnswerText = freezed,
    Object? answerLanguage = freezed,
    Object? correctCount = freezed,
    Object? wrongCount = freezed,
    Object? difficultyPercentage = freezed,
    Object? userAttemptCount = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? roundImage = freezed,
    Object? isBookmarked = freezed,
    Object? isFollowing = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as int?,
      testTitle: freezed == testTitle
          ? _value.testTitle
          : testTitle // ignore: cast_nullable_to_non_nullable
              as String?,
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
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      testDescription: freezed == testDescription
          ? _value.testDescription
          : testDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswerText: freezed == correctAnswerText
          ? _value.correctAnswerText
          : correctAnswerText // ignore: cast_nullable_to_non_nullable
              as String?,
      answerLanguage: freezed == answerLanguage
          ? _value.answerLanguage
          : answerLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      correctCount: freezed == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int?,
      wrongCount: freezed == wrongCount
          ? _value.wrongCount
          : wrongCount // ignore: cast_nullable_to_non_nullable
              as int?,
      difficultyPercentage: freezed == difficultyPercentage
          ? _value.difficultyPercentage
          : difficultyPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      userAttemptCount: freezed == userAttemptCount
          ? _value.userAttemptCount
          : userAttemptCount // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roundImage: freezed == roundImage
          ? _value.roundImage
          : roundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserQuestionResponseImplCopyWith<$Res>
    implements $UserQuestionResponseCopyWith<$Res> {
  factory _$$UserQuestionResponseImplCopyWith(_$UserQuestionResponseImpl value,
          $Res Function(_$UserQuestionResponseImpl) then) =
      __$$UserQuestionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'test') int? test,
      @JsonKey(name: 'testTitle') String? testTitle,
      @JsonKey(name: 'questionText') String? questionText,
      @JsonKey(name: 'questionType') String? questionType,
      @JsonKey(name: 'orderIndex') int? orderIndex,
      @JsonKey(name: 'media') String? media,
      @JsonKey(name: 'answers') List<Answer> answers,
      @JsonKey(name: 'testDescription') String? testDescription,
      @JsonKey(name: 'correctAnswerText') String? correctAnswerText,
      @JsonKey(name: 'answerLanguage') String? answerLanguage,
      @JsonKey(name: 'correctCount') int? correctCount,
      @JsonKey(name: 'wrongCount') int? wrongCount,
      @JsonKey(name: 'difficultyPercentage') double? difficultyPercentage,
      @JsonKey(name: 'userAttemptCount') int? userAttemptCount,
      @JsonKey(name: 'user') User? user,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'roundImage') String? roundImage,
      @JsonKey(name: 'isBookmarked') bool? isBookmarked,
      @JsonKey(name: 'isFollowing') bool? isFollowing,
      @JsonKey(name: 'category') Category? category});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$UserQuestionResponseImplCopyWithImpl<$Res>
    extends _$UserQuestionResponseCopyWithImpl<$Res, _$UserQuestionResponseImpl>
    implements _$$UserQuestionResponseImplCopyWith<$Res> {
  __$$UserQuestionResponseImplCopyWithImpl(_$UserQuestionResponseImpl _value,
      $Res Function(_$UserQuestionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? test = freezed,
    Object? testTitle = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? orderIndex = freezed,
    Object? media = freezed,
    Object? answers = null,
    Object? testDescription = freezed,
    Object? correctAnswerText = freezed,
    Object? answerLanguage = freezed,
    Object? correctCount = freezed,
    Object? wrongCount = freezed,
    Object? difficultyPercentage = freezed,
    Object? userAttemptCount = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? roundImage = freezed,
    Object? isBookmarked = freezed,
    Object? isFollowing = freezed,
    Object? category = freezed,
  }) {
    return _then(_$UserQuestionResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as int?,
      testTitle: freezed == testTitle
          ? _value.testTitle
          : testTitle // ignore: cast_nullable_to_non_nullable
              as String?,
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
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      testDescription: freezed == testDescription
          ? _value.testDescription
          : testDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswerText: freezed == correctAnswerText
          ? _value.correctAnswerText
          : correctAnswerText // ignore: cast_nullable_to_non_nullable
              as String?,
      answerLanguage: freezed == answerLanguage
          ? _value.answerLanguage
          : answerLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      correctCount: freezed == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int?,
      wrongCount: freezed == wrongCount
          ? _value.wrongCount
          : wrongCount // ignore: cast_nullable_to_non_nullable
              as int?,
      difficultyPercentage: freezed == difficultyPercentage
          ? _value.difficultyPercentage
          : difficultyPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      userAttemptCount: freezed == userAttemptCount
          ? _value.userAttemptCount
          : userAttemptCount // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roundImage: freezed == roundImage
          ? _value.roundImage
          : roundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserQuestionResponseImpl implements _UserQuestionResponse {
  const _$UserQuestionResponseImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'test') this.test,
      @JsonKey(name: 'testTitle') this.testTitle,
      @JsonKey(name: 'questionText') this.questionText,
      @JsonKey(name: 'questionType') this.questionType,
      @JsonKey(name: 'orderIndex') this.orderIndex,
      @JsonKey(name: 'media') this.media,
      @JsonKey(name: 'answers') final List<Answer> answers = const [],
      @JsonKey(name: 'testDescription') this.testDescription,
      @JsonKey(name: 'correctAnswerText') this.correctAnswerText,
      @JsonKey(name: 'answerLanguage') this.answerLanguage,
      @JsonKey(name: 'correctCount') this.correctCount,
      @JsonKey(name: 'wrongCount') this.wrongCount,
      @JsonKey(name: 'difficultyPercentage') this.difficultyPercentage,
      @JsonKey(name: 'userAttemptCount') this.userAttemptCount,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'roundImage') this.roundImage,
      @JsonKey(name: 'isBookmarked') this.isBookmarked,
      @JsonKey(name: 'isFollowing') this.isFollowing,
      @JsonKey(name: 'category') this.category})
      : _answers = answers;

  factory _$UserQuestionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserQuestionResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'test')
  final int? test;
  @override
  @JsonKey(name: 'testTitle')
  final String? testTitle;
  @override
  @JsonKey(name: 'questionText')
  final String? questionText;
  @override
  @JsonKey(name: 'questionType')
  final String? questionType;
  @override
  @JsonKey(name: 'orderIndex')
  final int? orderIndex;
  @override
  @JsonKey(name: 'media')
  final String? media;
  final List<Answer> _answers;
  @override
  @JsonKey(name: 'answers')
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey(name: 'testDescription')
  final String? testDescription;
  @override
  @JsonKey(name: 'correctAnswerText')
  final String? correctAnswerText;
  @override
  @JsonKey(name: 'answerLanguage')
  final String? answerLanguage;
  @override
  @JsonKey(name: 'correctCount')
  final int? correctCount;
  @override
  @JsonKey(name: 'wrongCount')
  final int? wrongCount;
  @override
  @JsonKey(name: 'difficultyPercentage')
  final double? difficultyPercentage;
  @override
  @JsonKey(name: 'userAttemptCount')
  final int? userAttemptCount;
  @override
  @JsonKey(name: 'user')
  final User? user;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'roundImage')
  final String? roundImage;
  @override
  @JsonKey(name: 'isBookmarked')
  final bool? isBookmarked;
  @override
  @JsonKey(name: 'isFollowing')
  final bool? isFollowing;
  @override
  @JsonKey(name: 'category')
  final Category? category;

  @override
  String toString() {
    return 'UserQuestionResponse(id: $id, test: $test, testTitle: $testTitle, questionText: $questionText, questionType: $questionType, orderIndex: $orderIndex, media: $media, answers: $answers, testDescription: $testDescription, correctAnswerText: $correctAnswerText, answerLanguage: $answerLanguage, correctCount: $correctCount, wrongCount: $wrongCount, difficultyPercentage: $difficultyPercentage, userAttemptCount: $userAttemptCount, user: $user, createdAt: $createdAt, roundImage: $roundImage, isBookmarked: $isBookmarked, isFollowing: $isFollowing, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserQuestionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.test, test) || other.test == test) &&
            (identical(other.testTitle, testTitle) ||
                other.testTitle == testTitle) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.media, media) || other.media == media) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.testDescription, testDescription) ||
                other.testDescription == testDescription) &&
            (identical(other.correctAnswerText, correctAnswerText) ||
                other.correctAnswerText == correctAnswerText) &&
            (identical(other.answerLanguage, answerLanguage) ||
                other.answerLanguage == answerLanguage) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.wrongCount, wrongCount) ||
                other.wrongCount == wrongCount) &&
            (identical(other.difficultyPercentage, difficultyPercentage) ||
                other.difficultyPercentage == difficultyPercentage) &&
            (identical(other.userAttemptCount, userAttemptCount) ||
                other.userAttemptCount == userAttemptCount) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.roundImage, roundImage) ||
                other.roundImage == roundImage) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        test,
        testTitle,
        questionText,
        questionType,
        orderIndex,
        media,
        const DeepCollectionEquality().hash(_answers),
        testDescription,
        correctAnswerText,
        answerLanguage,
        correctCount,
        wrongCount,
        difficultyPercentage,
        userAttemptCount,
        user,
        createdAt,
        roundImage,
        isBookmarked,
        isFollowing,
        category
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserQuestionResponseImplCopyWith<_$UserQuestionResponseImpl>
      get copyWith =>
          __$$UserQuestionResponseImplCopyWithImpl<_$UserQuestionResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserQuestionResponseImplToJson(
      this,
    );
  }
}

abstract class _UserQuestionResponse implements UserQuestionResponse {
  const factory _UserQuestionResponse(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'test') final int? test,
      @JsonKey(name: 'testTitle') final String? testTitle,
      @JsonKey(name: 'questionText') final String? questionText,
      @JsonKey(name: 'questionType') final String? questionType,
      @JsonKey(name: 'orderIndex') final int? orderIndex,
      @JsonKey(name: 'media') final String? media,
      @JsonKey(name: 'answers') final List<Answer> answers,
      @JsonKey(name: 'testDescription') final String? testDescription,
      @JsonKey(name: 'correctAnswerText') final String? correctAnswerText,
      @JsonKey(name: 'answerLanguage') final String? answerLanguage,
      @JsonKey(name: 'correctCount') final int? correctCount,
      @JsonKey(name: 'wrongCount') final int? wrongCount,
      @JsonKey(name: 'difficultyPercentage') final double? difficultyPercentage,
      @JsonKey(name: 'userAttemptCount') final int? userAttemptCount,
      @JsonKey(name: 'user') final User? user,
      @JsonKey(name: 'createdAt') final DateTime? createdAt,
      @JsonKey(name: 'roundImage') final String? roundImage,
      @JsonKey(name: 'isBookmarked') final bool? isBookmarked,
      @JsonKey(name: 'isFollowing') final bool? isFollowing,
      @JsonKey(name: 'category')
      final Category? category}) = _$UserQuestionResponseImpl;

  factory _UserQuestionResponse.fromJson(Map<String, dynamic> json) =
      _$UserQuestionResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'test')
  int? get test;
  @override
  @JsonKey(name: 'testTitle')
  String? get testTitle;
  @override
  @JsonKey(name: 'questionText')
  String? get questionText;
  @override
  @JsonKey(name: 'questionType')
  String? get questionType;
  @override
  @JsonKey(name: 'orderIndex')
  int? get orderIndex;
  @override
  @JsonKey(name: 'media')
  String? get media;
  @override
  @JsonKey(name: 'answers')
  List<Answer> get answers;
  @override
  @JsonKey(name: 'testDescription')
  String? get testDescription;
  @override
  @JsonKey(name: 'correctAnswerText')
  String? get correctAnswerText;
  @override
  @JsonKey(name: 'answerLanguage')
  String? get answerLanguage;
  @override
  @JsonKey(name: 'correctCount')
  int? get correctCount;
  @override
  @JsonKey(name: 'wrongCount')
  int? get wrongCount;
  @override
  @JsonKey(name: 'difficultyPercentage')
  double? get difficultyPercentage;
  @override
  @JsonKey(name: 'userAttemptCount')
  int? get userAttemptCount;
  @override
  @JsonKey(name: 'user')
  User? get user;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'roundImage')
  String? get roundImage;
  @override
  @JsonKey(name: 'isBookmarked')
  bool? get isBookmarked;
  @override
  @JsonKey(name: 'isFollowing')
  bool? get isFollowing;
  @override
  @JsonKey(name: 'category')
  Category? get category;
  @override
  @JsonKey(ignore: true)
  _$$UserQuestionResponseImplCopyWith<_$UserQuestionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTests')
  int? get totalTests => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalQuestions')
  int? get totalQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'emoji')
  String? get emoji => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'totalTests') int? totalTests,
      @JsonKey(name: 'totalQuestions') int? totalQuestions,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'emoji') String? emoji,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? totalTests = freezed,
    Object? totalQuestions = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? emoji = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTests: freezed == totalTests
          ? _value.totalTests
          : totalTests // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'totalTests') int? totalTests,
      @JsonKey(name: 'totalQuestions') int? totalQuestions,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'emoji') String? emoji,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? totalTests = freezed,
    Object? totalQuestions = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? emoji = freezed,
    Object? image = freezed,
  }) {
    return _then(_$CategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTests: freezed == totalTests
          ? _value.totalTests
          : totalTests // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'totalTests') this.totalTests,
      @JsonKey(name: 'totalQuestions') this.totalQuestions,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'emoji') this.emoji,
      @JsonKey(name: 'image') this.image});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'totalTests')
  final int? totalTests;
  @override
  @JsonKey(name: 'totalQuestions')
  final int? totalQuestions;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'emoji')
  final String? emoji;
  @override
  @JsonKey(name: 'image')
  final String? image;

  @override
  String toString() {
    return 'Category(id: $id, totalTests: $totalTests, totalQuestions: $totalQuestions, title: $title, slug: $slug, description: $description, emoji: $emoji, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalTests, totalTests) ||
                other.totalTests == totalTests) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, totalTests, totalQuestions,
      title, slug, description, emoji, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'totalTests') final int? totalTests,
      @JsonKey(name: 'totalQuestions') final int? totalQuestions,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'slug') final String? slug,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'emoji') final String? emoji,
      @JsonKey(name: 'image') final String? image}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'totalTests')
  int? get totalTests;
  @override
  @JsonKey(name: 'totalQuestions')
  int? get totalQuestions;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'emoji')
  String? get emoji;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'letter')
  String? get letter => throw _privateConstructorUsedError;
  @JsonKey(name: 'answerText')
  String? get answerText => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCorrect')
  bool? get isCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'letter') String? letter,
      @JsonKey(name: 'answerText') String? answerText,
      @JsonKey(name: 'isCorrect') bool? isCorrect});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? letter = freezed,
    Object? answerText = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'letter') String? letter,
      @JsonKey(name: 'answerText') String? answerText,
      @JsonKey(name: 'isCorrect') bool? isCorrect});
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
      _$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? letter = freezed,
    Object? answerText = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_$AnswerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'letter') this.letter,
      @JsonKey(name: 'answerText') this.answerText,
      @JsonKey(name: 'isCorrect') this.isCorrect});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'letter')
  final String? letter;
  @override
  @JsonKey(name: 'answerText')
  final String? answerText;
  @override
  @JsonKey(name: 'isCorrect')
  final bool? isCorrect;

  @override
  String toString() {
    return 'Answer(id: $id, letter: $letter, answerText: $answerText, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.letter, letter) || other.letter == letter) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, letter, answerText, isCorrect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerImplToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'letter') final String? letter,
      @JsonKey(name: 'answerText') final String? answerText,
      @JsonKey(name: 'isCorrect') final bool? isCorrect}) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'letter')
  String? get letter;
  @override
  @JsonKey(name: 'answerText')
  String? get answerText;
  @override
  @JsonKey(name: 'isCorrect')
  bool? get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'profileImage')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'isBadged')
  bool? get isBadged => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPremium')
  bool? get isPremium => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFollowing')
  bool? get isFollowing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'profileImage') String? profileImage,
      @JsonKey(name: 'isBadged') bool? isBadged,
      @JsonKey(name: 'isPremium') bool? isPremium,
      @JsonKey(name: 'isFollowing') bool? isFollowing});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? profileImage = freezed,
    Object? isBadged = freezed,
    Object? isPremium = freezed,
    Object? isFollowing = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isBadged: freezed == isBadged
          ? _value.isBadged
          : isBadged // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPremium: freezed == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'profileImage') String? profileImage,
      @JsonKey(name: 'isBadged') bool? isBadged,
      @JsonKey(name: 'isPremium') bool? isPremium,
      @JsonKey(name: 'isFollowing') bool? isFollowing});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? profileImage = freezed,
    Object? isBadged = freezed,
    Object? isPremium = freezed,
    Object? isFollowing = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isBadged: freezed == isBadged
          ? _value.isBadged
          : isBadged // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPremium: freezed == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'profileImage') this.profileImage,
      @JsonKey(name: 'isBadged') this.isBadged,
      @JsonKey(name: 'isPremium') this.isPremium,
      @JsonKey(name: 'isFollowing') this.isFollowing});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'profileImage')
  final String? profileImage;
  @override
  @JsonKey(name: 'isBadged')
  final bool? isBadged;
  @override
  @JsonKey(name: 'isPremium')
  final bool? isPremium;
  @override
  @JsonKey(name: 'isFollowing')
  final bool? isFollowing;

  @override
  String toString() {
    return 'User(id: $id, username: $username, profileImage: $profileImage, isBadged: $isBadged, isPremium: $isPremium, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.isBadged, isBadged) ||
                other.isBadged == isBadged) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, profileImage,
      isBadged, isPremium, isFollowing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'username') final String? username,
      @JsonKey(name: 'profileImage') final String? profileImage,
      @JsonKey(name: 'isBadged') final bool? isBadged,
      @JsonKey(name: 'isPremium') final bool? isPremium,
      @JsonKey(name: 'isFollowing') final bool? isFollowing}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'profileImage')
  String? get profileImage;
  @override
  @JsonKey(name: 'isBadged')
  bool? get isBadged;
  @override
  @JsonKey(name: 'isPremium')
  bool? get isPremium;
  @override
  @JsonKey(name: 'isFollowing')
  bool? get isFollowing;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
