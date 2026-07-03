import 'package:rcl_app/features/notifications/domain/entities/app_notification.dart';

class NotificationModel {
  final int id;
  final String title;
  final String? message;
  final String type;
  final bool isRead;
  final DateTime createdAt;
  final String? relatedId;

  const NotificationModel({
    required this.id,
    required this.title,
    this.message,
    required this.type,
    this.isRead = false,
    required this.createdAt,
    this.relatedId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: (json['id'] as num).toInt(),
    title: json['title'] as String,
    message: json['message'] as String?,
    type: json['type'] as String,
    isRead: json['is_read'] as bool? ?? false,
    createdAt: DateTime.parse(json['created_at'] as String),
    relatedId: json['related_id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'message': message,
    'type': type,
    'is_read': isRead,
    'created_at': createdAt.toIso8601String(),
    'related_id': relatedId,
  };

  AppNotification toEntity() => AppNotification(
    id: id,
    title: title,
    message: message,
    type: type,
    isRead: isRead,
    createdAt: createdAt,
    relatedId: relatedId,
  );

  factory NotificationModel.fromEntity(AppNotification entity) => NotificationModel(
    id: entity.id,
    title: entity.title,
    message: entity.message,
    type: entity.type,
    isRead: entity.isRead,
    createdAt: entity.createdAt,
    relatedId: entity.relatedId,
  );
}
