import 'package:dartz/dartz.dart';
import 'package:rcl_app/features/businesses/domain/entities/business.dart';
import 'package:rcl_app/features/promotions/domain/entities/promotion.dart';

class HomeData {
  final List<Business> featuredBusinesses;
  final List<Promotion> activePromotions;

  const HomeData({
    required this.featuredBusinesses,
    required this.activePromotions,
  });
}

abstract class HomeRepositoryContract {
  Future<Either<String, HomeData>> getHomeData();
}
