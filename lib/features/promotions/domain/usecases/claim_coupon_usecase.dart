import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/promotions/data/repositories/promotion_repository.dart';

class ClaimCouponUseCase {
  final PromotionRepository _repository = GetIt.instance<PromotionRepository>();

  Future<Either<String, void>> call(int promotionId) {
    return _repository.claimCoupon(promotionId);
  }
}
