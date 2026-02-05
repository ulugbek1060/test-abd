// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError; // main data state
  MyInfoModel? get myInfoModel =>
      throw _privateConstructorUsedError; // user followers
  UserConnectionsState get userConnectionsState =>
      throw _privateConstructorUsedError; // questions bookmark
  QuestionsBookmarkState get questionsBookmarkState =>
      throw _privateConstructorUsedError; // my questions
  MyBlocksState get myBlocksState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      MyInfoModel? myInfoModel,
      UserConnectionsState userConnectionsState,
      QuestionsBookmarkState questionsBookmarkState,
      MyBlocksState myBlocksState});

  $UserConnectionsStateCopyWith<$Res> get userConnectionsState;
  $QuestionsBookmarkStateCopyWith<$Res> get questionsBookmarkState;
  $MyBlocksStateCopyWith<$Res> get myBlocksState;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? myInfoModel = freezed,
    Object? userConnectionsState = null,
    Object? questionsBookmarkState = null,
    Object? myBlocksState = null,
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
      myInfoModel: freezed == myInfoModel
          ? _value.myInfoModel
          : myInfoModel // ignore: cast_nullable_to_non_nullable
              as MyInfoModel?,
      userConnectionsState: null == userConnectionsState
          ? _value.userConnectionsState
          : userConnectionsState // ignore: cast_nullable_to_non_nullable
              as UserConnectionsState,
      questionsBookmarkState: null == questionsBookmarkState
          ? _value.questionsBookmarkState
          : questionsBookmarkState // ignore: cast_nullable_to_non_nullable
              as QuestionsBookmarkState,
      myBlocksState: null == myBlocksState
          ? _value.myBlocksState
          : myBlocksState // ignore: cast_nullable_to_non_nullable
              as MyBlocksState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserConnectionsStateCopyWith<$Res> get userConnectionsState {
    return $UserConnectionsStateCopyWith<$Res>(_value.userConnectionsState,
        (value) {
      return _then(_value.copyWith(userConnectionsState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionsBookmarkStateCopyWith<$Res> get questionsBookmarkState {
    return $QuestionsBookmarkStateCopyWith<$Res>(_value.questionsBookmarkState,
        (value) {
      return _then(_value.copyWith(questionsBookmarkState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MyBlocksStateCopyWith<$Res> get myBlocksState {
    return $MyBlocksStateCopyWith<$Res>(_value.myBlocksState, (value) {
      return _then(_value.copyWith(myBlocksState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      MyInfoModel? myInfoModel,
      UserConnectionsState userConnectionsState,
      QuestionsBookmarkState questionsBookmarkState,
      MyBlocksState myBlocksState});

  @override
  $UserConnectionsStateCopyWith<$Res> get userConnectionsState;
  @override
  $QuestionsBookmarkStateCopyWith<$Res> get questionsBookmarkState;
  @override
  $MyBlocksStateCopyWith<$Res> get myBlocksState;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? myInfoModel = freezed,
    Object? userConnectionsState = null,
    Object? questionsBookmarkState = null,
    Object? myBlocksState = null,
  }) {
    return _then(_$ProfileStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      myInfoModel: freezed == myInfoModel
          ? _value.myInfoModel
          : myInfoModel // ignore: cast_nullable_to_non_nullable
              as MyInfoModel?,
      userConnectionsState: null == userConnectionsState
          ? _value.userConnectionsState
          : userConnectionsState // ignore: cast_nullable_to_non_nullable
              as UserConnectionsState,
      questionsBookmarkState: null == questionsBookmarkState
          ? _value.questionsBookmarkState
          : questionsBookmarkState // ignore: cast_nullable_to_non_nullable
              as QuestionsBookmarkState,
      myBlocksState: null == myBlocksState
          ? _value.myBlocksState
          : myBlocksState // ignore: cast_nullable_to_non_nullable
              as MyBlocksState,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.isLoading = false,
      this.error = null,
      this.myInfoModel,
      this.userConnectionsState = const UserConnectionsState(),
      this.questionsBookmarkState = const QuestionsBookmarkState(),
      this.myBlocksState = const MyBlocksState()});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? error;
// main data state
  @override
  final MyInfoModel? myInfoModel;
// user followers
  @override
  @JsonKey()
  final UserConnectionsState userConnectionsState;
// questions bookmark
  @override
  @JsonKey()
  final QuestionsBookmarkState questionsBookmarkState;
// my questions
  @override
  @JsonKey()
  final MyBlocksState myBlocksState;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, error: $error, myInfoModel: $myInfoModel, userConnectionsState: $userConnectionsState, questionsBookmarkState: $questionsBookmarkState, myBlocksState: $myBlocksState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.myInfoModel, myInfoModel) ||
                other.myInfoModel == myInfoModel) &&
            (identical(other.userConnectionsState, userConnectionsState) ||
                other.userConnectionsState == userConnectionsState) &&
            (identical(other.questionsBookmarkState, questionsBookmarkState) ||
                other.questionsBookmarkState == questionsBookmarkState) &&
            (identical(other.myBlocksState, myBlocksState) ||
                other.myBlocksState == myBlocksState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, myInfoModel,
      userConnectionsState, questionsBookmarkState, myBlocksState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final bool isLoading,
      final String? error,
      final MyInfoModel? myInfoModel,
      final UserConnectionsState userConnectionsState,
      final QuestionsBookmarkState questionsBookmarkState,
      final MyBlocksState myBlocksState}) = _$ProfileStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override // main data state
  MyInfoModel? get myInfoModel;
  @override // user followers
  UserConnectionsState get userConnectionsState;
  @override // questions bookmark
  QuestionsBookmarkState get questionsBookmarkState;
  @override // my questions
  MyBlocksState get myBlocksState;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserConnectionsState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  UserConnectionsModel get connections => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserConnectionsStateCopyWith<UserConnectionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserConnectionsStateCopyWith<$Res> {
  factory $UserConnectionsStateCopyWith(UserConnectionsState value,
          $Res Function(UserConnectionsState) then) =
      _$UserConnectionsStateCopyWithImpl<$Res, UserConnectionsState>;
  @useResult
  $Res call({bool isLoading, String? error, UserConnectionsModel connections});
}

/// @nodoc
class _$UserConnectionsStateCopyWithImpl<$Res,
        $Val extends UserConnectionsState>
    implements $UserConnectionsStateCopyWith<$Res> {
  _$UserConnectionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? connections = null,
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
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as UserConnectionsModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserConnectionsStateImplCopyWith<$Res>
    implements $UserConnectionsStateCopyWith<$Res> {
  factory _$$UserConnectionsStateImplCopyWith(_$UserConnectionsStateImpl value,
          $Res Function(_$UserConnectionsStateImpl) then) =
      __$$UserConnectionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, UserConnectionsModel connections});
}

/// @nodoc
class __$$UserConnectionsStateImplCopyWithImpl<$Res>
    extends _$UserConnectionsStateCopyWithImpl<$Res, _$UserConnectionsStateImpl>
    implements _$$UserConnectionsStateImplCopyWith<$Res> {
  __$$UserConnectionsStateImplCopyWithImpl(_$UserConnectionsStateImpl _value,
      $Res Function(_$UserConnectionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? connections = null,
  }) {
    return _then(_$UserConnectionsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as UserConnectionsModel,
    ));
  }
}

/// @nodoc

class _$UserConnectionsStateImpl implements _UserConnectionsState {
  const _$UserConnectionsStateImpl(
      {this.isLoading = false,
      this.error,
      this.connections = const UserConnectionsModel()});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  @JsonKey()
  final UserConnectionsModel connections;

  @override
  String toString() {
    return 'UserConnectionsState(isLoading: $isLoading, error: $error, connections: $connections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserConnectionsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.connections, connections) ||
                other.connections == connections));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, connections);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserConnectionsStateImplCopyWith<_$UserConnectionsStateImpl>
      get copyWith =>
          __$$UserConnectionsStateImplCopyWithImpl<_$UserConnectionsStateImpl>(
              this, _$identity);
}

abstract class _UserConnectionsState implements UserConnectionsState {
  const factory _UserConnectionsState(
      {final bool isLoading,
      final String? error,
      final UserConnectionsModel connections}) = _$UserConnectionsStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  UserConnectionsModel get connections;
  @override
  @JsonKey(ignore: true)
  _$$UserConnectionsStateImplCopyWith<_$UserConnectionsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QuestionsBookmarkState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  QuestionsBookmarkModel get questionsBookmark =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionsBookmarkStateCopyWith<QuestionsBookmarkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsBookmarkStateCopyWith<$Res> {
  factory $QuestionsBookmarkStateCopyWith(QuestionsBookmarkState value,
          $Res Function(QuestionsBookmarkState) then) =
      _$QuestionsBookmarkStateCopyWithImpl<$Res, QuestionsBookmarkState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      QuestionsBookmarkModel questionsBookmark});
}

/// @nodoc
class _$QuestionsBookmarkStateCopyWithImpl<$Res,
        $Val extends QuestionsBookmarkState>
    implements $QuestionsBookmarkStateCopyWith<$Res> {
  _$QuestionsBookmarkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? questionsBookmark = null,
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
      questionsBookmark: null == questionsBookmark
          ? _value.questionsBookmark
          : questionsBookmark // ignore: cast_nullable_to_non_nullable
              as QuestionsBookmarkModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionsBookmarkStateImplCopyWith<$Res>
    implements $QuestionsBookmarkStateCopyWith<$Res> {
  factory _$$QuestionsBookmarkStateImplCopyWith(
          _$QuestionsBookmarkStateImpl value,
          $Res Function(_$QuestionsBookmarkStateImpl) then) =
      __$$QuestionsBookmarkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      QuestionsBookmarkModel questionsBookmark});
}

/// @nodoc
class __$$QuestionsBookmarkStateImplCopyWithImpl<$Res>
    extends _$QuestionsBookmarkStateCopyWithImpl<$Res,
        _$QuestionsBookmarkStateImpl>
    implements _$$QuestionsBookmarkStateImplCopyWith<$Res> {
  __$$QuestionsBookmarkStateImplCopyWithImpl(
      _$QuestionsBookmarkStateImpl _value,
      $Res Function(_$QuestionsBookmarkStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? questionsBookmark = null,
  }) {
    return _then(_$QuestionsBookmarkStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      questionsBookmark: null == questionsBookmark
          ? _value.questionsBookmark
          : questionsBookmark // ignore: cast_nullable_to_non_nullable
              as QuestionsBookmarkModel,
    ));
  }
}

/// @nodoc

class _$QuestionsBookmarkStateImpl implements _QuestionsBookmarkState {
  const _$QuestionsBookmarkStateImpl(
      {this.isLoading = false,
      this.error,
      this.questionsBookmark = const QuestionsBookmarkModel()});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  @JsonKey()
  final QuestionsBookmarkModel questionsBookmark;

  @override
  String toString() {
    return 'QuestionsBookmarkState(isLoading: $isLoading, error: $error, questionsBookmark: $questionsBookmark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionsBookmarkStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.questionsBookmark, questionsBookmark) ||
                other.questionsBookmark == questionsBookmark));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, error, questionsBookmark);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionsBookmarkStateImplCopyWith<_$QuestionsBookmarkStateImpl>
      get copyWith => __$$QuestionsBookmarkStateImplCopyWithImpl<
          _$QuestionsBookmarkStateImpl>(this, _$identity);
}

abstract class _QuestionsBookmarkState implements QuestionsBookmarkState {
  const factory _QuestionsBookmarkState(
          {final bool isLoading,
          final String? error,
          final QuestionsBookmarkModel questionsBookmark}) =
      _$QuestionsBookmarkStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  QuestionsBookmarkModel get questionsBookmark;
  @override
  @JsonKey(ignore: true)
  _$$QuestionsBookmarkStateImplCopyWith<_$QuestionsBookmarkStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MyBlocksState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<MyBlockModel> get myQuestions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyBlocksStateCopyWith<MyBlocksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBlocksStateCopyWith<$Res> {
  factory $MyBlocksStateCopyWith(
          MyBlocksState value, $Res Function(MyBlocksState) then) =
      _$MyBlocksStateCopyWithImpl<$Res, MyBlocksState>;
  @useResult
  $Res call({bool isLoading, String? error, List<MyBlockModel> myQuestions});
}

/// @nodoc
class _$MyBlocksStateCopyWithImpl<$Res, $Val extends MyBlocksState>
    implements $MyBlocksStateCopyWith<$Res> {
  _$MyBlocksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? myQuestions = null,
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
      myQuestions: null == myQuestions
          ? _value.myQuestions
          : myQuestions // ignore: cast_nullable_to_non_nullable
              as List<MyBlockModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyQuestionsStateImplCopyWith<$Res>
    implements $MyBlocksStateCopyWith<$Res> {
  factory _$$MyQuestionsStateImplCopyWith(_$MyQuestionsStateImpl value,
          $Res Function(_$MyQuestionsStateImpl) then) =
      __$$MyQuestionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, List<MyBlockModel> myQuestions});
}

/// @nodoc
class __$$MyQuestionsStateImplCopyWithImpl<$Res>
    extends _$MyBlocksStateCopyWithImpl<$Res, _$MyQuestionsStateImpl>
    implements _$$MyQuestionsStateImplCopyWith<$Res> {
  __$$MyQuestionsStateImplCopyWithImpl(_$MyQuestionsStateImpl _value,
      $Res Function(_$MyQuestionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? myQuestions = null,
  }) {
    return _then(_$MyQuestionsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      myQuestions: null == myQuestions
          ? _value._myQuestions
          : myQuestions // ignore: cast_nullable_to_non_nullable
              as List<MyBlockModel>,
    ));
  }
}

/// @nodoc

class _$MyQuestionsStateImpl implements _MyQuestionsState {
  const _$MyQuestionsStateImpl(
      {this.isLoading = false,
      this.error,
      final List<MyBlockModel> myQuestions = const []})
      : _myQuestions = myQuestions;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  final List<MyBlockModel> _myQuestions;
  @override
  @JsonKey()
  List<MyBlockModel> get myQuestions {
    if (_myQuestions is EqualUnmodifiableListView) return _myQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myQuestions);
  }

  @override
  String toString() {
    return 'MyBlocksState(isLoading: $isLoading, error: $error, myQuestions: $myQuestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyQuestionsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._myQuestions, _myQuestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(_myQuestions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyQuestionsStateImplCopyWith<_$MyQuestionsStateImpl> get copyWith =>
      __$$MyQuestionsStateImplCopyWithImpl<_$MyQuestionsStateImpl>(
          this, _$identity);
}

abstract class _MyQuestionsState implements MyBlocksState {
  const factory _MyQuestionsState(
      {final bool isLoading,
      final String? error,
      final List<MyBlockModel> myQuestions}) = _$MyQuestionsStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  List<MyBlockModel> get myQuestions;
  @override
  @JsonKey(ignore: true)
  _$$MyQuestionsStateImplCopyWith<_$MyQuestionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
