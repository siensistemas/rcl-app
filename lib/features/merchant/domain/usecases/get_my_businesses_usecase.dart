import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/merchant/data/models/merchant_business_model.dart';
import 'package:rcl_app/features/merchant/data/repositories/merchant_repository.dart';

class GetMyBusinessesUseCase {
  final MerchantRepository _repository = GetIt.instance<MerchantRepository>();

  Future<Either<String, List<MerchantBusinessModel>>> call() {
    return _repository.getMyBusinesses();
  }
}
