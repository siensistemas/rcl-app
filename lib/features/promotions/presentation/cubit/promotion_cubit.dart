import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/promotions/domain/usecases/get_promotions_usecase.dart';
import 'package:rcl_app/features/promotions/domain/usecases/get_active_promotions_usecase.dart';
import 'package:rcl_app/features/promotions/domain/usecases/claim_coupon_usecase.dart';
import 'package:rcl_app/features/promotions/presentation/cubit/promotion_state.dart';

class PromotionCubit extends Cubit<PromotionState> {
  final GetPromotionsUseCase _getPromotions = GetIt.instance<GetPromotionsUseCase>();
  final GetActivePromotionsUseCase _getActivePromotions = GetIt.instance<GetActivePromotionsUseCase>();
  final ClaimCouponUseCase _claimCoupon = GetIt.instance<ClaimCouponUseCase>();

  PromotionCubit() : super(const PromotionInitial());

  void getPromotions({int page = 1}) async {
    emit(const PromotionLoading());
    try {
      final result = await _getPromotions(page: page);
      result.fold(
        (failure) => emit(PromotionError(failure)),
        (promotions) => emit(PromotionLoaded(promotions)),
      );
    } catch (e) {
      emit(PromotionError(e.toString()));
    }
  }

  void getActivePromotions() async {
    emit(const PromotionLoading());
    try {
      final result = await _getActivePromotions();
      result.fold(
        (failure) => emit(PromotionError(failure)),
        (promotions) => emit(PromotionLoaded(promotions)),
      );
    } catch (e) {
      emit(PromotionError(e.toString()));
    }
  }

  void claimCoupon(int promotionId) async {
    try {
      final result = await _claimCoupon(promotionId);
      result.fold(
        (failure) => emit(PromotionError(failure)),
        (_) {},
      );
    } catch (e) {
      emit(PromotionError(e.toString()));
    }
  }
}
