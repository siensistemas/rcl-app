import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/classifieds/data/datasources/classified_remote_datasource.dart';
import 'package:rcl_app/features/classifieds/domain/entities/classified.dart';
import 'package:rcl_app/features/classifieds/domain/repositories/classified_repository_contract.dart';

class ClassifiedRepository implements ClassifiedRepositoryContract {
  final ClassifiedRemoteDataSource _dataSource = GetIt.instance<ClassifiedRemoteDataSource>();

  @override
  Future<Either<String, List<Classified>>> getClassifieds({int page = 1, String? category}) async {
    try {
      final items = await _dataSource.getClassifieds(page: page, category: category);
      return Right(items.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Classified>> getClassifiedDetail(int id) async {
    try {
      final classified = await _dataSource.getClassifiedDetail(id);
      return Right(classified.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
