import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/classifieds/data/repositories/classified_repository.dart';
import 'package:rcl_app/features/classifieds/domain/entities/classified.dart';

class GetClassifiedDetailUseCase {
  final ClassifiedRepository _repository = GetIt.instance<ClassifiedRepository>();

  Future<Either<String, Classified>> call(int id) {
    return _repository.getClassifiedDetail(id);
  }
}
