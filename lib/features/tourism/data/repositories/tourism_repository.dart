import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/tourism/data/datasources/tourism_remote_datasource.dart';
import 'package:rcl_app/features/tourism/domain/entities/attraction.dart';
import 'package:rcl_app/features/tourism/domain/repositories/tourism_repository_contract.dart';

class TourismRepository implements TourismRepositoryContract {
  final TourismRemoteDataSource _dataSource = GetIt.instance<TourismRemoteDataSource>();

  @override
  Future<Either<String, List<Attraction>>> getAttractions({int page = 1, String? category}) async {
    try {
      final items = await _dataSource.getAttractions(page: page, category: category);
      return Right(items.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
