import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_cubit.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_state.dart';
import 'package:rcl_app/features/businesses/presentation/widgets/business_card.dart';

class BusinessListPage extends StatefulWidget {
  const BusinessListPage({super.key});

  @override
  State<BusinessListPage> createState() => _BusinessListPageState();
}

class _BusinessListPageState extends State<BusinessListPage> {
  @override
  void initState() {
    super.initState();
    context.read<BusinessCubit>().getBusinesses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comercios')),
      body: BlocBuilder<BusinessCubit, BusinessState>(
        builder: (context, state) {
          if (state is BusinessLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BusinessError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is BusinessLoaded) {
            if (state.businesses.isEmpty) {
              return const Center(child: Text('No hay comercios disponibles'));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.businesses.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return BusinessCard(
                  business: state.businesses[index],
                  onTap: () {
                    context.push(AppRoutes.businessDetail);
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
