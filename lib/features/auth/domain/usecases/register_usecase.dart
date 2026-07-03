import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/auth/domain/entities/user.dart';
import 'package:rcl_app/features/auth/domain/repositories/auth_repository_contract.dart';

class RegisterParams {
  final String username;
  final String email;
  final String password;
  final String? fullName;

  const RegisterParams({
    required this.username,
    required this.email,
    required this.password,
    this.fullName,
  });
}

class RegisterUseCase {
  final AuthRepositoryContract _repository = GetIt.instance<AuthRepositoryContract>();

  Future<Either<String, User>> call(RegisterParams params) {
    return _repository.register(params.username, params.email, params.password, params.fullName);
  }
}
