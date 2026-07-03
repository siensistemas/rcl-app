import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/businesses/domain/usecases/get_businesses_usecase.dart';
import 'package:rcl_app/features/businesses/domain/usecases/get_business_detail_usecase.dart';
import 'package:rcl_app/features/businesses/domain/usecases/search_businesses_usecase.dart';
import 'package:rcl_app/features/businesses/domain/usecases/get_nearby_businesses_usecase.dart';
import 'package:rcl_app/features/businesses/domain/usecases/get_featured_businesses_usecase.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_state.dart';

class BusinessCubit extends Cubit<BusinessState> {
  final GetBusinessesUseCase _getBusinesses = GetIt.instance<GetBusinessesUseCase>();
  final GetBusinessDetailUseCase _getBusinessDetail = GetIt.instance<GetBusinessDetailUseCase>();
  final SearchBusinessesUseCase _searchBusinesses = GetIt.instance<SearchBusinessesUseCase>();
  final GetNearbyBusinessesUseCase _getNearbyBusinesses = GetIt.instance<GetNearbyBusinessesUseCase>();
  final GetFeaturedBusinessesUseCase _getFeaturedBusinesses = GetIt.instance<GetFeaturedBusinessesUseCase>();

  BusinessCubit() : super(const BusinessInitial());

  void getBusinesses({int page = 1, String? category}) async {
    emit(const BusinessLoading());
    try {
      final result = await _getBusinesses(page: page, category: category);
      result.fold(
        (failure) => emit(BusinessError(failure)),
        (businesses) => emit(BusinessLoaded(businesses)),
      );
    } catch (e) {
      emit(BusinessError(e.toString()));
    }
  }

  void getBusinessDetail(int id) async {
    emit(const BusinessLoading());
    try {
      final result = await _getBusinessDetail(id);
      result.fold(
        (failure) => emit(BusinessError(failure)),
        (business) => emit(BusinessDetailLoaded(business)),
      );
    } catch (e) {
      emit(BusinessError(e.toString()));
    }
  }

  void searchBusinesses(String query) async {
    emit(const BusinessLoading());
    try {
      final result = await _searchBusinesses(query);
      result.fold(
        (failure) => emit(BusinessError(failure)),
        (businesses) => emit(BusinessLoaded(businesses)),
      );
    } catch (e) {
      emit(BusinessError(e.toString()));
    }
  }

  void getNearbyBusinesses(double lat, double lng) async {
    emit(const BusinessLoading());
    try {
      final result = await _getNearbyBusinesses(lat, lng);
      result.fold(
        (failure) => emit(BusinessError(failure)),
        (businesses) => emit(BusinessLoaded(businesses)),
      );
    } catch (e) {
      emit(BusinessError(e.toString()));
    }
  }

  void getFeaturedBusinesses() async {
    emit(const BusinessLoading());
    try {
      final result = await _getFeaturedBusinesses();
      result.fold(
        (failure) => emit(BusinessError(failure)),
        (businesses) => emit(FeaturedBusinessesLoaded(businesses)),
      );
    } catch (e) {
      emit(BusinessError(e.toString()));
    }
  }
}
