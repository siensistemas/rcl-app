import 'package:dartz/dartz.dart';
import 'package:rcl_app/features/tourism/domain/entities/attraction.dart';

abstract class TourismRepositoryContract {
  Future<Either<String, List<Attraction>>> getAttractions({int page = 1, String? category});
}
