import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/businesses/data/repositories/business_repository.dart';
import 'package:rcl_app/features/businesses/domain/entities/business.dart';

class GetNearbyBusinessesUseCase {
  final BusinessRepository _repository = GetIt.instance<BusinessRepository>();

  Future<Either<String, List<Business>>> call(double lat, double lng, {double radius = 5}) {
    return _repository.getNearbyBusinesses(lat, lng, radius: radius);
  }
}
