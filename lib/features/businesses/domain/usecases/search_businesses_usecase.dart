import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/businesses/data/repositories/business_repository.dart';
import 'package:rcl_app/features/businesses/domain/entities/business.dart';

class SearchBusinessesUseCase {
  final BusinessRepository _repository = GetIt.instance<BusinessRepository>();

  Future<Either<String, List<Business>>> call(String query) {
    return _repository.searchBusinesses(query);
  }
}
