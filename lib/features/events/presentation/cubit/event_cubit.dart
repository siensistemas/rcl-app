import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcl_app/features/events/presentation/cubit/event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(const EventInitial());

  void loadEvents() async {
    emit(const EventLoading());
    // Implementar carga de eventos
  }
}
