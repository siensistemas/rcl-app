import 'package:dartz/dartz.dart';
import 'package:rcl_app/features/events/domain/entities/event.dart';

abstract class EventRepositoryContract {
  Future<Either<String, List<Event>>> getEvents({int page = 1, String? category});
  Future<Either<String, Event>> getEventDetail(int id);
}
