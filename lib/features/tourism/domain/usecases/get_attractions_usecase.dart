import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/tourism/data/repositories/tourism_repository.dart';
import 'package:rcl_app/features/tourism/domain/entities/attraction.dart';

class GetAttractionsUseCase {
  final TourismRepository _repository = GetIt.instance<TourismRepository>();

  Future<Either<String, List<Attraction>>> call({int page = 1, String? category}) {
    return _repository.getAttractions(page: page, category: category);
  }
}
