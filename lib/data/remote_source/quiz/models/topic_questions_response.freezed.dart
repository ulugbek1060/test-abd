// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_questions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopicQuestionsResponse _$TopicQuestionsResponseFromJson(
    Map<String, dynamic> json) {
  return _TopicQuestionsResponse.fromJson(json);
}

/// @nodoc
mixin _$TopicQuestionsResponse {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'next')
  String? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous')
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  List<TopicTestItemResponse> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicQuestionsResponseCopyWith<TopicQuestionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicQuestionsResponseCopyWith<$Res> {
  factory $TopicQuestionsResponseCopyWith(TopicQuestionsResponse value,
          $Res Function(TopicQuestionsResponse) then) =
      _$TopicQuestionsResponseCopyWithImpl<$Res, TopicQuestionsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'previous') String? previous,
      @JsonKey(name: 'results') List<TopicTestItemResponse> results});
}

/// @nodoc
class _$TopicQuestionsResponseCopyWithImpl<$Res,
        $Val extends TopicQuestionsResponse>
    implements $TopicQuestionsResponseCopyWith<$Res> {
  _$TopicQuestionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TopicTestItemResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicQuestionsResponseImplCopyWith<$Res>
    implements $TopicQuestionsResponseCopyWith<$Res> {
  factory _$$TopicQuestionsResponseImplCopyWith(
          _$TopicQuestionsResponseImpl value,
          $Res Function(_$TopicQuestionsResponseImpl) then) =
      __$$TopicQuestionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'previous') String? previous,
      @JsonKey(name: 'results') List<TopicTestItemResponse> results});
}

/// @nodoc
class __$$TopicQuestionsResponseImplCopyWithImpl<$Res>
    extends _$TopicQuestionsResponseCopyWithImpl<$Res,
        _$TopicQuestionsResponseImpl>
    implements _$$TopicQuestionsResponseImplCopyWith<$Res> {
  __$$TopicQuestionsResponseImplCopyWithImpl(
      _$TopicQuestionsResponseImpl _value,
      $Res Function(_$TopicQuestionsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$TopicQuestionsResponseImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TopicTestItemResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicQuestionsResponseImpl implements _TopicQuestionsResponse {
  const _$TopicQuestionsResponseImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'next') this.next,
      @JsonKey(name: 'previous') this.previous,
      @JsonKey(name: 'results')
      final List<TopicTestItemResponse> results = const []})
      : _results = results;

  factory _$TopicQuestionsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicQuestionsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'next')
  final String? next;
  @override
  @JsonKey(name: 'previous')
  final String? previous;
  final List<TopicTestItemResponse> _results;
  @override
  @JsonKey(name: 'results')
  List<TopicTestItemResponse> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'TopicQuestionsResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicQuestionsResponseImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicQuestionsResponseImplCopyWith<_$TopicQuestionsResponseImpl>
      get copyWith => __$$TopicQuestionsResponseImplCopyWithImpl<
          _$TopicQuestionsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicQuestionsResponseImplToJson(
      this,
    );
  }
}

abstract class _TopicQuestionsResponse implements TopicQuestionsResponse {
  const factory _TopicQuestionsResponse(
          {@JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'next') final String? next,
          @JsonKey(name: 'previous') final String? previous,
          @JsonKey(name: 'results')
          final List<TopicTestItemResponse> results}) =
      _$TopicQuestionsResponseImpl;

  factory _TopicQuestionsResponse.fromJson(Map<String, dynamic> json) =
      _$TopicQuestionsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'next')
  String? get next;
  @override
  @JsonKey(name: 'previous')
  String? get previous;
  @override
  @JsonKey(name: 'results')
  List<TopicTestItemResponse> get results;
  @override
  @JsonKey(ignore: true)
  _$$TopicQuestionsResponseImplCopyWith<_$TopicQuestionsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TopicTestItemResponse _$TopicTestItemResponseFromJson(
    Map<String, dynamic> json) {
  return _TopicTestItemResponse.fromJson(json);
}

/// @nodoc
mixin _$TopicTestItemResponse {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  TopicUserResponse? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  TopicCategoryResponse? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'visibility')
  String? get visibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_mode')
  String? get accessMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_roles')
  String? get participantRoles => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_participants')
  int? get maxParticipants => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_score_to_finish')
  int? get minScoreToFinish => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_count_to_finish')
  int? get participantCountToFinish => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  int? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'region')
  int? get region => throw _privateConstructorUsedError;
  @JsonKey(name: 'district')
  int? get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_region_premium')
  bool? get isRegionPremium => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_percentage')
  double? get difficultyPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_questions')
  int? get totalQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions')
  List<TopicQuestionResponse> get questions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_count')
  int? get participantCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_question_difficulty')
  double? get averageQuestionDifficulty => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_completion_time_minutes')
  double? get averageCompletionTimeMinutes =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'total_correct_attempts')
  int? get totalCorrectAttempts => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_wrong_attempts')
  int? get totalWrongAttempts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicTestItemResponseCopyWith<TopicTestItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicTestItemResponseCopyWith<$Res> {
  factory $TopicTestItemResponseCopyWith(TopicTestItemResponse value,
          $Res Function(TopicTestItemResponse) then) =
      _$TopicTestItemResponseCopyWithImpl<$Res, TopicTestItemResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user') TopicUserResponse? user,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'category') TopicCategoryResponse? category,
      @JsonKey(name: 'visibility') String? visibility,
      @JsonKey(name: 'access_mode') String? accessMode,
      @JsonKey(name: 'participant_roles') String? participantRoles,
      @JsonKey(name: 'max_participants') int? maxParticipants,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'min_score_to_finish') int? minScoreToFinish,
      @JsonKey(name: 'participant_count_to_finish')
      int? participantCountToFinish,
      @JsonKey(name: 'country') int? country,
      @JsonKey(name: 'region') int? region,
      @JsonKey(name: 'district') int? district,
      @JsonKey(name: 'is_region_premium') bool? isRegionPremium,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'difficulty_percentage') double? difficultyPercentage,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      @JsonKey(name: 'questions') List<TopicQuestionResponse> questions,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      @JsonKey(name: 'participant_count') int? participantCount,
      @JsonKey(name: 'average_question_difficulty')
      double? averageQuestionDifficulty,
      @JsonKey(name: 'average_completion_time_minutes')
      double? averageCompletionTimeMinutes,
      @JsonKey(name: 'total_correct_attempts') int? totalCorrectAttempts,
      @JsonKey(name: 'total_wrong_attempts') int? totalWrongAttempts});

  $TopicUserResponseCopyWith<$Res>? get user;
  $TopicCategoryResponseCopyWith<$Res>? get category;
}

/// @nodoc
class _$TopicTestItemResponseCopyWithImpl<$Res,
        $Val extends TopicTestItemResponse>
    implements $TopicTestItemResponseCopyWith<$Res> {
  _$TopicTestItemResponseCopyWithImpl(this._value, this._then);

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
    Object? region = freezed,
    Object? district = freezed,
    Object? isRegionPremium = freezed,
    Object? createdAt = freezed,
    Object? difficultyPercentage = freezed,
    Object? totalQuestions = freezed,
    Object? questions = null,
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
              as TopicUserResponse?,
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
              as TopicCategoryResponse?,
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
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
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
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as int?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int?,
      isRegionPremium: freezed == isRegionPremium
          ? _value.isRegionPremium
          : isRegionPremium // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      difficultyPercentage: freezed == difficultyPercentage
          ? _value.difficultyPercentage
          : difficultyPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<TopicQuestionResponse>,
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
              as double?,
      averageCompletionTimeMinutes: freezed == averageCompletionTimeMinutes
          ? _value.averageCompletionTimeMinutes
          : averageCompletionTimeMinutes // ignore: cast_nullable_to_non_nullable
              as double?,
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
  $TopicUserResponseCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $TopicUserResponseCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TopicCategoryResponseCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $TopicCategoryResponseCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TopicTestItemResponseImplCopyWith<$Res>
    implements $TopicTestItemResponseCopyWith<$Res> {
  factory _$$TopicTestItemResponseImplCopyWith(
          _$TopicTestItemResponseImpl value,
          $Res Function(_$TopicTestItemResponseImpl) then) =
      __$$TopicTestItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user') TopicUserResponse? user,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'category') TopicCategoryResponse? category,
      @JsonKey(name: 'visibility') String? visibility,
      @JsonKey(name: 'access_mode') String? accessMode,
      @JsonKey(name: 'participant_roles') String? participantRoles,
      @JsonKey(name: 'max_participants') int? maxParticipants,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'min_score_to_finish') int? minScoreToFinish,
      @JsonKey(name: 'participant_count_to_finish')
      int? participantCountToFinish,
      @JsonKey(name: 'country') int? country,
      @JsonKey(name: 'region') int? region,
      @JsonKey(name: 'district') int? district,
      @JsonKey(name: 'is_region_premium') bool? isRegionPremium,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'difficulty_percentage') double? difficultyPercentage,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      @JsonKey(name: 'questions') List<TopicQuestionResponse> questions,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      @JsonKey(name: 'participant_count') int? participantCount,
      @JsonKey(name: 'average_question_difficulty')
      double? averageQuestionDifficulty,
      @JsonKey(name: 'average_completion_time_minutes')
      double? averageCompletionTimeMinutes,
      @JsonKey(name: 'total_correct_attempts') int? totalCorrectAttempts,
      @JsonKey(name: 'total_wrong_attempts') int? totalWrongAttempts});

  @override
  $TopicUserResponseCopyWith<$Res>? get user;
  @override
  $TopicCategoryResponseCopyWith<$Res>? get category;
}

/// @nodoc
class __$$TopicTestItemResponseImplCopyWithImpl<$Res>
    extends _$TopicTestItemResponseCopyWithImpl<$Res,
        _$TopicTestItemResponseImpl>
    implements _$$TopicTestItemResponseImplCopyWith<$Res> {
  __$$TopicTestItemResponseImplCopyWithImpl(_$TopicTestItemResponseImpl _value,
      $Res Function(_$TopicTestItemResponseImpl) _then)
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
    Object? region = freezed,
    Object? district = freezed,
    Object? isRegionPremium = freezed,
    Object? createdAt = freezed,
    Object? difficultyPercentage = freezed,
    Object? totalQuestions = freezed,
    Object? questions = null,
    Object? isBookmarked = freezed,
    Object? participantCount = freezed,
    Object? averageQuestionDifficulty = freezed,
    Object? averageCompletionTimeMinutes = freezed,
    Object? totalCorrectAttempts = freezed,
    Object? totalWrongAttempts = freezed,
  }) {
    return _then(_$TopicTestItemResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as TopicUserResponse?,
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
              as TopicCategoryResponse?,
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
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
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
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as int?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int?,
      isRegionPremium: freezed == isRegionPremium
          ? _value.isRegionPremium
          : isRegionPremium // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      difficultyPercentage: freezed == difficultyPercentage
          ? _value.difficultyPercentage
          : difficultyPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<TopicQuestionResponse>,
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
              as double?,
      averageCompletionTimeMinutes: freezed == averageCompletionTimeMinutes
          ? _value.averageCompletionTimeMinutes
          : averageCompletionTimeMinutes // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$TopicTestItemResponseImpl implements _TopicTestItemResponse {
  const _$TopicTestItemResponseImpl(
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
      @JsonKey(name: 'region') this.region,
      @JsonKey(name: 'district') this.district,
      @JsonKey(name: 'is_region_premium') this.isRegionPremium,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'difficulty_percentage') this.difficultyPercentage,
      @JsonKey(name: 'total_questions') this.totalQuestions,
      @JsonKey(name: 'questions')
      final List<TopicQuestionResponse> questions = const [],
      @JsonKey(name: 'is_bookmarked') this.isBookmarked,
      @JsonKey(name: 'participant_count') this.participantCount,
      @JsonKey(name: 'average_question_difficulty')
      this.averageQuestionDifficulty,
      @JsonKey(name: 'average_completion_time_minutes')
      this.averageCompletionTimeMinutes,
      @JsonKey(name: 'total_correct_attempts') this.totalCorrectAttempts,
      @JsonKey(name: 'total_wrong_attempts') this.totalWrongAttempts})
      : _questions = questions;

  factory _$TopicTestItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicTestItemResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user')
  final TopicUserResponse? user;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'category')
  final TopicCategoryResponse? category;
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
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
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
  @JsonKey(name: 'region')
  final int? region;
  @override
  @JsonKey(name: 'district')
  final int? district;
  @override
  @JsonKey(name: 'is_region_premium')
  final bool? isRegionPremium;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'difficulty_percentage')
  final double? difficultyPercentage;
  @override
  @JsonKey(name: 'total_questions')
  final int? totalQuestions;
  final List<TopicQuestionResponse> _questions;
  @override
  @JsonKey(name: 'questions')
  List<TopicQuestionResponse> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  @JsonKey(name: 'is_bookmarked')
  final bool? isBookmarked;
  @override
  @JsonKey(name: 'participant_count')
  final int? participantCount;
  @override
  @JsonKey(name: 'average_question_difficulty')
  final double? averageQuestionDifficulty;
  @override
  @JsonKey(name: 'average_completion_time_minutes')
  final double? averageCompletionTimeMinutes;
  @override
  @JsonKey(name: 'total_correct_attempts')
  final int? totalCorrectAttempts;
  @override
  @JsonKey(name: 'total_wrong_attempts')
  final int? totalWrongAttempts;

  @override
  String toString() {
    return 'TopicTestItemResponse(id: $id, user: $user, title: $title, description: $description, category: $category, visibility: $visibility, accessMode: $accessMode, participantRoles: $participantRoles, maxParticipants: $maxParticipants, startTime: $startTime, endTime: $endTime, minScoreToFinish: $minScoreToFinish, participantCountToFinish: $participantCountToFinish, country: $country, region: $region, district: $district, isRegionPremium: $isRegionPremium, createdAt: $createdAt, difficultyPercentage: $difficultyPercentage, totalQuestions: $totalQuestions, questions: $questions, isBookmarked: $isBookmarked, participantCount: $participantCount, averageQuestionDifficulty: $averageQuestionDifficulty, averageCompletionTimeMinutes: $averageCompletionTimeMinutes, totalCorrectAttempts: $totalCorrectAttempts, totalWrongAttempts: $totalWrongAttempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicTestItemResponseImpl &&
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
            (identical(other.region, region) || other.region == region) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.isRegionPremium, isRegionPremium) ||
                other.isRegionPremium == isRegionPremium) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.difficultyPercentage, difficultyPercentage) ||
                other.difficultyPercentage == difficultyPercentage) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
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
        region,
        district,
        isRegionPremium,
        createdAt,
        difficultyPercentage,
        totalQuestions,
        const DeepCollectionEquality().hash(_questions),
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
  _$$TopicTestItemResponseImplCopyWith<_$TopicTestItemResponseImpl>
      get copyWith => __$$TopicTestItemResponseImplCopyWithImpl<
          _$TopicTestItemResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicTestItemResponseImplToJson(
      this,
    );
  }
}

abstract class _TopicTestItemResponse implements TopicTestItemResponse {
  const factory _TopicTestItemResponse(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user') final TopicUserResponse? user,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'category') final TopicCategoryResponse? category,
      @JsonKey(name: 'visibility') final String? visibility,
      @JsonKey(name: 'access_mode') final String? accessMode,
      @JsonKey(name: 'participant_roles') final String? participantRoles,
      @JsonKey(name: 'max_participants') final int? maxParticipants,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      @JsonKey(name: 'min_score_to_finish') final int? minScoreToFinish,
      @JsonKey(name: 'participant_count_to_finish')
      final int? participantCountToFinish,
      @JsonKey(name: 'country') final int? country,
      @JsonKey(name: 'region') final int? region,
      @JsonKey(name: 'district') final int? district,
      @JsonKey(name: 'is_region_premium') final bool? isRegionPremium,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'difficulty_percentage')
      final double? difficultyPercentage,
      @JsonKey(name: 'total_questions') final int? totalQuestions,
      @JsonKey(name: 'questions') final List<TopicQuestionResponse> questions,
      @JsonKey(name: 'is_bookmarked') final bool? isBookmarked,
      @JsonKey(name: 'participant_count') final int? participantCount,
      @JsonKey(name: 'average_question_difficulty')
      final double? averageQuestionDifficulty,
      @JsonKey(name: 'average_completion_time_minutes')
      final double? averageCompletionTimeMinutes,
      @JsonKey(name: 'total_correct_attempts') final int? totalCorrectAttempts,
      @JsonKey(name: 'total_wrong_attempts')
      final int? totalWrongAttempts}) = _$TopicTestItemResponseImpl;

  factory _TopicTestItemResponse.fromJson(Map<String, dynamic> json) =
      _$TopicTestItemResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user')
  TopicUserResponse? get user;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'category')
  TopicCategoryResponse? get category;
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
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
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
  @JsonKey(name: 'region')
  int? get region;
  @override
  @JsonKey(name: 'district')
  int? get district;
  @override
  @JsonKey(name: 'is_region_premium')
  bool? get isRegionPremium;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'difficulty_percentage')
  double? get difficultyPercentage;
  @override
  @JsonKey(name: 'total_questions')
  int? get totalQuestions;
  @override
  @JsonKey(name: 'questions')
  List<TopicQuestionResponse> get questions;
  @override
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked;
  @override
  @JsonKey(name: 'participant_count')
  int? get participantCount;
  @override
  @JsonKey(name: 'average_question_difficulty')
  double? get averageQuestionDifficulty;
  @override
  @JsonKey(name: 'average_completion_time_minutes')
  double? get averageCompletionTimeMinutes;
  @override
  @JsonKey(name: 'total_correct_attempts')
  int? get totalCorrectAttempts;
  @override
  @JsonKey(name: 'total_wrong_attempts')
  int? get totalWrongAttempts;
  @override
  @JsonKey(ignore: true)
  _$$TopicTestItemResponseImplCopyWith<_$TopicTestItemResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TopicUserResponse _$TopicUserResponseFromJson(Map<String, dynamic> json) {
  return _TopicUserResponse.fromJson(json);
}

/// @nodoc
mixin _$TopicUserResponse {
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
  $TopicUserResponseCopyWith<TopicUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicUserResponseCopyWith<$Res> {
  factory $TopicUserResponseCopyWith(
          TopicUserResponse value, $Res Function(TopicUserResponse) then) =
      _$TopicUserResponseCopyWithImpl<$Res, TopicUserResponse>;
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
class _$TopicUserResponseCopyWithImpl<$Res, $Val extends TopicUserResponse>
    implements $TopicUserResponseCopyWith<$Res> {
  _$TopicUserResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$TopicUserResponseImplCopyWith<$Res>
    implements $TopicUserResponseCopyWith<$Res> {
  factory _$$TopicUserResponseImplCopyWith(_$TopicUserResponseImpl value,
          $Res Function(_$TopicUserResponseImpl) then) =
      __$$TopicUserResponseImplCopyWithImpl<$Res>;
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
class __$$TopicUserResponseImplCopyWithImpl<$Res>
    extends _$TopicUserResponseCopyWithImpl<$Res, _$TopicUserResponseImpl>
    implements _$$TopicUserResponseImplCopyWith<$Res> {
  __$$TopicUserResponseImplCopyWithImpl(_$TopicUserResponseImpl _value,
      $Res Function(_$TopicUserResponseImpl) _then)
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
    return _then(_$TopicUserResponseImpl(
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
class _$TopicUserResponseImpl implements _TopicUserResponse {
  const _$TopicUserResponseImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'profile_image') this.profileImage,
      @JsonKey(name: 'is_badged') this.isBadged,
      @JsonKey(name: 'is_premium') this.isPremium,
      @JsonKey(name: 'is_following') this.isFollowing});

  factory _$TopicUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicUserResponseImplFromJson(json);

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
    return 'TopicUserResponse(id: $id, username: $username, profileImage: $profileImage, isBadged: $isBadged, isPremium: $isPremium, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicUserResponseImpl &&
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
  _$$TopicUserResponseImplCopyWith<_$TopicUserResponseImpl> get copyWith =>
      __$$TopicUserResponseImplCopyWithImpl<_$TopicUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicUserResponseImplToJson(
      this,
    );
  }
}

abstract class _TopicUserResponse implements TopicUserResponse {
  const factory _TopicUserResponse(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'username') final String? username,
          @JsonKey(name: 'profile_image') final String? profileImage,
          @JsonKey(name: 'is_badged') final bool? isBadged,
          @JsonKey(name: 'is_premium') final bool? isPremium,
          @JsonKey(name: 'is_following') final bool? isFollowing}) =
      _$TopicUserResponseImpl;

  factory _TopicUserResponse.fromJson(Map<String, dynamic> json) =
      _$TopicUserResponseImpl.fromJson;

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
  _$$TopicUserResponseImplCopyWith<_$TopicUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopicCategoryResponse _$TopicCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _TopicCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$TopicCategoryResponse {
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
  $TopicCategoryResponseCopyWith<TopicCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicCategoryResponseCopyWith<$Res> {
  factory $TopicCategoryResponseCopyWith(TopicCategoryResponse value,
          $Res Function(TopicCategoryResponse) then) =
      _$TopicCategoryResponseCopyWithImpl<$Res, TopicCategoryResponse>;
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
class _$TopicCategoryResponseCopyWithImpl<$Res,
        $Val extends TopicCategoryResponse>
    implements $TopicCategoryResponseCopyWith<$Res> {
  _$TopicCategoryResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$TopicCategoryResponseImplCopyWith<$Res>
    implements $TopicCategoryResponseCopyWith<$Res> {
  factory _$$TopicCategoryResponseImplCopyWith(
          _$TopicCategoryResponseImpl value,
          $Res Function(_$TopicCategoryResponseImpl) then) =
      __$$TopicCategoryResponseImplCopyWithImpl<$Res>;
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
class __$$TopicCategoryResponseImplCopyWithImpl<$Res>
    extends _$TopicCategoryResponseCopyWithImpl<$Res,
        _$TopicCategoryResponseImpl>
    implements _$$TopicCategoryResponseImplCopyWith<$Res> {
  __$$TopicCategoryResponseImplCopyWithImpl(_$TopicCategoryResponseImpl _value,
      $Res Function(_$TopicCategoryResponseImpl) _then)
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
    return _then(_$TopicCategoryResponseImpl(
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
class _$TopicCategoryResponseImpl implements _TopicCategoryResponse {
  const _$TopicCategoryResponseImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'total_tests') this.totalTests,
      @JsonKey(name: 'total_questions') this.totalQuestions,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'emoji') this.emoji,
      @JsonKey(name: 'image') this.image});

  factory _$TopicCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicCategoryResponseImplFromJson(json);

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
    return 'TopicCategoryResponse(id: $id, totalTests: $totalTests, totalQuestions: $totalQuestions, title: $title, slug: $slug, description: $description, emoji: $emoji, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicCategoryResponseImpl &&
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
  _$$TopicCategoryResponseImplCopyWith<_$TopicCategoryResponseImpl>
      get copyWith => __$$TopicCategoryResponseImplCopyWithImpl<
          _$TopicCategoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _TopicCategoryResponse implements TopicCategoryResponse {
  const factory _TopicCategoryResponse(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'total_tests') final int? totalTests,
          @JsonKey(name: 'total_questions') final int? totalQuestions,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'slug') final String? slug,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'emoji') final String? emoji,
          @JsonKey(name: 'image') final String? image}) =
      _$TopicCategoryResponseImpl;

  factory _TopicCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$TopicCategoryResponseImpl.fromJson;

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
  _$$TopicCategoryResponseImplCopyWith<_$TopicCategoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TopicQuestionResponse _$TopicQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return _TopicQuestionResponse.fromJson(json);
}

/// @nodoc
mixin _$TopicQuestionResponse {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'test')
  int? get test => throw _privateConstructorUsedError;
  @JsonKey(name: 'test_title')
  String? get testTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_index')
  int? get orderIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  String? get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'answers')
  List<TopicAnswerResponse> get answers => throw _privateConstructorUsedError;
  @JsonKey(name: 'test_description')
  String? get testDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer_text')
  String? get correctAnswerText => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_language')
  String? get answerLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_count')
  int? get correctCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'wrong_count')
  int? get wrongCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_percentage')
  double? get difficultyPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_attempt_count')
  int? get userAttemptCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  TopicUserResponse? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'round_image')
  String? get roundImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following')
  bool? get isFollowing => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  TopicCategoryResponse? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicQuestionResponseCopyWith<TopicQuestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicQuestionResponseCopyWith<$Res> {
  factory $TopicQuestionResponseCopyWith(TopicQuestionResponse value,
          $Res Function(TopicQuestionResponse) then) =
      _$TopicQuestionResponseCopyWithImpl<$Res, TopicQuestionResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'test') int? test,
      @JsonKey(name: 'test_title') String? testTitle,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'order_index') int? orderIndex,
      @JsonKey(name: 'media') String? media,
      @JsonKey(name: 'answers') List<TopicAnswerResponse> answers,
      @JsonKey(name: 'test_description') String? testDescription,
      @JsonKey(name: 'correct_answer_text') String? correctAnswerText,
      @JsonKey(name: 'answer_language') String? answerLanguage,
      @JsonKey(name: 'correct_count') int? correctCount,
      @JsonKey(name: 'wrong_count') int? wrongCount,
      @JsonKey(name: 'difficulty_percentage') double? difficultyPercentage,
      @JsonKey(name: 'user_attempt_count') int? userAttemptCount,
      @JsonKey(name: 'user') TopicUserResponse? user,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'round_image') String? roundImage,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      @JsonKey(name: 'is_following') bool? isFollowing,
      @JsonKey(name: 'category') TopicCategoryResponse? category});

  $TopicUserResponseCopyWith<$Res>? get user;
  $TopicCategoryResponseCopyWith<$Res>? get category;
}

/// @nodoc
class _$TopicQuestionResponseCopyWithImpl<$Res,
        $Val extends TopicQuestionResponse>
    implements $TopicQuestionResponseCopyWith<$Res> {
  _$TopicQuestionResponseCopyWithImpl(this._value, this._then);

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
              as List<TopicAnswerResponse>,
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
              as TopicUserResponse?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as TopicCategoryResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TopicUserResponseCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $TopicUserResponseCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TopicCategoryResponseCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $TopicCategoryResponseCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TopicQuestionResponseImplCopyWith<$Res>
    implements $TopicQuestionResponseCopyWith<$Res> {
  factory _$$TopicQuestionResponseImplCopyWith(
          _$TopicQuestionResponseImpl value,
          $Res Function(_$TopicQuestionResponseImpl) then) =
      __$$TopicQuestionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'test') int? test,
      @JsonKey(name: 'test_title') String? testTitle,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'order_index') int? orderIndex,
      @JsonKey(name: 'media') String? media,
      @JsonKey(name: 'answers') List<TopicAnswerResponse> answers,
      @JsonKey(name: 'test_description') String? testDescription,
      @JsonKey(name: 'correct_answer_text') String? correctAnswerText,
      @JsonKey(name: 'answer_language') String? answerLanguage,
      @JsonKey(name: 'correct_count') int? correctCount,
      @JsonKey(name: 'wrong_count') int? wrongCount,
      @JsonKey(name: 'difficulty_percentage') double? difficultyPercentage,
      @JsonKey(name: 'user_attempt_count') int? userAttemptCount,
      @JsonKey(name: 'user') TopicUserResponse? user,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'round_image') String? roundImage,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      @JsonKey(name: 'is_following') bool? isFollowing,
      @JsonKey(name: 'category') TopicCategoryResponse? category});

  @override
  $TopicUserResponseCopyWith<$Res>? get user;
  @override
  $TopicCategoryResponseCopyWith<$Res>? get category;
}

/// @nodoc
class __$$TopicQuestionResponseImplCopyWithImpl<$Res>
    extends _$TopicQuestionResponseCopyWithImpl<$Res,
        _$TopicQuestionResponseImpl>
    implements _$$TopicQuestionResponseImplCopyWith<$Res> {
  __$$TopicQuestionResponseImplCopyWithImpl(_$TopicQuestionResponseImpl _value,
      $Res Function(_$TopicQuestionResponseImpl) _then)
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
    return _then(_$TopicQuestionResponseImpl(
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
              as List<TopicAnswerResponse>,
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
              as TopicUserResponse?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as TopicCategoryResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicQuestionResponseImpl implements _TopicQuestionResponse {
  const _$TopicQuestionResponseImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'test') this.test,
      @JsonKey(name: 'test_title') this.testTitle,
      @JsonKey(name: 'question_text') this.questionText,
      @JsonKey(name: 'question_type') this.questionType,
      @JsonKey(name: 'order_index') this.orderIndex,
      @JsonKey(name: 'media') this.media,
      @JsonKey(name: 'answers')
      final List<TopicAnswerResponse> answers = const [],
      @JsonKey(name: 'test_description') this.testDescription,
      @JsonKey(name: 'correct_answer_text') this.correctAnswerText,
      @JsonKey(name: 'answer_language') this.answerLanguage,
      @JsonKey(name: 'correct_count') this.correctCount,
      @JsonKey(name: 'wrong_count') this.wrongCount,
      @JsonKey(name: 'difficulty_percentage') this.difficultyPercentage,
      @JsonKey(name: 'user_attempt_count') this.userAttemptCount,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'round_image') this.roundImage,
      @JsonKey(name: 'is_bookmarked') this.isBookmarked,
      @JsonKey(name: 'is_following') this.isFollowing,
      @JsonKey(name: 'category') this.category})
      : _answers = answers;

  factory _$TopicQuestionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicQuestionResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'test')
  final int? test;
  @override
  @JsonKey(name: 'test_title')
  final String? testTitle;
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
  @JsonKey(name: 'media')
  final String? media;
  final List<TopicAnswerResponse> _answers;
  @override
  @JsonKey(name: 'answers')
  List<TopicAnswerResponse> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey(name: 'test_description')
  final String? testDescription;
  @override
  @JsonKey(name: 'correct_answer_text')
  final String? correctAnswerText;
  @override
  @JsonKey(name: 'answer_language')
  final String? answerLanguage;
  @override
  @JsonKey(name: 'correct_count')
  final int? correctCount;
  @override
  @JsonKey(name: 'wrong_count')
  final int? wrongCount;
  @override
  @JsonKey(name: 'difficulty_percentage')
  final double? difficultyPercentage;
  @override
  @JsonKey(name: 'user_attempt_count')
  final int? userAttemptCount;
  @override
  @JsonKey(name: 'user')
  final TopicUserResponse? user;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'round_image')
  final String? roundImage;
  @override
  @JsonKey(name: 'is_bookmarked')
  final bool? isBookmarked;
  @override
  @JsonKey(name: 'is_following')
  final bool? isFollowing;
  @override
  @JsonKey(name: 'category')
  final TopicCategoryResponse? category;

  @override
  String toString() {
    return 'TopicQuestionResponse(id: $id, test: $test, testTitle: $testTitle, questionText: $questionText, questionType: $questionType, orderIndex: $orderIndex, media: $media, answers: $answers, testDescription: $testDescription, correctAnswerText: $correctAnswerText, answerLanguage: $answerLanguage, correctCount: $correctCount, wrongCount: $wrongCount, difficultyPercentage: $difficultyPercentage, userAttemptCount: $userAttemptCount, user: $user, createdAt: $createdAt, roundImage: $roundImage, isBookmarked: $isBookmarked, isFollowing: $isFollowing, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicQuestionResponseImpl &&
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
  _$$TopicQuestionResponseImplCopyWith<_$TopicQuestionResponseImpl>
      get copyWith => __$$TopicQuestionResponseImplCopyWithImpl<
          _$TopicQuestionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicQuestionResponseImplToJson(
      this,
    );
  }
}

abstract class _TopicQuestionResponse implements TopicQuestionResponse {
  const factory _TopicQuestionResponse(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'test') final int? test,
          @JsonKey(name: 'test_title') final String? testTitle,
          @JsonKey(name: 'question_text') final String? questionText,
          @JsonKey(name: 'question_type') final String? questionType,
          @JsonKey(name: 'order_index') final int? orderIndex,
          @JsonKey(name: 'media') final String? media,
          @JsonKey(name: 'answers') final List<TopicAnswerResponse> answers,
          @JsonKey(name: 'test_description') final String? testDescription,
          @JsonKey(name: 'correct_answer_text') final String? correctAnswerText,
          @JsonKey(name: 'answer_language') final String? answerLanguage,
          @JsonKey(name: 'correct_count') final int? correctCount,
          @JsonKey(name: 'wrong_count') final int? wrongCount,
          @JsonKey(name: 'difficulty_percentage')
          final double? difficultyPercentage,
          @JsonKey(name: 'user_attempt_count') final int? userAttemptCount,
          @JsonKey(name: 'user') final TopicUserResponse? user,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'round_image') final String? roundImage,
          @JsonKey(name: 'is_bookmarked') final bool? isBookmarked,
          @JsonKey(name: 'is_following') final bool? isFollowing,
          @JsonKey(name: 'category') final TopicCategoryResponse? category}) =
      _$TopicQuestionResponseImpl;

  factory _TopicQuestionResponse.fromJson(Map<String, dynamic> json) =
      _$TopicQuestionResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'test')
  int? get test;
  @override
  @JsonKey(name: 'test_title')
  String? get testTitle;
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
  @JsonKey(name: 'media')
  String? get media;
  @override
  @JsonKey(name: 'answers')
  List<TopicAnswerResponse> get answers;
  @override
  @JsonKey(name: 'test_description')
  String? get testDescription;
  @override
  @JsonKey(name: 'correct_answer_text')
  String? get correctAnswerText;
  @override
  @JsonKey(name: 'answer_language')
  String? get answerLanguage;
  @override
  @JsonKey(name: 'correct_count')
  int? get correctCount;
  @override
  @JsonKey(name: 'wrong_count')
  int? get wrongCount;
  @override
  @JsonKey(name: 'difficulty_percentage')
  double? get difficultyPercentage;
  @override
  @JsonKey(name: 'user_attempt_count')
  int? get userAttemptCount;
  @override
  @JsonKey(name: 'user')
  TopicUserResponse? get user;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'round_image')
  String? get roundImage;
  @override
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked;
  @override
  @JsonKey(name: 'is_following')
  bool? get isFollowing;
  @override
  @JsonKey(name: 'category')
  TopicCategoryResponse? get category;
  @override
  @JsonKey(ignore: true)
  _$$TopicQuestionResponseImplCopyWith<_$TopicQuestionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TopicAnswerResponse _$TopicAnswerResponseFromJson(Map<String, dynamic> json) {
  return _TopicAnswerResponse.fromJson(json);
}

/// @nodoc
mixin _$TopicAnswerResponse {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'letter')
  String? get letter => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_text')
  String? get answerText => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool? get isCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicAnswerResponseCopyWith<TopicAnswerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicAnswerResponseCopyWith<$Res> {
  factory $TopicAnswerResponseCopyWith(
          TopicAnswerResponse value, $Res Function(TopicAnswerResponse) then) =
      _$TopicAnswerResponseCopyWithImpl<$Res, TopicAnswerResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'letter') String? letter,
      @JsonKey(name: 'answer_text') String? answerText,
      @JsonKey(name: 'is_correct') bool? isCorrect});
}

/// @nodoc
class _$TopicAnswerResponseCopyWithImpl<$Res, $Val extends TopicAnswerResponse>
    implements $TopicAnswerResponseCopyWith<$Res> {
  _$TopicAnswerResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$TopicAnswerResponseImplCopyWith<$Res>
    implements $TopicAnswerResponseCopyWith<$Res> {
  factory _$$TopicAnswerResponseImplCopyWith(_$TopicAnswerResponseImpl value,
          $Res Function(_$TopicAnswerResponseImpl) then) =
      __$$TopicAnswerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'letter') String? letter,
      @JsonKey(name: 'answer_text') String? answerText,
      @JsonKey(name: 'is_correct') bool? isCorrect});
}

/// @nodoc
class __$$TopicAnswerResponseImplCopyWithImpl<$Res>
    extends _$TopicAnswerResponseCopyWithImpl<$Res, _$TopicAnswerResponseImpl>
    implements _$$TopicAnswerResponseImplCopyWith<$Res> {
  __$$TopicAnswerResponseImplCopyWithImpl(_$TopicAnswerResponseImpl _value,
      $Res Function(_$TopicAnswerResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? letter = freezed,
    Object? answerText = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_$TopicAnswerResponseImpl(
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
class _$TopicAnswerResponseImpl implements _TopicAnswerResponse {
  const _$TopicAnswerResponseImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'letter') this.letter,
      @JsonKey(name: 'answer_text') this.answerText,
      @JsonKey(name: 'is_correct') this.isCorrect});

  factory _$TopicAnswerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicAnswerResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
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
    return 'TopicAnswerResponse(id: $id, letter: $letter, answerText: $answerText, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicAnswerResponseImpl &&
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
  _$$TopicAnswerResponseImplCopyWith<_$TopicAnswerResponseImpl> get copyWith =>
      __$$TopicAnswerResponseImplCopyWithImpl<_$TopicAnswerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicAnswerResponseImplToJson(
      this,
    );
  }
}

abstract class _TopicAnswerResponse implements TopicAnswerResponse {
  const factory _TopicAnswerResponse(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'letter') final String? letter,
          @JsonKey(name: 'answer_text') final String? answerText,
          @JsonKey(name: 'is_correct') final bool? isCorrect}) =
      _$TopicAnswerResponseImpl;

  factory _TopicAnswerResponse.fromJson(Map<String, dynamic> json) =
      _$TopicAnswerResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
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
  _$$TopicAnswerResponseImplCopyWith<_$TopicAnswerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
