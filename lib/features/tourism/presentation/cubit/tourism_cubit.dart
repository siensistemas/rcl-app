import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcl_app/features/tourism/presentation/cubit/tourism_state.dart';

class TourismCubit extends Cubit<TourismState> {
  TourismCubit() : super(const TourismInitial());

  void loadAttractions() async {
    emit(const TourismLoading());
    // Implementar carga de atracciones
  }
}
