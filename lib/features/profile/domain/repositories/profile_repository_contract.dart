import 'package:dartz/dartz.dart';
import 'package:rcl_app/features/auth/domain/entities/user.dart';

abstract class ProfileRepositoryContract {
  Future<Either<String, User>> getProfile();
  Future<Either<String, User>> updateProfile(Map<String, dynamic> data);
  Future<Either<String, void>> changePassword(String currentPassword, String newPassword);
}
