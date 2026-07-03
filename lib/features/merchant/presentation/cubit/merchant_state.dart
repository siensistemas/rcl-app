import 'package:equatable/equatable.dart';
import 'package:rcl_app/features/merchant/data/models/merchant_business_model.dart';
import 'package:rcl_app/features/merchant/data/models/merchant_stats_model.dart';

abstract class MerchantState extends Equatable {
  const MerchantState();

  @override
  List<Object?> get props => [];
}

class MerchantInitial extends MerchantState {
  const MerchantInitial();
}

class MerchantLoading extends MerchantState {
  const MerchantLoading();
}

class MerchantLoaded extends MerchantState {
  final List<MerchantBusinessModel> businesses;
  final MerchantStatsModel? stats;

  const MerchantLoaded({required this.businesses, this.stats});

  @override
  List<Object?> get props => [businesses, stats];
}

class MerchantError extends MerchantState {
  final String message;

  const MerchantError(this.message);

  @override
  List<Object?> get props => [message];
}
