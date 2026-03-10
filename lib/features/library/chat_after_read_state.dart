// chat_state.dart
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_after_read_state.freezed.dart';

@freezed
class ChatAfterReadState with _$ChatAfterReadState {
  const factory ChatAfterReadState({
    @Default(false) bool isConnecting,
    @Default(false) bool isConnected,
    @Default(<ChatMessage>[]) List<ChatMessage> messages,
    String? error,
  }) = _ChatAfterReadState;
}

class ChatMessage extends Equatable {
  final String senderId;
  final String content;
  final DateTime timestamp;

  const ChatMessage({
    required this.senderId,
    required this.content,
    required this.timestamp,
  });

  @override
  List<Object> get props => [senderId, content, timestamp];
}