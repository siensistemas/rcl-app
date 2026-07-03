import 'package:dartz/dartz.dart';
import 'package:rcl_app/features/auth/domain/entities/user.dart';

abstract class AuthRepositoryContract {
  Future<Either<String, User>> login(String username, String password);
  Future<Either<String, User>> register(String username, String email, String password, String? fullName);
  Future<Either<String, void>> logout();
  Future<Either<String, User>> refreshToken();
  Future<Either<String, void>> forgotPassword(String email);
  Future<Either<String, void>> verifyEmail(String code);
  Future<Either<String, User>> getCurrentUser();
}
