import 'package:dartz/dartz.dart';
import 'package:rcl_app/features/notifications/domain/entities/app_notification.dart';

abstract class NotificationRepositoryContract {
  Future<Either<String, List<AppNotification>>> getNotifications({int page = 1});
  Future<Either<String, void>> markAsRead(int id);
}
