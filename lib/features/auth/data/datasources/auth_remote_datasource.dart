import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/features/auth/data/models/auth_response.dart';
import 'package:rcl_app/features/auth/data/models/user_model.dart';

class AuthRemoteDataSource {
  final ApiClient _apiClient = GetIt.instance<ApiClient>();

  Future<AuthResponse> login(String username, String password) async {
    final response = await _apiClient.post(
      ApiConstants.login,
      data: {'username': username, 'password': password},
    );
    return AuthResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<AuthResponse> register(String username, String email, String password, String? fullName) async {
    final response = await _apiClient.post(
      ApiConstants.register,
      data: {
        'username': username,
        'email': email,
        'password': password,
        'full_name': fullName,
      },
    );
    return AuthResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> logout() async {
    await _apiClient.post(ApiConstants.logout);
  }

  Future<AuthResponse> refreshToken(String refreshToken) async {
    final response = await _apiClient.post(
      ApiConstants.refreshToken,
      data: {'refresh_token': refreshToken},
    );
    return AuthResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> forgotPassword(String email) async {
    await _apiClient.post(ApiConstants.forgotPassword, data: {'email': email});
  }

  Future<void> verifyEmail(String code) async {
    await _apiClient.post(ApiConstants.verifyEmail, data: {'code': code});
  }

  Future<UserModel> getCurrentUser() async {
    final response = await _apiClient.get(ApiConstants.profile);
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }
}
