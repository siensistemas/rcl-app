import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/businesses/data/datasources/business_remote_datasource.dart';
import 'package:rcl_app/features/businesses/domain/entities/business.dart';

class BusinessRepository {
  final BusinessRemoteDataSource _dataSource = GetIt.instance<BusinessRemoteDataSource>();

  Future<Either<String, List<Business>>> getBusinesses({int page = 1, String? category}) async {
    try {
      final items = await _dataSource.getBusinesses(page: page, category: category);
      return Right(items.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Business>> getBusinessDetail(int id) async {
    try {
      final business = await _dataSource.getBusinessDetail(id);
      return Right(business.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Business>>> searchBusinesses(String query) async {
    try {
      final items = await _dataSource.searchBusinesses(query);
      return Right(items.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Business>>> getNearbyBusinesses(double lat, double lng, {double radius = 5}) async {
    try {
      final items = await _dataSource.getNearbyBusinesses(lat, lng, radius: radius);
      return Right(items.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Business>>> getFeaturedBusinesses() async {
    try {
      final items = await _dataSource.getFeaturedBusinesses();
      return Right(items.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
