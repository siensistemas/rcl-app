import 'package:dio/dio.dart';
import 'package:rcl_app/core/constants/api_constants.dart';
import 'package:rcl_app/core/network/api_interceptor.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    _dio.interceptors.add(ApiInterceptor());
    if (ApiConstants.isDevelopment) {
      _dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  Dio get dio => _dio;

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(path, queryParameters: queryParams);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> patch(String path, {dynamic data}) async {
    try {
      return await _dio.patch(path, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  ApiException _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiException('Error de conexión - Tiempo de espera agotado');
      case DioExceptionType.receiveTimeout:
        return const ApiException('Error de conexión - Tiempo de espera agotado');
      case DioExceptionType.badResponse:
        final response = error.response;
        if (response != null) {
          final data = response.data;
          if (data is Map) {
            final message = data['message'] ?? data['detail'] ?? data['error'];
            if (message is String) {
              return ApiException(message, statusCode: response.statusCode);
            }
          }
          return ApiException('Error en el servidor (${response.statusCode})', statusCode: response.statusCode);
        }
        return const ApiException('Error en la conexión');
      case DioExceptionType.cancel:
        return const ApiException('Petición cancelada');
      default:
        return ApiException('Error inesperado: ${error.message}');
    }
  }
}
