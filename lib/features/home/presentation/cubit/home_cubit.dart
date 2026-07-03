import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcl_app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void loadHomeData() async {
    emit(const HomeLoading());
    // Implementar carga de datos
  }
}
