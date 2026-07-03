import 'package:equatable/equatable.dart';
import 'package:rcl_app/features/promotions/domain/entities/promotion.dart';

abstract class PromotionState extends Equatable {
  const PromotionState();

  @override
  List<Object?> get props => [];
}

class PromotionInitial extends PromotionState {
  const PromotionInitial();
}

class PromotionLoading extends PromotionState {
  const PromotionLoading();
}

class PromotionLoaded extends PromotionState {
  final List<Promotion> promotions;

  const PromotionLoaded(this.promotions);

  @override
  List<Object?> get props => [promotions];
}

class PromotionError extends PromotionState {
  final String message;

  const PromotionError(this.message);

  @override
  List<Object?> get props => [message];
}
