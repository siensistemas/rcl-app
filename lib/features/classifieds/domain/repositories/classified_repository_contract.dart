import 'package:dartz/dartz.dart';
import 'package:rcl_app/features/classifieds/domain/entities/classified.dart';

abstract class ClassifiedRepositoryContract {
  Future<Either<String, List<Classified>>> getClassifieds({int page = 1, String? category});
  Future<Either<String, Classified>> getClassifiedDetail(int id);
}
