import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/tourism/data/models/attraction_model.dart';

class TourismRemoteDataSource {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

  Future<List<AttractionModel>> getAttractions({int page = 1, String? category}) async {
    final params = <String, dynamic>{'page': page};
    if (category != null) params['category'] = category;
    final response = await _apiClient.get(ApiConstants.tourism, queryParams: params);
    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List<dynamic>? ?? [])
        .map((item) => AttractionModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
