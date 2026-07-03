import 'package:dartz/dartz.dart';
import 'package:rcl_app/features/jobs/domain/entities/job.dart';

abstract class JobRepositoryContract {
  Future<Either<String, List<Job>>> getJobs({int page = 1, String? category});
  Future<Either<String, Job>> getJobDetail(int id);
}
