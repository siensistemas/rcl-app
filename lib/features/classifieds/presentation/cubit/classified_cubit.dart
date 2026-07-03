import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcl_app/features/classifieds/presentation/cubit/classified_state.dart';

class ClassifiedCubit extends Cubit<ClassifiedState> {
  ClassifiedCubit() : super(const ClassifiedInitial());

  void loadClassifieds() async {
    emit(const ClassifiedLoading());
    // Implementar carga de clasificados
  }
}
