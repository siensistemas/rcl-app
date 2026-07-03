import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/home/data/repositories/home_repository.dart';
import 'package:rcl_app/features/home/domain/repositories/home_repository_contract.dart';

class GetHomeDataUseCase {
  final HomeRepository _repository = GetIt.instance<HomeRepository>();

  Future<Either<String, HomeData>> call() {
    return _repository.getHomeData();
  }
}
