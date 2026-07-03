import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/notifications/data/repositories/notification_repository.dart';
import 'package:rcl_app/features/notifications/domain/entities/app_notification.dart';

class GetNotificationsUseCase {
  final NotificationRepository _repository = GetIt.instance<NotificationRepository>();

  Future<Either<String, List<AppNotification>>> call({int page = 1}) {
    return _repository.getNotifications(page: page);
  }
}
