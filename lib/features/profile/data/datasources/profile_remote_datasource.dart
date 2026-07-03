import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/auth/data/models/user_model.dart';

class ProfileRemoteDataSource {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

  Future<UserModel> getProfile() async {
    final response = await _apiClient.get(ApiConstants.profile);
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<UserModel> updateProfile(Map<String, dynamic> data) async {
    final response = await _apiClient.put(ApiConstants.profile, data: data);
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> changePassword(String currentPassword, String newPassword) async {
    await _apiClient.put('${ApiConstants.profile}change-password/', data: {
      'current_password': currentPassword,
      'new_password': newPassword,
    });
  }
}
