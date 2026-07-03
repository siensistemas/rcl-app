import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/storage/secure_storage.dart';
import 'package:rcl_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:rcl_app/features/auth/domain/entities/user.dart';
import 'package:rcl_app/features/auth/domain/repositories/auth_repository_contract.dart';

class AuthRepository implements AuthRepositoryContract {
  final AuthRemoteDataSource _dataSource = GetIt.instance<AuthRemoteDataSource>();
  final SecureStorage _storage = GetIt.instance<SecureStorage>();

  @override
  Future<Either<String, User>> login(String username, String password) async {
    try {
      final response = await _dataSource.login(username, password);
      await _storage.saveAccessToken(response.accessToken);
      await _storage.saveRefreshToken(response.refreshToken);
      await _storage.saveUserData(jsonEncode(response.user.toJson()));
      return Right(response.user.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> register(String username, String email, String password, String? fullName) async {
    try {
      final response = await _dataSource.register(username, email, password, fullName);
      await _storage.saveAccessToken(response.accessToken);
      await _storage.saveRefreshToken(response.refreshToken);
      return Right(response.user.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> logout() async {
    try {
      await _dataSource.logout();
      await _storage.clearTokens();
      return const Right(null);
    } catch (e) {
      await _storage.clearTokens();
      return const Right(null);
    }
  }

  @override
  Future<Either<String, User>> refreshToken() async {
    try {
      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken == null) {
        return const Left('No refresh token available');
      }
      final response = await _dataSource.refreshToken(refreshToken);
      await _storage.saveAccessToken(response.accessToken);
      await _storage.saveRefreshToken(response.refreshToken);
      return Right(response.user.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> forgotPassword(String email) async {
    try {
      await _dataSource.forgotPassword(email);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> verifyEmail(String code) async {
    try {
      await _dataSource.verifyEmail(code);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> getCurrentUser() async {
    try {
      final user = await _dataSource.getCurrentUser();
      return Right(user.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
