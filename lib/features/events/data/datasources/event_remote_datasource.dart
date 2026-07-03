import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/events/data/models/event_model.dart';

class EventRemoteDataSource {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

  Future<List<EventModel>> getEvents({int page = 1, String? category}) async {
    final params = <String, dynamic>{'page': page};
    if (category != null) params['category'] = category;
    final response = await _apiClient.get(ApiConstants.events, queryParams: params);
    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List<dynamic>? ?? [])
        .map((item) => EventModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<EventModel> getEventDetail(int id) async {
    final response = await _apiClient.get('${ApiConstants.events}$id/');
    return EventModel.fromJson(response.data as Map<String, dynamic>);
  }
}
