import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/jobs/data/repositories/job_repository.dart';
import 'package:rcl_app/features/jobs/domain/entities/job.dart';

class GetJobDetailUseCase {
  final JobRepository _repository = GetIt.instance<JobRepository>();

  Future<Either<String, Job>> call(int id) {
    return _repository.getJobDetail(id);
  }
}
