import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/auth/domain/entities/user.dart';
import 'package:rcl_app/features/profile/data/repositories/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository _repository = GetIt.instance<ProfileRepository>();

  Future<Either<String, User>> call(Map<String, dynamic> data) {
    return _repository.updateProfile(data);
  }
}
