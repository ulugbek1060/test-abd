import 'package:equatable/equatable.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/data/remote_source/account/model/notifications_response.dart';

class NotificationModel extends Equatable {
  final int? id;
  // final String? verb;
  final String? message;
  // final String? actor;
  // final String? contentType;
  // final int? objectId;
  final DateTime? createdAt;
  final bool? isRead;

  const NotificationModel({
    this.id,
    // this.verb,
    this.message,
    // this.actor,
    // this.contentType,
    // this.objectId,
    this.createdAt,
    this.isRead,
  });

  String get time => formatDate(createdAt);

  static NotificationModel fromResponse(NotificationsResponse response){
    return NotificationModel(
      id: response.id,
      // verb: response.verb,
      message: response.message,
      // actor: response.actor,
      // contentType: response.contentType,
      // objectId: response.objectId,
      createdAt: DateTime.tryParse(response.createdAt ?? ''),
      isRead: response.isRead,
    );
  }

  @override
  List<Object?> get props => [
    id,
    // verb,
    message,
    // actor,
    // contentType,
    // objectId,
    createdAt,
    isRead,
  ];
}
