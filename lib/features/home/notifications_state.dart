import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/account/entities/notification_model.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(false) bool isLoading,
    String? error,
    @Default([]) List<NotificationModel> notifications,
  }) = _NotificationsState;
}
