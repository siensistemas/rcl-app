import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/promotions/data/repositories/promotion_repository.dart';
import 'package:rcl_app/features/promotions/domain/entities/promotion.dart';

class GetActivePromotionsUseCase {
  final PromotionRepository _repository = GetIt.instance<PromotionRepository>();

  Future<Either<String, List<Promotion>>> call() {
    return _repository.getActivePromotions();
  }
}
