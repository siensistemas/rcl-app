import 'package:equatable/equatable.dart';
import 'package:rcl_app/features/businesses/domain/entities/business.dart';
import 'package:rcl_app/features/promotions/domain/entities/promotion.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<Business> featuredBusinesses;
  final List<Promotion> promotions;

  const HomeLoaded({
    required this.featuredBusinesses,
    required this.promotions,
  });

  @override
  List<Object?> get props => [featuredBusinesses, promotions];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
