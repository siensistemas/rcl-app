import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/auth/domain/entities/user.dart';
import 'package:rcl_app/features/auth/domain/repositories/auth_repository_contract.dart';

class LoginParams {
  final String username;
  final String password;

  const LoginParams(this.username, this.password);
}

class LoginUseCase {
  final AuthRepositoryContract _repository = GetIt.instance<AuthRepositoryContract>();

  Future<Either<String, User>> call(LoginParams params) {
    return _repository.login(params.username, params.password);
  }
}
