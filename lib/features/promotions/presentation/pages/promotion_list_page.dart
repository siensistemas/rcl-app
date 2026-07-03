import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';
import 'package:rcl_app/features/promotions/presentation/cubit/promotion_cubit.dart';
import 'package:rcl_app/features/promotions/presentation/cubit/promotion_state.dart';
import 'package:rcl_app/features/promotions/presentation/widgets/promotion_card.dart';

class PromotionListPage extends StatefulWidget {
  const PromotionListPage({super.key});

  @override
  State<PromotionListPage> createState() => _PromotionListPageState();
}

class _PromotionListPageState extends State<PromotionListPage> {
  @override
  void initState() {
    super.initState();
    context.read<PromotionCubit>().getPromotions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Promociones')),
      body: BlocBuilder<PromotionCubit, PromotionState>(
        builder: (context, state) {
          if (state is PromotionLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PromotionError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is PromotionLoaded) {
            if (state.promotions.isEmpty) {
              return const Center(child: Text('No hay promociones disponibles'));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.promotions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return PromotionCard(
                  promotion: state.promotions[index],
                  onTap: () {
                    context.push(AppRoutes.promotionDetail);
                  },
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
