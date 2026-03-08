// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_questions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookmarkQuestionsResponse _$BookmarkQuestionsResponseFromJson(
    Map<String, dynamic> json) {
  return _BookmarkQuestionsResponse.fromJson(json);
}

/// @nodoc
mixin _$BookmarkQuestionsResponse {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<BookmarkedQuizResult> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkQuestionsResponseCopyWith<BookmarkQuestionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkQuestionsResponseCopyWith<$Res> {
  factory $BookmarkQuestionsResponseCopyWith(BookmarkQuestionsResponse value,
          $Res Function(BookmarkQuestionsResponse) then) =
      _$BookmarkQuestionsResponseCopyWithImpl<$Res, BookmarkQuestionsResponse>;
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<BookmarkedQuizResult> results});
}

/// @nodoc
class _$BookmarkQuestionsResponseCopyWithImpl<$Res,
        $Val extends BookmarkQuestionsResponse>
    implements $BookmarkQuestionsResponseCopyWith<$Res> {
  _$BookmarkQuestionsResponseCopyWithImpl(this._value, this._then);

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
              as List<BookmarkedQuizResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkQuestionsResponseImplCopyWith<$Res>
    implements $BookmarkQuestionsResponseCopyWith<$Res> {
  factory _$$BookmarkQuestionsResponseImplCopyWith(
          _$BookmarkQuestionsResponseImpl value,
          $Res Function(_$BookmarkQuestionsResponseImpl) then) =
      __$$BookmarkQuestionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<BookmarkedQuizResult> results});
}

/// @nodoc
class __$$BookmarkQuestionsResponseImplCopyWithImpl<$Res>
    extends _$BookmarkQuestionsResponseCopyWithImpl<$Res,
        _$BookmarkQuestionsResponseImpl>
    implements _$$BookmarkQuestionsResponseImplCopyWith<$Res> {
  __$$BookmarkQuestionsResponseImplCopyWithImpl(
      _$BookmarkQuestionsResponseImpl _value,
      $Res Function(_$BookmarkQuestionsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$BookmarkQuestionsResponseImpl(
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
              as List<BookmarkedQuizResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkQuestionsResponseImpl implements _BookmarkQuestionsResponse {
  const _$BookmarkQuestionsResponseImpl(
      {this.count,
      this.next,
      this.previous,
      final List<BookmarkedQuizResult> results = const []})
      : _results = results;

  factory _$BookmarkQuestionsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkQuestionsResponseImplFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<BookmarkedQuizResult> _results;
  @override
  @JsonKey()
  List<BookmarkedQuizResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'BookmarkQuestionsResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkQuestionsResponseImpl &&
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
  _$$BookmarkQuestionsResponseImplCopyWith<_$BookmarkQuestionsResponseImpl>
      get copyWith => __$$BookmarkQuestionsResponseImplCopyWithImpl<
          _$BookmarkQuestionsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkQuestionsResponseImplToJson(
      this,
    );
  }
}

abstract class _BookmarkQuestionsResponse implements BookmarkQuestionsResponse {
  const factory _BookmarkQuestionsResponse(
          {final int? count,
          final String? next,
          final String? previous,
          final List<BookmarkedQuizResult> results}) =
      _$BookmarkQuestionsResponseImpl;

  factory _BookmarkQuestionsResponse.fromJson(Map<String, dynamic> json) =
      _$BookmarkQuestionsResponseImpl.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<BookmarkedQuizResult> get results;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkQuestionsResponseImplCopyWith<_$BookmarkQuestionsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BookmarkedQuizResult _$BookmarkedQuizResultFromJson(Map<String, dynamic> json) {
  return _BookmarkedQuizResult.fromJson(json);
}

/// @nodoc
mixin _$BookmarkedQuizResult {
  int? get id => throw _privateConstructorUsedError;
  QuizUser? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_detail')
  QuestionDetail? get questionDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkedQuizResultCopyWith<BookmarkedQuizResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkedQuizResultCopyWith<$Res> {
  factory $BookmarkedQuizResultCopyWith(BookmarkedQuizResult value,
          $Res Function(BookmarkedQuizResult) then) =
      _$BookmarkedQuizResultCopyWithImpl<$Res, BookmarkedQuizResult>;
  @useResult
  $Res call(
      {int? id,
      QuizUser? user,
      @JsonKey(name: 'question_detail') QuestionDetail? questionDetail,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  $QuizUserCopyWith<$Res>? get user;
  $QuestionDetailCopyWith<$Res>? get questionDetail;
}

/// @nodoc
class _$BookmarkedQuizResultCopyWithImpl<$Res,
        $Val extends BookmarkedQuizResult>
    implements $BookmarkedQuizResultCopyWith<$Res> {
  _$BookmarkedQuizResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? questionDetail = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QuizUser?,
      questionDetail: freezed == questionDetail
          ? _value.questionDetail
          : questionDetail // ignore: cast_nullable_to_non_nullable
              as QuestionDetail?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $QuizUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionDetailCopyWith<$Res>? get questionDetail {
    if (_value.questionDetail == null) {
      return null;
    }

    return $QuestionDetailCopyWith<$Res>(_value.questionDetail!, (value) {
      return _then(_value.copyWith(questionDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookmarkedQuizResultImplCopyWith<$Res>
    implements $BookmarkedQuizResultCopyWith<$Res> {
  factory _$$BookmarkedQuizResultImplCopyWith(_$BookmarkedQuizResultImpl value,
          $Res Function(_$BookmarkedQuizResultImpl) then) =
      __$$BookmarkedQuizResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      QuizUser? user,
      @JsonKey(name: 'question_detail') QuestionDetail? questionDetail,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  @override
  $QuizUserCopyWith<$Res>? get user;
  @override
  $QuestionDetailCopyWith<$Res>? get questionDetail;
}

/// @nodoc
class __$$BookmarkedQuizResultImplCopyWithImpl<$Res>
    extends _$BookmarkedQuizResultCopyWithImpl<$Res, _$BookmarkedQuizResultImpl>
    implements _$$BookmarkedQuizResultImplCopyWith<$Res> {
  __$$BookmarkedQuizResultImplCopyWithImpl(_$BookmarkedQuizResultImpl _value,
      $Res Function(_$BookmarkedQuizResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? questionDetail = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$BookmarkedQuizResultImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as QuizUser?,
      questionDetail: freezed == questionDetail
          ? _value.questionDetail
          : questionDetail // ignore: cast_nullable_to_non_nullable
              as QuestionDetail?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkedQuizResultImpl implements _BookmarkedQuizResult {
  const _$BookmarkedQuizResultImpl(
      {this.id,
      this.user,
      @JsonKey(name: 'question_detail') this.questionDetail,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$BookmarkedQuizResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkedQuizResultImplFromJson(json);

  @override
  final int? id;
  @override
  final QuizUser? user;
  @override
  @JsonKey(name: 'question_detail')
  final QuestionDetail? questionDetail;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'BookmarkedQuizResult(id: $id, user: $user, questionDetail: $questionDetail, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkedQuizResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.questionDetail, questionDetail) ||
                other.questionDetail == questionDetail) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user, questionDetail, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkedQuizResultImplCopyWith<_$BookmarkedQuizResultImpl>
      get copyWith =>
          __$$BookmarkedQuizResultImplCopyWithImpl<_$BookmarkedQuizResultImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkedQuizResultImplToJson(
      this,
    );
  }
}

abstract class _BookmarkedQuizResult implements BookmarkedQuizResult {
  const factory _BookmarkedQuizResult(
      {final int? id,
      final QuizUser? user,
      @JsonKey(name: 'question_detail') final QuestionDetail? questionDetail,
      @JsonKey(name: 'created_at')
      final DateTime? createdAt}) = _$BookmarkedQuizResultImpl;

  factory _BookmarkedQuizResult.fromJson(Map<String, dynamic> json) =
      _$BookmarkedQuizResultImpl.fromJson;

  @override
  int? get id;
  @override
  QuizUser? get user;
  @override
  @JsonKey(name: 'question_detail')
  QuestionDetail? get questionDetail;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkedQuizResultImplCopyWith<_$BookmarkedQuizResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuizUser _$QuizUserFromJson(Map<String, dynamic> json) {
  return _QuizUser.fromJson(json);
}

/// @nodoc
mixin _$QuizUser {
  int? get id => throw _privateConstructorUsedError;
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
  $QuizUserCopyWith<QuizUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizUserCopyWith<$Res> {
  factory $QuizUserCopyWith(QuizUser value, $Res Function(QuizUser) then) =
      _$QuizUserCopyWithImpl<$Res, QuizUser>;
  @useResult
  $Res call(
      {int? id,
      String? username,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'is_badged') bool? isBadged,
      @JsonKey(name: 'is_premium') bool? isPremium,
      @JsonKey(name: 'is_following') bool? isFollowing});
}

/// @nodoc
class _$QuizUserCopyWithImpl<$Res, $Val extends QuizUser>
    implements $QuizUserCopyWith<$Res> {
  _$QuizUserCopyWithImpl(this._value, this._then);

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
abstract class _$$QuizUserImplCopyWith<$Res>
    implements $QuizUserCopyWith<$Res> {
  factory _$$QuizUserImplCopyWith(
          _$QuizUserImpl value, $Res Function(_$QuizUserImpl) then) =
      __$$QuizUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? username,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'is_badged') bool? isBadged,
      @JsonKey(name: 'is_premium') bool? isPremium,
      @JsonKey(name: 'is_following') bool? isFollowing});
}

/// @nodoc
class __$$QuizUserImplCopyWithImpl<$Res>
    extends _$QuizUserCopyWithImpl<$Res, _$QuizUserImpl>
    implements _$$QuizUserImplCopyWith<$Res> {
  __$$QuizUserImplCopyWithImpl(
      _$QuizUserImpl _value, $Res Function(_$QuizUserImpl) _then)
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
    return _then(_$QuizUserImpl(
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
class _$QuizUserImpl implements _QuizUser {
  const _$QuizUserImpl(
      {this.id,
      this.username,
      @JsonKey(name: 'profile_image') this.profileImage,
      @JsonKey(name: 'is_badged') this.isBadged,
      @JsonKey(name: 'is_premium') this.isPremium,
      @JsonKey(name: 'is_following') this.isFollowing});

  factory _$QuizUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizUserImplFromJson(json);

  @override
  final int? id;
  @override
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
    return 'QuizUser(id: $id, username: $username, profileImage: $profileImage, isBadged: $isBadged, isPremium: $isPremium, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizUserImpl &&
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
  _$$QuizUserImplCopyWith<_$QuizUserImpl> get copyWith =>
      __$$QuizUserImplCopyWithImpl<_$QuizUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizUserImplToJson(
      this,
    );
  }
}

abstract class _QuizUser implements QuizUser {
  const factory _QuizUser(
      {final int? id,
      final String? username,
      @JsonKey(name: 'profile_image') final String? profileImage,
      @JsonKey(name: 'is_badged') final bool? isBadged,
      @JsonKey(name: 'is_premium') final bool? isPremium,
      @JsonKey(name: 'is_following') final bool? isFollowing}) = _$QuizUserImpl;

  factory _QuizUser.fromJson(Map<String, dynamic> json) =
      _$QuizUserImpl.fromJson;

  @override
  int? get id;
  @override
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
  _$$QuizUserImplCopyWith<_$QuizUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionDetail _$QuestionDetailFromJson(Map<String, dynamic> json) {
  return _QuestionDetail.fromJson(json);
}

/// @nodoc
mixin _$QuestionDetail {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_percentage')
  double? get difficultyPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'test_title')
  String? get testTitle => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionDetailCopyWith<QuestionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionDetailCopyWith<$Res> {
  factory $QuestionDetailCopyWith(
          QuestionDetail value, $Res Function(QuestionDetail) then) =
      _$QuestionDetailCopyWithImpl<$Res, QuestionDetail>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'difficulty_percentage') double? difficultyPercentage,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'test_title') String? testTitle,
      Category? category});

  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$QuestionDetailCopyWithImpl<$Res, $Val extends QuestionDetail>
    implements $QuestionDetailCopyWith<$Res> {
  _$QuestionDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? difficultyPercentage = freezed,
    Object? createdAt = freezed,
    Object? testTitle = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      difficultyPercentage: freezed == difficultyPercentage
          ? _value.difficultyPercentage
          : difficultyPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      testTitle: freezed == testTitle
          ? _value.testTitle
          : testTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
    ) as $Val);
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
abstract class _$$QuestionDetailImplCopyWith<$Res>
    implements $QuestionDetailCopyWith<$Res> {
  factory _$$QuestionDetailImplCopyWith(_$QuestionDetailImpl value,
          $Res Function(_$QuestionDetailImpl) then) =
      __$$QuestionDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'difficulty_percentage') double? difficultyPercentage,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'test_title') String? testTitle,
      Category? category});

  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$QuestionDetailImplCopyWithImpl<$Res>
    extends _$QuestionDetailCopyWithImpl<$Res, _$QuestionDetailImpl>
    implements _$$QuestionDetailImplCopyWith<$Res> {
  __$$QuestionDetailImplCopyWithImpl(
      _$QuestionDetailImpl _value, $Res Function(_$QuestionDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? difficultyPercentage = freezed,
    Object? createdAt = freezed,
    Object? testTitle = freezed,
    Object? category = freezed,
  }) {
    return _then(_$QuestionDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      difficultyPercentage: freezed == difficultyPercentage
          ? _value.difficultyPercentage
          : difficultyPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      testTitle: freezed == testTitle
          ? _value.testTitle
          : testTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionDetailImpl implements _QuestionDetail {
  const _$QuestionDetailImpl(
      {this.id,
      @JsonKey(name: 'question_text') this.questionText,
      @JsonKey(name: 'question_type') this.questionType,
      @JsonKey(name: 'difficulty_percentage') this.difficultyPercentage,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'test_title') this.testTitle,
      this.category});

  factory _$QuestionDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionDetailImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'question_text')
  final String? questionText;
  @override
  @JsonKey(name: 'question_type')
  final String? questionType;
  @override
  @JsonKey(name: 'difficulty_percentage')
  final double? difficultyPercentage;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'test_title')
  final String? testTitle;
  @override
  final Category? category;

  @override
  String toString() {
    return 'QuestionDetail(id: $id, questionText: $questionText, questionType: $questionType, difficultyPercentage: $difficultyPercentage, createdAt: $createdAt, testTitle: $testTitle, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.difficultyPercentage, difficultyPercentage) ||
                other.difficultyPercentage == difficultyPercentage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.testTitle, testTitle) ||
                other.testTitle == testTitle) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, questionText, questionType,
      difficultyPercentage, createdAt, testTitle, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionDetailImplCopyWith<_$QuestionDetailImpl> get copyWith =>
      __$$QuestionDetailImplCopyWithImpl<_$QuestionDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionDetailImplToJson(
      this,
    );
  }
}

abstract class _QuestionDetail implements QuestionDetail {
  const factory _QuestionDetail(
      {final int? id,
      @JsonKey(name: 'question_text') final String? questionText,
      @JsonKey(name: 'question_type') final String? questionType,
      @JsonKey(name: 'difficulty_percentage')
      final double? difficultyPercentage,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'test_title') final String? testTitle,
      final Category? category}) = _$QuestionDetailImpl;

  factory _QuestionDetail.fromJson(Map<String, dynamic> json) =
      _$QuestionDetailImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'question_text')
  String? get questionText;
  @override
  @JsonKey(name: 'question_type')
  String? get questionType;
  @override
  @JsonKey(name: 'difficulty_percentage')
  double? get difficultyPercentage;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'test_title')
  String? get testTitle;
  @override
  Category? get category;
  @override
  @JsonKey(ignore: true)
  _$$QuestionDetailImplCopyWith<_$QuestionDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tests')
  int? get totalTests => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_questions')
  int? get totalQuestions => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get emoji => throw _privateConstructorUsedError;
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
      {int? id,
      @JsonKey(name: 'total_tests') int? totalTests,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      String? title,
      String? slug,
      String? description,
      String? emoji,
      String? image});
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
      {int? id,
      @JsonKey(name: 'total_tests') int? totalTests,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      String? title,
      String? slug,
      String? description,
      String? emoji,
      String? image});
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
      {this.id,
      @JsonKey(name: 'total_tests') this.totalTests,
      @JsonKey(name: 'total_questions') this.totalQuestions,
      this.title,
      this.slug,
      this.description,
      this.emoji,
      this.image});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'total_tests')
  final int? totalTests;
  @override
  @JsonKey(name: 'total_questions')
  final int? totalQuestions;
  @override
  final String? title;
  @override
  final String? slug;
  @override
  final String? description;
  @override
  final String? emoji;
  @override
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
      {final int? id,
      @JsonKey(name: 'total_tests') final int? totalTests,
      @JsonKey(name: 'total_questions') final int? totalQuestions,
      final String? title,
      final String? slug,
      final String? description,
      final String? emoji,
      final String? image}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'total_tests')
  int? get totalTests;
  @override
  @JsonKey(name: 'total_questions')
  int? get totalQuestions;
  @override
  String? get title;
  @override
  String? get slug;
  @override
  String? get description;
  @override
  String? get emoji;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
