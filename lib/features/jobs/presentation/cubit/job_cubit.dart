import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcl_app/features/jobs/presentation/cubit/job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(const JobInitial());

  void loadJobs() async {
    emit(const JobLoading());
    // Implementar carga de empleos
  }
}
