// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_block_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyBlockResponse _$MyBlockResponseFromJson(Map<String, dynamic> json) {
  return _MyQuestionResponse.fromJson(json);
}

/// @nodoc
mixin _$MyBlockResponse {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  QuestionUser? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  QuestionCategory? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'visibility')
  String? get visibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_mode')
  String? get accessMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_roles')
  String? get participantRoles => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_participants')
  int? get maxParticipants => throw _privateConstructorUsedError; // not defined
  @JsonKey(name: 'start_time')
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  DateTime? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_score_to_finish')
  int? get minScoreToFinish => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_count_to_finish')
  int? get participantCountToFinish => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  int? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'region')
  int? get region => throw _privateConstructorUsedError;
  @JsonKey(name: 'district')
  int? get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_id')
  int? get districtId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_region_premium')
  bool? get isRegionPremium => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_percentage')
  int? get difficultyPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_questions')
  int? get totalQuestions =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'questions') String? questions,
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_count')
  int? get participantCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_question_difficulty')
  int? get averageQuestionDifficulty => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_completion_time_minutes')
  int? get averageCompletionTimeMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_correct_attempts')
  int? get totalCorrectAttempts => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_wrong_attempts')
  int? get totalWrongAttempts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyBlockResponseCopyWith<MyBlockResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBlockResponseCopyWith<$Res> {
  factory $MyBlockResponseCopyWith(
          MyBlockResponse value, $Res Function(MyBlockResponse) then) =
      _$MyBlockResponseCopyWithImpl<$Res, MyBlockResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user') QuestionUser? user,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'category') QuestionCategory? category,
      @JsonKey(name: 'visibility') String? visibility,
      @JsonKey(name: 'access_mode') String? accessMode,
      @JsonKey(name: 'participant_roles') String? participantRoles,
      @JsonKey(name: 'max_participants') int? maxParticipants,
      @JsonKey(name: 'start_time') DateTime? startTime,
      @JsonKey(name: 'end_time') DateTime? endTime,
      @JsonKey(name: 'min_score_to_finish') int? minScoreToFinish,
      @JsonKey(name: 'participant_count_to_finish')
      int? participantCountToFinish,
      @JsonKey(name: 'country') int? country,
      @JsonKey(name: 'country_id') int? countryId,
      @JsonKey(name: 'region') int? region,
      @JsonKey(name: 'district') int? district,
      @JsonKey(name: 'district_id') int? districtId,
      @JsonKey(name: 'is_region_premium') bool? isRegionPremium,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'difficulty_percentage') int? difficultyPercentage,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      @JsonKey(name: 'participant_count') int? participantCount,
      @JsonKey(name: 'average_question_difficulty')
      int? averageQuestionDifficulty,
      @JsonKey(name: 'average_completion_time_minutes')
      int? averageCompletionTimeMinutes,
      @JsonKey(name: 'total_correct_attempts') int? totalCorrectAttempts,
      @JsonKey(name: 'total_wrong_attempts') int? totalWrongAttempts});

  $QuestionUserCopyWith<$Res>? get user;
  $QuestionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$MyBlockResponseCopyWithImpl<$Res, $Val extends MyBlockResponse>
    implements $MyBlockResponseCopyWith<$Res> {
  _$MyBlockResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? visibility = freezed,
    Object? accessMode = freezed,
    Object? participantRoles = freezed,
    Object? maxParticipants = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? minScoreToFinish = freezed,
    Object? participantCountToFinish = freezed,
    Object? country = freezed,
    Object? countryId = freezed,
    Object? region = freezed,
    Object? district = freezed,
    Object? districtId = freezed,
    Object? isRegionPremium = freezed,
    Object? createdAt = freezed,
    Object? difficultyPercentage = freezed,
    Object? totalQuestions = freezed,
    Object? isBookmarked = freezed,
    Object? participantCount = freezed,
    Object? averageQuestionDifficulty = freezed,
    Object? averageCompletionTimeMinutes = freezed,
    Object? totalCorrectAttempts = freezed,
    Object? totalWrongAttempts = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QuestionUser?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as QuestionCategory?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String?,
      accessMode: freezed == accessMode
          ? _value.accessMode
          : accessMode // ignore: cast_nullable_to_non_nullable
              as String?,
      participantRoles: freezed == participantRoles
          ? _value.participantRoles
          : participantRoles // ignore: cast_nullable_to_non_nullable
              as String?,
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minScoreToFinish: freezed == minScoreToFinish
          ? _value.minScoreToFinish
          : minScoreToFinish // ignore: cast_nullable_to_non_nullable
              as int?,
      participantCountToFinish: freezed == participantCountToFinish
          ? _value.participantCountToFinish
          : participantCountToFinish // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as int?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      isRegionPremium: freezed == isRegionPremium
          ? _value.isRegionPremium
          : isRegionPremium // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      difficultyPercentage: freezed == difficultyPercentage
          ? _value.difficultyPercentage
          : difficultyPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      participantCount: freezed == participantCount
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int?,
      averageQuestionDifficulty: freezed == averageQuestionDifficulty
          ? _value.averageQuestionDifficulty
          : averageQuestionDifficulty // ignore: cast_nullable_to_non_nullable
              as int?,
      averageCompletionTimeMinutes: freezed == averageCompletionTimeMinutes
          ? _value.averageCompletionTimeMinutes
          : averageCompletionTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCorrectAttempts: freezed == totalCorrectAttempts
          ? _value.totalCorrectAttempts
          : totalCorrectAttempts // ignore: cast_nullable_to_non_nullable
              as int?,
      totalWrongAttempts: freezed == totalWrongAttempts
          ? _value.totalWrongAttempts
          : totalWrongAttempts // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $QuestionUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $QuestionCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyQuestionResponseImplCopyWith<$Res>
    implements $MyBlockResponseCopyWith<$Res> {
  factory _$$MyQuestionResponseImplCopyWith(_$MyQuestionResponseImpl value,
          $Res Function(_$MyQuestionResponseImpl) then) =
      __$$MyQuestionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user') QuestionUser? user,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'category') QuestionCategory? category,
      @JsonKey(name: 'visibility') String? visibility,
      @JsonKey(name: 'access_mode') String? accessMode,
      @JsonKey(name: 'participant_roles') String? participantRoles,
      @JsonKey(name: 'max_participants') int? maxParticipants,
      @JsonKey(name: 'start_time') DateTime? startTime,
      @JsonKey(name: 'end_time') DateTime? endTime,
      @JsonKey(name: 'min_score_to_finish') int? minScoreToFinish,
      @JsonKey(name: 'participant_count_to_finish')
      int? participantCountToFinish,
      @JsonKey(name: 'country') int? country,
      @JsonKey(name: 'country_id') int? countryId,
      @JsonKey(name: 'region') int? region,
      @JsonKey(name: 'district') int? district,
      @JsonKey(name: 'district_id') int? districtId,
      @JsonKey(name: 'is_region_premium') bool? isRegionPremium,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'difficulty_percentage') int? difficultyPercentage,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      @JsonKey(name: 'participant_count') int? participantCount,
      @JsonKey(name: 'average_question_difficulty')
      int? averageQuestionDifficulty,
      @JsonKey(name: 'average_completion_time_minutes')
      int? averageCompletionTimeMinutes,
      @JsonKey(name: 'total_correct_attempts') int? totalCorrectAttempts,
      @JsonKey(name: 'total_wrong_attempts') int? totalWrongAttempts});

  @override
  $QuestionUserCopyWith<$Res>? get user;
  @override
  $QuestionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$MyQuestionResponseImplCopyWithImpl<$Res>
    extends _$MyBlockResponseCopyWithImpl<$Res, _$MyQuestionResponseImpl>
    implements _$$MyQuestionResponseImplCopyWith<$Res> {
  __$$MyQuestionResponseImplCopyWithImpl(_$MyQuestionResponseImpl _value,
      $Res Function(_$MyQuestionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? visibility = freezed,
    Object? accessMode = freezed,
    Object? participantRoles = freezed,
    Object? maxParticipants = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? minScoreToFinish = freezed,
    Object? participantCountToFinish = freezed,
    Object? country = freezed,
    Object? countryId = freezed,
    Object? region = freezed,
    Object? district = freezed,
    Object? districtId = freezed,
    Object? isRegionPremium = freezed,
    Object? createdAt = freezed,
    Object? difficultyPercentage = freezed,
    Object? totalQuestions = freezed,
    Object? isBookmarked = freezed,
    Object? participantCount = freezed,
    Object? averageQuestionDifficulty = freezed,
    Object? averageCompletionTimeMinutes = freezed,
    Object? totalCorrectAttempts = freezed,
    Object? totalWrongAttempts = freezed,
  }) {
    return _then(_$MyQuestionResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QuestionUser?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as QuestionCategory?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String?,
      accessMode: freezed == accessMode
          ? _value.accessMode
          : accessMode // ignore: cast_nullable_to_non_nullable
              as String?,
      participantRoles: freezed == participantRoles
          ? _value.participantRoles
          : participantRoles // ignore: cast_nullable_to_non_nullable
              as String?,
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minScoreToFinish: freezed == minScoreToFinish
          ? _value.minScoreToFinish
          : minScoreToFinish // ignore: cast_nullable_to_non_nullable
              as int?,
      participantCountToFinish: freezed == participantCountToFinish
          ? _value.participantCountToFinish
          : participantCountToFinish // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as int?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      isRegionPremium: freezed == isRegionPremium
          ? _value.isRegionPremium
          : isRegionPremium // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      difficultyPercentage: freezed == difficultyPercentage
          ? _value.difficultyPercentage
          : difficultyPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      participantCount: freezed == participantCount
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int?,
      averageQuestionDifficulty: freezed == averageQuestionDifficulty
          ? _value.averageQuestionDifficulty
          : averageQuestionDifficulty // ignore: cast_nullable_to_non_nullable
              as int?,
      averageCompletionTimeMinutes: freezed == averageCompletionTimeMinutes
          ? _value.averageCompletionTimeMinutes
          : averageCompletionTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCorrectAttempts: freezed == totalCorrectAttempts
          ? _value.totalCorrectAttempts
          : totalCorrectAttempts // ignore: cast_nullable_to_non_nullable
              as int?,
      totalWrongAttempts: freezed == totalWrongAttempts
          ? _value.totalWrongAttempts
          : totalWrongAttempts // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyQuestionResponseImpl implements _MyQuestionResponse {
  const _$MyQuestionResponseImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'visibility') this.visibility,
      @JsonKey(name: 'access_mode') this.accessMode,
      @JsonKey(name: 'participant_roles') this.participantRoles,
      @JsonKey(name: 'max_participants') this.maxParticipants,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'min_score_to_finish') this.minScoreToFinish,
      @JsonKey(name: 'participant_count_to_finish')
      this.participantCountToFinish,
      @JsonKey(name: 'country') this.country,
      @JsonKey(name: 'country_id') this.countryId,
      @JsonKey(name: 'region') this.region,
      @JsonKey(name: 'district') this.district,
      @JsonKey(name: 'district_id') this.districtId,
      @JsonKey(name: 'is_region_premium') this.isRegionPremium,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'difficulty_percentage') this.difficultyPercentage,
      @JsonKey(name: 'total_questions') this.totalQuestions,
      @JsonKey(name: 'is_bookmarked') this.isBookmarked,
      @JsonKey(name: 'participant_count') this.participantCount,
      @JsonKey(name: 'average_question_difficulty')
      this.averageQuestionDifficulty,
      @JsonKey(name: 'average_completion_time_minutes')
      this.averageCompletionTimeMinutes,
      @JsonKey(name: 'total_correct_attempts') this.totalCorrectAttempts,
      @JsonKey(name: 'total_wrong_attempts') this.totalWrongAttempts});

  factory _$MyQuestionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyQuestionResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user')
  final QuestionUser? user;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'category')
  final QuestionCategory? category;
  @override
  @JsonKey(name: 'visibility')
  final String? visibility;
  @override
  @JsonKey(name: 'access_mode')
  final String? accessMode;
  @override
  @JsonKey(name: 'participant_roles')
  final String? participantRoles;
  @override
  @JsonKey(name: 'max_participants')
  final int? maxParticipants;
// not defined
  @override
  @JsonKey(name: 'start_time')
  final DateTime? startTime;
  @override
  @JsonKey(name: 'end_time')
  final DateTime? endTime;
  @override
  @JsonKey(name: 'min_score_to_finish')
  final int? minScoreToFinish;
  @override
  @JsonKey(name: 'participant_count_to_finish')
  final int? participantCountToFinish;
  @override
  @JsonKey(name: 'country')
  final int? country;
  @override
  @JsonKey(name: 'country_id')
  final int? countryId;
  @override
  @JsonKey(name: 'region')
  final int? region;
  @override
  @JsonKey(name: 'district')
  final int? district;
  @override
  @JsonKey(name: 'district_id')
  final int? districtId;
  @override
  @JsonKey(name: 'is_region_premium')
  final bool? isRegionPremium;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'difficulty_percentage')
  final int? difficultyPercentage;
  @override
  @JsonKey(name: 'total_questions')
  final int? totalQuestions;
// @JsonKey(name: 'questions') String? questions,
  @override
  @JsonKey(name: 'is_bookmarked')
  final bool? isBookmarked;
  @override
  @JsonKey(name: 'participant_count')
  final int? participantCount;
  @override
  @JsonKey(name: 'average_question_difficulty')
  final int? averageQuestionDifficulty;
  @override
  @JsonKey(name: 'average_completion_time_minutes')
  final int? averageCompletionTimeMinutes;
  @override
  @JsonKey(name: 'total_correct_attempts')
  final int? totalCorrectAttempts;
  @override
  @JsonKey(name: 'total_wrong_attempts')
  final int? totalWrongAttempts;

  @override
  String toString() {
    return 'MyBlockResponse(id: $id, user: $user, title: $title, description: $description, category: $category, visibility: $visibility, accessMode: $accessMode, participantRoles: $participantRoles, maxParticipants: $maxParticipants, startTime: $startTime, endTime: $endTime, minScoreToFinish: $minScoreToFinish, participantCountToFinish: $participantCountToFinish, country: $country, countryId: $countryId, region: $region, district: $district, districtId: $districtId, isRegionPremium: $isRegionPremium, createdAt: $createdAt, difficultyPercentage: $difficultyPercentage, totalQuestions: $totalQuestions, isBookmarked: $isBookmarked, participantCount: $participantCount, averageQuestionDifficulty: $averageQuestionDifficulty, averageCompletionTimeMinutes: $averageCompletionTimeMinutes, totalCorrectAttempts: $totalCorrectAttempts, totalWrongAttempts: $totalWrongAttempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyQuestionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.accessMode, accessMode) ||
                other.accessMode == accessMode) &&
            (identical(other.participantRoles, participantRoles) ||
                other.participantRoles == participantRoles) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.minScoreToFinish, minScoreToFinish) ||
                other.minScoreToFinish == minScoreToFinish) &&
            (identical(
                    other.participantCountToFinish, participantCountToFinish) ||
                other.participantCountToFinish == participantCountToFinish) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.isRegionPremium, isRegionPremium) ||
                other.isRegionPremium == isRegionPremium) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.difficultyPercentage, difficultyPercentage) ||
                other.difficultyPercentage == difficultyPercentage) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.participantCount, participantCount) ||
                other.participantCount == participantCount) &&
            (identical(other.averageQuestionDifficulty,
                    averageQuestionDifficulty) ||
                other.averageQuestionDifficulty == averageQuestionDifficulty) &&
            (identical(other.averageCompletionTimeMinutes,
                    averageCompletionTimeMinutes) ||
                other.averageCompletionTimeMinutes ==
                    averageCompletionTimeMinutes) &&
            (identical(other.totalCorrectAttempts, totalCorrectAttempts) ||
                other.totalCorrectAttempts == totalCorrectAttempts) &&
            (identical(other.totalWrongAttempts, totalWrongAttempts) ||
                other.totalWrongAttempts == totalWrongAttempts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        user,
        title,
        description,
        category,
        visibility,
        accessMode,
        participantRoles,
        maxParticipants,
        startTime,
        endTime,
        minScoreToFinish,
        participantCountToFinish,
        country,
        countryId,
        region,
        district,
        districtId,
        isRegionPremium,
        createdAt,
        difficultyPercentage,
        totalQuestions,
        isBookmarked,
        participantCount,
        averageQuestionDifficulty,
        averageCompletionTimeMinutes,
        totalCorrectAttempts,
        totalWrongAttempts
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyQuestionResponseImplCopyWith<_$MyQuestionResponseImpl> get copyWith =>
      __$$MyQuestionResponseImplCopyWithImpl<_$MyQuestionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyQuestionResponseImplToJson(
      this,
    );
  }
}

abstract class _MyQuestionResponse implements MyBlockResponse {
  const factory _MyQuestionResponse(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user') final QuestionUser? user,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'category') final QuestionCategory? category,
      @JsonKey(name: 'visibility') final String? visibility,
      @JsonKey(name: 'access_mode') final String? accessMode,
      @JsonKey(name: 'participant_roles') final String? participantRoles,
      @JsonKey(name: 'max_participants') final int? maxParticipants,
      @JsonKey(name: 'start_time') final DateTime? startTime,
      @JsonKey(name: 'end_time') final DateTime? endTime,
      @JsonKey(name: 'min_score_to_finish') final int? minScoreToFinish,
      @JsonKey(name: 'participant_count_to_finish')
      final int? participantCountToFinish,
      @JsonKey(name: 'country') final int? country,
      @JsonKey(name: 'country_id') final int? countryId,
      @JsonKey(name: 'region') final int? region,
      @JsonKey(name: 'district') final int? district,
      @JsonKey(name: 'district_id') final int? districtId,
      @JsonKey(name: 'is_region_premium') final bool? isRegionPremium,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'difficulty_percentage') final int? difficultyPercentage,
      @JsonKey(name: 'total_questions') final int? totalQuestions,
      @JsonKey(name: 'is_bookmarked') final bool? isBookmarked,
      @JsonKey(name: 'participant_count') final int? participantCount,
      @JsonKey(name: 'average_question_difficulty')
      final int? averageQuestionDifficulty,
      @JsonKey(name: 'average_completion_time_minutes')
      final int? averageCompletionTimeMinutes,
      @JsonKey(name: 'total_correct_attempts') final int? totalCorrectAttempts,
      @JsonKey(name: 'total_wrong_attempts')
      final int? totalWrongAttempts}) = _$MyQuestionResponseImpl;

  factory _MyQuestionResponse.fromJson(Map<String, dynamic> json) =
      _$MyQuestionResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user')
  QuestionUser? get user;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'category')
  QuestionCategory? get category;
  @override
  @JsonKey(name: 'visibility')
  String? get visibility;
  @override
  @JsonKey(name: 'access_mode')
  String? get accessMode;
  @override
  @JsonKey(name: 'participant_roles')
  String? get participantRoles;
  @override
  @JsonKey(name: 'max_participants')
  int? get maxParticipants;
  @override // not defined
  @JsonKey(name: 'start_time')
  DateTime? get startTime;
  @override
  @JsonKey(name: 'end_time')
  DateTime? get endTime;
  @override
  @JsonKey(name: 'min_score_to_finish')
  int? get minScoreToFinish;
  @override
  @JsonKey(name: 'participant_count_to_finish')
  int? get participantCountToFinish;
  @override
  @JsonKey(name: 'country')
  int? get country;
  @override
  @JsonKey(name: 'country_id')
  int? get countryId;
  @override
  @JsonKey(name: 'region')
  int? get region;
  @override
  @JsonKey(name: 'district')
  int? get district;
  @override
  @JsonKey(name: 'district_id')
  int? get districtId;
  @override
  @JsonKey(name: 'is_region_premium')
  bool? get isRegionPremium;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'difficulty_percentage')
  int? get difficultyPercentage;
  @override
  @JsonKey(name: 'total_questions')
  int? get totalQuestions;
  @override // @JsonKey(name: 'questions') String? questions,
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked;
  @override
  @JsonKey(name: 'participant_count')
  int? get participantCount;
  @override
  @JsonKey(name: 'average_question_difficulty')
  int? get averageQuestionDifficulty;
  @override
  @JsonKey(name: 'average_completion_time_minutes')
  int? get averageCompletionTimeMinutes;
  @override
  @JsonKey(name: 'total_correct_attempts')
  int? get totalCorrectAttempts;
  @override
  @JsonKey(name: 'total_wrong_attempts')
  int? get totalWrongAttempts;
  @override
  @JsonKey(ignore: true)
  _$$MyQuestionResponseImplCopyWith<_$MyQuestionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionUser _$QuestionUserFromJson(Map<String, dynamic> json) {
  return _QuestionUser.fromJson(json);
}

/// @nodoc
mixin _$QuestionUser {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_badged')
  bool? get isBadged => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_premium')
  bool? get isPremium => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following')
  bool? get isFollowing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionUserCopyWith<QuestionUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionUserCopyWith<$Res> {
  factory $QuestionUserCopyWith(
          QuestionUser value, $Res Function(QuestionUser) then) =
      _$QuestionUserCopyWithImpl<$Res, QuestionUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'is_badged') bool? isBadged,
      @JsonKey(name: 'is_premium') bool? isPremium,
      @JsonKey(name: 'is_following') bool? isFollowing});
}

/// @nodoc
class _$QuestionUserCopyWithImpl<$Res, $Val extends QuestionUser>
    implements $QuestionUserCopyWith<$Res> {
  _$QuestionUserCopyWithImpl(this._value, this._then);

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
abstract class _$$QuestionUserImplCopyWith<$Res>
    implements $QuestionUserCopyWith<$Res> {
  factory _$$QuestionUserImplCopyWith(
          _$QuestionUserImpl value, $Res Function(_$QuestionUserImpl) then) =
      __$$QuestionUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'is_badged') bool? isBadged,
      @JsonKey(name: 'is_premium') bool? isPremium,
      @JsonKey(name: 'is_following') bool? isFollowing});
}

/// @nodoc
class __$$QuestionUserImplCopyWithImpl<$Res>
    extends _$QuestionUserCopyWithImpl<$Res, _$QuestionUserImpl>
    implements _$$QuestionUserImplCopyWith<$Res> {
  __$$QuestionUserImplCopyWithImpl(
      _$QuestionUserImpl _value, $Res Function(_$QuestionUserImpl) _then)
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
    return _then(_$QuestionUserImpl(
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
class _$QuestionUserImpl implements _QuestionUser {
  const _$QuestionUserImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'profile_image') this.profileImage,
      @JsonKey(name: 'is_badged') this.isBadged,
      @JsonKey(name: 'is_premium') this.isPremium,
      @JsonKey(name: 'is_following') this.isFollowing});

  factory _$QuestionUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionUserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  @JsonKey(name: 'is_badged')
  final bool? isBadged;
  @override
  @JsonKey(name: 'is_premium')
  final bool? isPremium;
  @override
  @JsonKey(name: 'is_following')
  final bool? isFollowing;

  @override
  String toString() {
    return 'QuestionUser(id: $id, username: $username, profileImage: $profileImage, isBadged: $isBadged, isPremium: $isPremium, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionUserImpl &&
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
  _$$QuestionUserImplCopyWith<_$QuestionUserImpl> get copyWith =>
      __$$QuestionUserImplCopyWithImpl<_$QuestionUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionUserImplToJson(
      this,
    );
  }
}

abstract class _QuestionUser implements QuestionUser {
  const factory _QuestionUser(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'username') final String? username,
          @JsonKey(name: 'profile_image') final String? profileImage,
          @JsonKey(name: 'is_badged') final bool? isBadged,
          @JsonKey(name: 'is_premium') final bool? isPremium,
          @JsonKey(name: 'is_following') final bool? isFollowing}) =
      _$QuestionUserImpl;

  factory _QuestionUser.fromJson(Map<String, dynamic> json) =
      _$QuestionUserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  @JsonKey(name: 'is_badged')
  bool? get isBadged;
  @override
  @JsonKey(name: 'is_premium')
  bool? get isPremium;
  @override
  @JsonKey(name: 'is_following')
  bool? get isFollowing;
  @override
  @JsonKey(ignore: true)
  _$$QuestionUserImplCopyWith<_$QuestionUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionCategory _$QuestionCategoryFromJson(Map<String, dynamic> json) {
  return _QuestionCategory.fromJson(json);
}

/// @nodoc
mixin _$QuestionCategory {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tests')
  int? get totalTests => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_questions')
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
  $QuestionCategoryCopyWith<QuestionCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCategoryCopyWith<$Res> {
  factory $QuestionCategoryCopyWith(
          QuestionCategory value, $Res Function(QuestionCategory) then) =
      _$QuestionCategoryCopyWithImpl<$Res, QuestionCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'total_tests') int? totalTests,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'emoji') String? emoji,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class _$QuestionCategoryCopyWithImpl<$Res, $Val extends QuestionCategory>
    implements $QuestionCategoryCopyWith<$Res> {
  _$QuestionCategoryCopyWithImpl(this._value, this._then);

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
abstract class _$$QuestionCategoryImplCopyWith<$Res>
    implements $QuestionCategoryCopyWith<$Res> {
  factory _$$QuestionCategoryImplCopyWith(_$QuestionCategoryImpl value,
          $Res Function(_$QuestionCategoryImpl) then) =
      __$$QuestionCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'total_tests') int? totalTests,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'emoji') String? emoji,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class __$$QuestionCategoryImplCopyWithImpl<$Res>
    extends _$QuestionCategoryCopyWithImpl<$Res, _$QuestionCategoryImpl>
    implements _$$QuestionCategoryImplCopyWith<$Res> {
  __$$QuestionCategoryImplCopyWithImpl(_$QuestionCategoryImpl _value,
      $Res Function(_$QuestionCategoryImpl) _then)
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
    return _then(_$QuestionCategoryImpl(
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
class _$QuestionCategoryImpl implements _QuestionCategory {
  const _$QuestionCategoryImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'total_tests') this.totalTests,
      @JsonKey(name: 'total_questions') this.totalQuestions,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'emoji') this.emoji,
      @JsonKey(name: 'image') this.image});

  factory _$QuestionCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'total_tests')
  final int? totalTests;
  @override
  @JsonKey(name: 'total_questions')
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
    return 'QuestionCategory(id: $id, totalTests: $totalTests, totalQuestions: $totalQuestions, title: $title, slug: $slug, description: $description, emoji: $emoji, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionCategoryImpl &&
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
  _$$QuestionCategoryImplCopyWith<_$QuestionCategoryImpl> get copyWith =>
      __$$QuestionCategoryImplCopyWithImpl<_$QuestionCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionCategoryImplToJson(
      this,
    );
  }
}

abstract class _QuestionCategory implements QuestionCategory {
  const factory _QuestionCategory(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'total_tests') final int? totalTests,
      @JsonKey(name: 'total_questions') final int? totalQuestions,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'slug') final String? slug,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'emoji') final String? emoji,
      @JsonKey(name: 'image') final String? image}) = _$QuestionCategoryImpl;

  factory _QuestionCategory.fromJson(Map<String, dynamic> json) =
      _$QuestionCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'total_tests')
  int? get totalTests;
  @override
  @JsonKey(name: 'total_questions')
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
  _$$QuestionCategoryImplCopyWith<_$QuestionCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
