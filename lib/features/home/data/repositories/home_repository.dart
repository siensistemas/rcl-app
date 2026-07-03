import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:rcl_app/features/home/domain/repositories/home_repository_contract.dart';

class HomeRepository implements HomeRepositoryContract {
  final HomeRemoteDataSource _dataSource = GetIt.instance<HomeRemoteDataSource>();

  @override
  Future<Either<String, HomeData>> getHomeData() async {
    try {
      final featured = (await _dataSource.getFeaturedBusinesses())
          .map((m) => m.toEntity())
          .toList();
      final active = (await _dataSource.getActivePromotions())
          .map((m) => m.toEntity())
          .toList();
      return Right(HomeData(featuredBusinesses: featured, activePromotions: active));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
