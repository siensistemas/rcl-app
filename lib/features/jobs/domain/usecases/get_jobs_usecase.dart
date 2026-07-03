import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/jobs/data/repositories/job_repository.dart';
import 'package:rcl_app/features/jobs/domain/entities/job.dart';

class GetJobsUseCase {
  final JobRepository _repository = GetIt.instance<JobRepository>();

  Future<Either<String, List<Job>>> call({int page = 1, String? category}) {
    return _repository.getJobs(page: page, category: category);
  }
}
