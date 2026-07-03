import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcl_app/features/merchant/presentation/cubit/merchant_state.dart';

class MerchantCubit extends Cubit<MerchantState> {
  MerchantCubit() : super(const MerchantInitial());

  void loadDashboard() async {
    emit(const MerchantLoading());
    // Implementar carga de datos del dashboard
  }
}
