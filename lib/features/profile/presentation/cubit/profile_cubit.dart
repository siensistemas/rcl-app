import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcl_app/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileInitial());

  void loadProfile() async {
    emit(const ProfileLoading());
    // Implementar carga de perfil
  }
}
