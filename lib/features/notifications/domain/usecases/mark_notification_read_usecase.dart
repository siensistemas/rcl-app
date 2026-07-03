import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/notifications/data/repositories/notification_repository.dart';

class MarkNotificationReadUseCase {
  final NotificationRepository _repository = GetIt.instance<NotificationRepository>();

  Future<Either<String, void>> call(int id) {
    return _repository.markAsRead(id);
  }
}
