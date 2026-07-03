import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/promotions/data/models/promotion_model.dart';
import 'package:rcl_app/features/promotions/domain/entities/promotion.dart';

class PromotionRepository {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

  Future<Either<String, List<Promotion>>> getPromotions({int page = 1}) async {
    try {
      final response = await _apiClient.get(ApiConstants.promotions, queryParams: {'page': page});
      final data = response.data as Map<String, dynamic>;
      final items = (data['results'] as List<dynamic>? ?? [])
          .map((item) => PromotionModel.fromJson(item as Map<String, dynamic>).toEntity())
          .toList();
      return Right(items);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Promotion>>> getActivePromotions() async {
    try {
      final response = await _apiClient.get(ApiConstants.promotions, queryParams: {'active': true});
      final data = response.data as Map<String, dynamic>;
      final items = (data['results'] as List<dynamic>? ?? [])
          .map((item) => PromotionModel.fromJson(item as Map<String, dynamic>).toEntity())
          .toList();
      return Right(items);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> claimCoupon(int promotionId) async {
    try {
      await _apiClient.post('${ApiConstants.promotions}$promotionId/claim/');
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Promotion>>> getMyCoupons() async {
    try {
      final response = await _apiClient.get(ApiConstants.coupons);
      final data = response.data as Map<String, dynamic>;
      final items = (data['results'] as List<dynamic>? ?? [])
          .map((item) => PromotionModel.fromJson(item as Map<String, dynamic>).toEntity())
          .toList();
      return Right(items);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
