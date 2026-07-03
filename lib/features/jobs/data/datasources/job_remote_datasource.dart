import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/jobs/data/models/job_model.dart';

class JobRemoteDataSource {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

  Future<List<JobModel>> getJobs({int page = 1, String? category}) async {
    final params = <String, dynamic>{'page': page};
    if (category != null) params['category'] = category;
    final response = await _apiClient.get(ApiConstants.jobs, queryParams: params);
    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List<dynamic>? ?? [])
        .map((item) => JobModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<JobModel> getJobDetail(int id) async {
    final response = await _apiClient.get('${ApiConstants.jobs}$id/');
    return JobModel.fromJson(response.data as Map<String, dynamic>);
  }
}
