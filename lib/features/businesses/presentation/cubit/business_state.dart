import 'package:equatable/equatable.dart';
import 'package:rcl_app/features/businesses/domain/entities/business.dart';

abstract class BusinessState extends Equatable {
  const BusinessState();

  @override
  List<Object?> get props => [];
}

class BusinessInitial extends BusinessState {
  const BusinessInitial();
}

class BusinessLoading extends BusinessState {
  const BusinessLoading();
}

class BusinessLoaded extends BusinessState {
  final List<Business> businesses;

  const BusinessLoaded(this.businesses);

  @override
  List<Object?> get props => [businesses];
}

class FeaturedBusinessesLoaded extends BusinessState {
  final List<Business> businesses;

  const FeaturedBusinessesLoaded(this.businesses);

  @override
  List<Object?> get props => [businesses];
}

class BusinessDetailLoaded extends BusinessState {
  final Business business;

  const BusinessDetailLoaded(this.business);

  @override
  List<Object?> get props => [business];
}

class BusinessError extends BusinessState {
  final String message;

  const BusinessError(this.message);

  @override
  List<Object?> get props => [message];
}
