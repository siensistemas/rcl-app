import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/auth/domain/repositories/auth_repository_contract.dart';

class LogoutUseCase {
  final AuthRepositoryContract _repository = GetIt.instance<AuthRepositoryContract>();

  Future<Either<String, void>> call() {
    return _repository.logout();
  }
}
