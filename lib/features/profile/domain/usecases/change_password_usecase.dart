import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/profile/data/repositories/profile_repository.dart';

class ChangePasswordUseCase {
  final ProfileRepository _repository = GetIt.instance<ProfileRepository>();

  Future<Either<String, void>> call(String currentPassword, String newPassword) {
    return _repository.changePassword(currentPassword, newPassword);
  }
}
