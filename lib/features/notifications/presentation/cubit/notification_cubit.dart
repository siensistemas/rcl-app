import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcl_app/features/notifications/presentation/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationInitial());

  void loadNotifications() async {
    emit(const NotificationLoading());
    // Implementar carga de notificaciones
  }
}
