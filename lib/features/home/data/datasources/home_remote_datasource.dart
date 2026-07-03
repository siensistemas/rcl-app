import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/businesses/data/models/business_model.dart';
import 'package:rcl_app/features/promotions/data/models/promotion_model.dart';

class HomeRemoteDataSource {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

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

  Future<List<PromotionModel>> getActivePromotions() async {
    final response = await _apiClient.get(
      ApiConstants.promotions,
      queryParams: {'active': true},
    );
    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List<dynamic>? ?? [])
        .map((item) => PromotionModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
