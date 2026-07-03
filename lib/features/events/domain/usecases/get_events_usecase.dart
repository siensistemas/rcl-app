import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/events/data/repositories/event_repository.dart';
import 'package:rcl_app/features/events/domain/entities/event.dart';

class GetEventsUseCase {
  final EventRepository _repository = GetIt.instance<EventRepository>();

  Future<Either<String, List<Event>>> call({int page = 1, String? category}) {
    return _repository.getEvents(page: page, category: category);
  }
}
