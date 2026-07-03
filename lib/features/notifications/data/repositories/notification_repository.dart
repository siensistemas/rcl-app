import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/notifications/data/datasources/notification_remote_datasource.dart';
import 'package:rcl_app/features/notifications/domain/entities/app_notification.dart';
import 'package:rcl_app/features/notifications/domain/repositories/notification_repository_contract.dart';

class NotificationRepository implements NotificationRepositoryContract {
  final NotificationRemoteDataSource _dataSource = GetIt.instance<NotificationRemoteDataSource>();

  @override
  Future<Either<String, List<AppNotification>>> getNotifications({int page = 1}) async {
    try {
      final items = await _dataSource.getNotifications(page: page);
      return Right(items.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> markAsRead(int id) async {
    try {
      await _dataSource.markAsRead(id);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
