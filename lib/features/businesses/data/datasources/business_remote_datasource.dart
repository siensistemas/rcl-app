import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/businesses/data/models/business_model.dart';

class BusinessRemoteDataSource {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

  Future<List<BusinessModel>> getBusinesses({int page = 1, String? category}) async {
    final params = <String, dynamic>{'page': page};
    if (category != null) params['category'] = category;
    final response = await _apiClient.get(ApiConstants.businesses, queryParams: params);
    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List<dynamic>? ?? [])
        .map((item) => BusinessModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<BusinessModel> getBusinessDetail(int id) async {
    final response = await _apiClient.get('${ApiConstants.businesses}$id/');
    return BusinessModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<BusinessModel>> searchBusinesses(String query) async {
    final response = await _apiClient.get(
      ApiConstants.businesses,
      queryParams: {'search': query},
    );
    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List<dynamic>? ?? [])
        .map((item) => BusinessModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<List<BusinessModel>> getNearbyBusinesses(double lat, double lng, {double radius = 5}) async {
    final response = await _apiClient.get(
      '${ApiConstants.businesses}nearby/',
      queryParams: {'lat': lat, 'lng': lng, 'radius': radius},
    );
    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List<dynamic>? ?? [])
        .map((item) => BusinessModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<List<BusinessModel>> getFeaturedBusinesses() async {
    final response = await _apiClient.get(
      ApiConstants.businesses,
      queryParams: {'featured': true},
    );
    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List<dynamic>? ?? [])
        .map((item) => BusinessModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
