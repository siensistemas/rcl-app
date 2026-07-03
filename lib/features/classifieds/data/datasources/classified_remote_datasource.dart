import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/classifieds/data/models/classified_model.dart';

class ClassifiedRemoteDataSource {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

  Future<List<ClassifiedModel>> getClassifieds({int page = 1, String? category}) async {
    final params = <String, dynamic>{'page': page};
    if (category != null) params['category'] = category;
    final response = await _apiClient.get(ApiConstants.classifieds, queryParams: params);
    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List<dynamic>? ?? [])
        .map((item) => ClassifiedModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<ClassifiedModel> getClassifiedDetail(int id) async {
    final response = await _apiClient.get('${ApiConstants.classifieds}$id/');
    return ClassifiedModel.fromJson(response.data as Map<String, dynamic>);
  }
}
