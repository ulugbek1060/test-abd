// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_after_read_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatAfterReadState {
  bool get isConnecting => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatAfterReadStateCopyWith<ChatAfterReadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatAfterReadStateCopyWith<$Res> {
  factory $ChatAfterReadStateCopyWith(
          ChatAfterReadState value, $Res Function(ChatAfterReadState) then) =
      _$ChatAfterReadStateCopyWithImpl<$Res, ChatAfterReadState>;
  @useResult
  $Res call(
      {bool isConnecting,
      bool isConnected,
      List<ChatMessage> messages,
      String? error});
}

/// @nodoc
class _$ChatAfterReadStateCopyWithImpl<$Res, $Val extends ChatAfterReadState>
    implements $ChatAfterReadStateCopyWith<$Res> {
  _$ChatAfterReadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnecting = null,
    Object? isConnected = null,
    Object? messages = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isConnecting: null == isConnecting
          ? _value.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatAfterReadStateImplCopyWith<$Res>
    implements $ChatAfterReadStateCopyWith<$Res> {
  factory _$$ChatAfterReadStateImplCopyWith(_$ChatAfterReadStateImpl value,
          $Res Function(_$ChatAfterReadStateImpl) then) =
      __$$ChatAfterReadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isConnecting,
      bool isConnected,
      List<ChatMessage> messages,
      String? error});
}

/// @nodoc
class __$$ChatAfterReadStateImplCopyWithImpl<$Res>
    extends _$ChatAfterReadStateCopyWithImpl<$Res, _$ChatAfterReadStateImpl>
    implements _$$ChatAfterReadStateImplCopyWith<$Res> {
  __$$ChatAfterReadStateImplCopyWithImpl(_$ChatAfterReadStateImpl _value,
      $Res Function(_$ChatAfterReadStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnecting = null,
    Object? isConnected = null,
    Object? messages = null,
    Object? error = freezed,
  }) {
    return _then(_$ChatAfterReadStateImpl(
      isConnecting: null == isConnecting
          ? _value.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatAfterReadStateImpl implements _ChatAfterReadState {
  const _$ChatAfterReadStateImpl(
      {this.isConnecting = false,
      this.isConnected = false,
      final List<ChatMessage> messages = const <ChatMessage>[],
      this.error})
      : _messages = messages;

  @override
  @JsonKey()
  final bool isConnecting;
  @override
  @JsonKey()
  final bool isConnected;
  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'ChatAfterReadState(isConnecting: $isConnecting, isConnected: $isConnected, messages: $messages, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatAfterReadStateImpl &&
            (identical(other.isConnecting, isConnecting) ||
                other.isConnecting == isConnecting) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnecting, isConnected,
      const DeepCollectionEquality().hash(_messages), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatAfterReadStateImplCopyWith<_$ChatAfterReadStateImpl> get copyWith =>
      __$$ChatAfterReadStateImplCopyWithImpl<_$ChatAfterReadStateImpl>(
          this, _$identity);
}

abstract class _ChatAfterReadState implements ChatAfterReadState {
  const factory _ChatAfterReadState(
      {final bool isConnecting,
      final bool isConnected,
      final List<ChatMessage> messages,
      final String? error}) = _$ChatAfterReadStateImpl;

  @override
  bool get isConnecting;
  @override
  bool get isConnected;
  @override
  List<ChatMessage> get messages;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$ChatAfterReadStateImplCopyWith<_$ChatAfterReadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
