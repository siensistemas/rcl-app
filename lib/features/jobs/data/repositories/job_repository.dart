import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/jobs/data/datasources/job_remote_datasource.dart';
import 'package:rcl_app/features/jobs/domain/entities/job.dart';
import 'package:rcl_app/features/jobs/domain/repositories/job_repository_contract.dart';

class JobRepository implements JobRepositoryContract {
  final JobRemoteDataSource _dataSource = GetIt.instance<JobRemoteDataSource>();

  @override
  Future<Either<String, List<Job>>> getJobs({int page = 1, String? category}) async {
    try {
      final items = await _dataSource.getJobs(page: page, category: category);
      return Right(items.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Job>> getJobDetail(int id) async {
    try {
      final job = await _dataSource.getJobDetail(id);
      return Right(job.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
