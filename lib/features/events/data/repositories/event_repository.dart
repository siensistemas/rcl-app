import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/events/data/datasources/event_remote_datasource.dart';
import 'package:rcl_app/features/events/domain/entities/event.dart';
import 'package:rcl_app/features/events/domain/repositories/event_repository_contract.dart';

class EventRepository implements EventRepositoryContract {
  final EventRemoteDataSource _dataSource = GetIt.instance<EventRemoteDataSource>();

  @override
  Future<Either<String, List<Event>>> getEvents({int page = 1, String? category}) async {
    try {
      final items = await _dataSource.getEvents(page: page, category: category);
      return Right(items.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Event>> getEventDetail(int id) async {
    try {
      final event = await _dataSource.getEventDetail(id);
      return Right(event.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
