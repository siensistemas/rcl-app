import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/merchant/data/models/merchant_business_model.dart';
import 'package:rcl_app/features/merchant/data/models/merchant_stats_model.dart';

class MerchantRepository {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

  Future<Either<String, List<MerchantBusinessModel>>> getMyBusinesses() async {
    try {
      final response = await _apiClient.get(ApiConstants.merchant);
      final data = response.data as Map<String, dynamic>;
      final items = (data['results'] as List<dynamic>? ?? [])
          .map((item) => MerchantBusinessModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return Right(items);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MerchantBusinessModel>> createBusiness(Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.post(ApiConstants.merchant, data: data);
      final business = MerchantBusinessModel.fromJson(response.data as Map<String, dynamic>);
      return Right(business);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MerchantBusinessModel>> updateBusiness(int id, Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.put('${ApiConstants.merchant}/$id', data: data);
      final business = MerchantBusinessModel.fromJson(response.data as Map<String, dynamic>);
      return Right(business);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MerchantStatsModel>> getMerchantStats() async {
    try {
      final response = await _apiClient.get(ApiConstants.merchantStats);
      final stats = MerchantStatsModel.fromJson(response.data as Map<String, dynamic>);
      return Right(stats);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
