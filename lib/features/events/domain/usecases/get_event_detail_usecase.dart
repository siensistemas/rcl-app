import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/events/data/repositories/event_repository.dart';
import 'package:rcl_app/features/events/domain/entities/event.dart';

class GetEventDetailUseCase {
  final EventRepository _repository = GetIt.instance<EventRepository>();

  Future<Either<String, Event>> call(int id) {
    return _repository.getEventDetail(id);
  }
}
