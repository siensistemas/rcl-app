import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/classifieds/data/repositories/classified_repository.dart';
import 'package:rcl_app/features/classifieds/domain/entities/classified.dart';

class GetClassifiedsUseCase {
  final ClassifiedRepository _repository = GetIt.instance<ClassifiedRepository>();

  Future<Either<String, List<Classified>>> call({int page = 1, String? category}) {
    return _repository.getClassifieds(page: page, category: category);
  }
}
