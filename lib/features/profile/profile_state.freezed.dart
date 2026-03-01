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
  String? get error => throw _privateConstructorUsedError;
  MyInfoModel? get myInfoModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ConnectionsState get userConnectionsState =>
      throw _privateConstructorUsedError;
  BlocksState get blocksState => throw _privateConstructorUsedError;
  QuestionsState get questionsState => throw _privateConstructorUsedError;

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
      {String? error,
      MyInfoModel? myInfoModel,
      bool isLoading,
      ConnectionsState userConnectionsState,
      BlocksState blocksState,
      QuestionsState questionsState});

  $ConnectionsStateCopyWith<$Res> get userConnectionsState;
  $BlocksStateCopyWith<$Res> get blocksState;
  $QuestionsStateCopyWith<$Res> get questionsState;
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
    Object? error = freezed,
    Object? myInfoModel = freezed,
    Object? isLoading = null,
    Object? userConnectionsState = null,
    Object? blocksState = null,
    Object? questionsState = null,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      myInfoModel: freezed == myInfoModel
          ? _value.myInfoModel
          : myInfoModel // ignore: cast_nullable_to_non_nullable
              as MyInfoModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userConnectionsState: null == userConnectionsState
          ? _value.userConnectionsState
          : userConnectionsState // ignore: cast_nullable_to_non_nullable
              as ConnectionsState,
      blocksState: null == blocksState
          ? _value.blocksState
          : blocksState // ignore: cast_nullable_to_non_nullable
              as BlocksState,
      questionsState: null == questionsState
          ? _value.questionsState
          : questionsState // ignore: cast_nullable_to_non_nullable
              as QuestionsState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConnectionsStateCopyWith<$Res> get userConnectionsState {
    return $ConnectionsStateCopyWith<$Res>(_value.userConnectionsState,
        (value) {
      return _then(_value.copyWith(userConnectionsState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BlocksStateCopyWith<$Res> get blocksState {
    return $BlocksStateCopyWith<$Res>(_value.blocksState, (value) {
      return _then(_value.copyWith(blocksState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionsStateCopyWith<$Res> get questionsState {
    return $QuestionsStateCopyWith<$Res>(_value.questionsState, (value) {
      return _then(_value.copyWith(questionsState: value) as $Val);
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
      {String? error,
      MyInfoModel? myInfoModel,
      bool isLoading,
      ConnectionsState userConnectionsState,
      BlocksState blocksState,
      QuestionsState questionsState});

  @override
  $ConnectionsStateCopyWith<$Res> get userConnectionsState;
  @override
  $BlocksStateCopyWith<$Res> get blocksState;
  @override
  $QuestionsStateCopyWith<$Res> get questionsState;
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
    Object? error = freezed,
    Object? myInfoModel = freezed,
    Object? isLoading = null,
    Object? userConnectionsState = null,
    Object? blocksState = null,
    Object? questionsState = null,
  }) {
    return _then(_$ProfileStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      myInfoModel: freezed == myInfoModel
          ? _value.myInfoModel
          : myInfoModel // ignore: cast_nullable_to_non_nullable
              as MyInfoModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userConnectionsState: null == userConnectionsState
          ? _value.userConnectionsState
          : userConnectionsState // ignore: cast_nullable_to_non_nullable
              as ConnectionsState,
      blocksState: null == blocksState
          ? _value.blocksState
          : blocksState // ignore: cast_nullable_to_non_nullable
              as BlocksState,
      questionsState: null == questionsState
          ? _value.questionsState
          : questionsState // ignore: cast_nullable_to_non_nullable
              as QuestionsState,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.error,
      this.myInfoModel,
      this.isLoading = false,
      this.userConnectionsState = const ConnectionsState(),
      this.blocksState = const BlocksState(),
      this.questionsState = const QuestionsState()});

  @override
  final String? error;
  @override
  final MyInfoModel? myInfoModel;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ConnectionsState userConnectionsState;
  @override
  @JsonKey()
  final BlocksState blocksState;
  @override
  @JsonKey()
  final QuestionsState questionsState;

  @override
  String toString() {
    return 'ProfileState(error: $error, myInfoModel: $myInfoModel, isLoading: $isLoading, userConnectionsState: $userConnectionsState, blocksState: $blocksState, questionsState: $questionsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.myInfoModel, myInfoModel) ||
                other.myInfoModel == myInfoModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userConnectionsState, userConnectionsState) ||
                other.userConnectionsState == userConnectionsState) &&
            (identical(other.blocksState, blocksState) ||
                other.blocksState == blocksState) &&
            (identical(other.questionsState, questionsState) ||
                other.questionsState == questionsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, myInfoModel, isLoading,
      userConnectionsState, blocksState, questionsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final String? error,
      final MyInfoModel? myInfoModel,
      final bool isLoading,
      final ConnectionsState userConnectionsState,
      final BlocksState blocksState,
      final QuestionsState questionsState}) = _$ProfileStateImpl;

  @override
  String? get error;
  @override
  MyInfoModel? get myInfoModel;
  @override
  bool get isLoading;
  @override
  ConnectionsState get userConnectionsState;
  @override
  BlocksState get blocksState;
  @override
  QuestionsState get questionsState;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConnectionsState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  UserConnectionsModel get connections => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectionsStateCopyWith<ConnectionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionsStateCopyWith<$Res> {
  factory $ConnectionsStateCopyWith(
          ConnectionsState value, $Res Function(ConnectionsState) then) =
      _$ConnectionsStateCopyWithImpl<$Res, ConnectionsState>;
  @useResult
  $Res call({bool isLoading, String? error, UserConnectionsModel connections});
}

/// @nodoc
class _$ConnectionsStateCopyWithImpl<$Res, $Val extends ConnectionsState>
    implements $ConnectionsStateCopyWith<$Res> {
  _$ConnectionsStateCopyWithImpl(this._value, this._then);

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
abstract class _$$ConnectionsStateImplCopyWith<$Res>
    implements $ConnectionsStateCopyWith<$Res> {
  factory _$$ConnectionsStateImplCopyWith(_$ConnectionsStateImpl value,
          $Res Function(_$ConnectionsStateImpl) then) =
      __$$ConnectionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, UserConnectionsModel connections});
}

/// @nodoc
class __$$ConnectionsStateImplCopyWithImpl<$Res>
    extends _$ConnectionsStateCopyWithImpl<$Res, _$ConnectionsStateImpl>
    implements _$$ConnectionsStateImplCopyWith<$Res> {
  __$$ConnectionsStateImplCopyWithImpl(_$ConnectionsStateImpl _value,
      $Res Function(_$ConnectionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? connections = null,
  }) {
    return _then(_$ConnectionsStateImpl(
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

class _$ConnectionsStateImpl implements _ConnectionsState {
  const _$ConnectionsStateImpl(
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
    return 'ConnectionsState(isLoading: $isLoading, error: $error, connections: $connections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionsStateImpl &&
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
  _$$ConnectionsStateImplCopyWith<_$ConnectionsStateImpl> get copyWith =>
      __$$ConnectionsStateImplCopyWithImpl<_$ConnectionsStateImpl>(
          this, _$identity);
}

abstract class _ConnectionsState implements ConnectionsState {
  const factory _ConnectionsState(
      {final bool isLoading,
      final String? error,
      final UserConnectionsModel connections}) = _$ConnectionsStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  UserConnectionsModel get connections;
  @override
  @JsonKey(ignore: true)
  _$$ConnectionsStateImplCopyWith<_$ConnectionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BlocksState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  int get previous => throw _privateConstructorUsedError;
  int get next => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<BlockModel> get blocks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlocksStateCopyWith<BlocksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlocksStateCopyWith<$Res> {
  factory $BlocksStateCopyWith(
          BlocksState value, $Res Function(BlocksState) then) =
      _$BlocksStateCopyWithImpl<$Res, BlocksState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingMore,
      bool isLastPage,
      int previous,
      int next,
      String? error,
      List<BlockModel> blocks});
}

/// @nodoc
class _$BlocksStateCopyWithImpl<$Res, $Val extends BlocksState>
    implements $BlocksStateCopyWith<$Res> {
  _$BlocksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? isLastPage = null,
    Object? previous = null,
    Object? next = null,
    Object? error = freezed,
    Object? blocks = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      blocks: null == blocks
          ? _value.blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<BlockModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlocksStateImplCopyWith<$Res>
    implements $BlocksStateCopyWith<$Res> {
  factory _$$BlocksStateImplCopyWith(
          _$BlocksStateImpl value, $Res Function(_$BlocksStateImpl) then) =
      __$$BlocksStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingMore,
      bool isLastPage,
      int previous,
      int next,
      String? error,
      List<BlockModel> blocks});
}

/// @nodoc
class __$$BlocksStateImplCopyWithImpl<$Res>
    extends _$BlocksStateCopyWithImpl<$Res, _$BlocksStateImpl>
    implements _$$BlocksStateImplCopyWith<$Res> {
  __$$BlocksStateImplCopyWithImpl(
      _$BlocksStateImpl _value, $Res Function(_$BlocksStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? isLastPage = null,
    Object? previous = null,
    Object? next = null,
    Object? error = freezed,
    Object? blocks = null,
  }) {
    return _then(_$BlocksStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      blocks: null == blocks
          ? _value._blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<BlockModel>,
    ));
  }
}

/// @nodoc

class _$BlocksStateImpl implements _BlocksState {
  const _$BlocksStateImpl(
      {this.isLoading = false,
      this.isLoadingMore = false,
      this.isLastPage = false,
      this.previous = 0,
      this.next = 1,
      this.error,
      final List<BlockModel> blocks = const []})
      : _blocks = blocks;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool isLastPage;
  @override
  @JsonKey()
  final int previous;
  @override
  @JsonKey()
  final int next;
  @override
  final String? error;
  final List<BlockModel> _blocks;
  @override
  @JsonKey()
  List<BlockModel> get blocks {
    if (_blocks is EqualUnmodifiableListView) return _blocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocks);
  }

  @override
  String toString() {
    return 'BlocksState(isLoading: $isLoading, isLoadingMore: $isLoadingMore, isLastPage: $isLastPage, previous: $previous, next: $next, error: $error, blocks: $blocks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlocksStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._blocks, _blocks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoadingMore,
      isLastPage,
      previous,
      next,
      error,
      const DeepCollectionEquality().hash(_blocks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlocksStateImplCopyWith<_$BlocksStateImpl> get copyWith =>
      __$$BlocksStateImplCopyWithImpl<_$BlocksStateImpl>(this, _$identity);
}

abstract class _BlocksState implements BlocksState {
  const factory _BlocksState(
      {final bool isLoading,
      final bool isLoadingMore,
      final bool isLastPage,
      final int previous,
      final int next,
      final String? error,
      final List<BlockModel> blocks}) = _$BlocksStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get isLastPage;
  @override
  int get previous;
  @override
  int get next;
  @override
  String? get error;
  @override
  List<BlockModel> get blocks;
  @override
  @JsonKey(ignore: true)
  _$$BlocksStateImplCopyWith<_$BlocksStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QuestionsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  int get previous => throw _privateConstructorUsedError;
  int get next => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<QuestionModel> get questions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionsStateCopyWith<QuestionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsStateCopyWith<$Res> {
  factory $QuestionsStateCopyWith(
          QuestionsState value, $Res Function(QuestionsState) then) =
      _$QuestionsStateCopyWithImpl<$Res, QuestionsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingMore,
      bool isLastPage,
      int previous,
      int next,
      String? error,
      List<QuestionModel> questions});
}

/// @nodoc
class _$QuestionsStateCopyWithImpl<$Res, $Val extends QuestionsState>
    implements $QuestionsStateCopyWith<$Res> {
  _$QuestionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? isLastPage = null,
    Object? previous = null,
    Object? next = null,
    Object? error = freezed,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionsStateImplCopyWith<$Res>
    implements $QuestionsStateCopyWith<$Res> {
  factory _$$QuestionsStateImplCopyWith(_$QuestionsStateImpl value,
          $Res Function(_$QuestionsStateImpl) then) =
      __$$QuestionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingMore,
      bool isLastPage,
      int previous,
      int next,
      String? error,
      List<QuestionModel> questions});
}

/// @nodoc
class __$$QuestionsStateImplCopyWithImpl<$Res>
    extends _$QuestionsStateCopyWithImpl<$Res, _$QuestionsStateImpl>
    implements _$$QuestionsStateImplCopyWith<$Res> {
  __$$QuestionsStateImplCopyWithImpl(
      _$QuestionsStateImpl _value, $Res Function(_$QuestionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? isLastPage = null,
    Object? previous = null,
    Object? next = null,
    Object? error = freezed,
    Object? questions = null,
  }) {
    return _then(_$QuestionsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
    ));
  }
}

/// @nodoc

class _$QuestionsStateImpl implements _QuestionsState {
  const _$QuestionsStateImpl(
      {this.isLoading = false,
      this.isLoadingMore = false,
      this.isLastPage = false,
      this.previous = 0,
      this.next = 1,
      this.error,
      final List<QuestionModel> questions = const []})
      : _questions = questions;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool isLastPage;
  @override
  @JsonKey()
  final int previous;
  @override
  @JsonKey()
  final int next;
  @override
  final String? error;
  final List<QuestionModel> _questions;
  @override
  @JsonKey()
  List<QuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuestionsState(isLoading: $isLoading, isLoadingMore: $isLoadingMore, isLastPage: $isLastPage, previous: $previous, next: $next, error: $error, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoadingMore,
      isLastPage,
      previous,
      next,
      error,
      const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionsStateImplCopyWith<_$QuestionsStateImpl> get copyWith =>
      __$$QuestionsStateImplCopyWithImpl<_$QuestionsStateImpl>(
          this, _$identity);
}

abstract class _QuestionsState implements QuestionsState {
  const factory _QuestionsState(
      {final bool isLoading,
      final bool isLoadingMore,
      final bool isLastPage,
      final int previous,
      final int next,
      final String? error,
      final List<QuestionModel> questions}) = _$QuestionsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get isLastPage;
  @override
  int get previous;
  @override
  int get next;
  @override
  String? get error;
  @override
  List<QuestionModel> get questions;
  @override
  @JsonKey(ignore: true)
  _$$QuestionsStateImplCopyWith<_$QuestionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
