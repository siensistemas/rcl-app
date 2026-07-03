import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/auth/domain/entities/user.dart';
import 'package:rcl_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:rcl_app/features/profile/domain/repositories/profile_repository_contract.dart';

class ProfileRepository implements ProfileRepositoryContract {
  final ProfileRemoteDataSource _dataSource = GetIt.instance<ProfileRemoteDataSource>();

  @override
  Future<Either<String, User>> getProfile() async {
    try {
      final user = await _dataSource.getProfile();
      return Right(user.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> updateProfile(Map<String, dynamic> data) async {
    try {
      final user = await _dataSource.updateProfile(data);
      return Right(user.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> changePassword(String currentPassword, String newPassword) async {
    try {
      await _dataSource.changePassword(currentPassword, newPassword);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
