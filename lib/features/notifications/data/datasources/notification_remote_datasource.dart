import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/notifications/data/models/notification_model.dart';

class NotificationRemoteDataSource {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

  Future<List<NotificationModel>> getNotifications({int page = 1}) async {
    final response = await _apiClient.get(ApiConstants.notifications, queryParams: {'page': page});
    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List<dynamic>? ?? [])
        .map((item) => NotificationModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> markAsRead(int id) async {
    await _apiClient.put('${ApiConstants.notifications}$id/read/');
  }
}
