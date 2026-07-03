import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/auth/domain/entities/user.dart';
import 'package:rcl_app/features/auth/domain/repositories/auth_repository_contract.dart';

class RefreshTokenUseCase {
  final AuthRepositoryContract _repository = GetIt.instance<AuthRepositoryContract>();

  Future<Either<String, User>> call() {
    return _repository.refreshToken();
  }
}
