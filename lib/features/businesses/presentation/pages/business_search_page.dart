import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_cubit.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_state.dart';
import 'package:rcl_app/features/businesses/presentation/widgets/business_card.dart';

class BusinessSearchPage extends StatefulWidget {
  const BusinessSearchPage({super.key});

  @override
  State<BusinessSearchPage> createState() => _BusinessSearchPageState();
}

class _BusinessSearchPageState extends State<BusinessSearchPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(hintText: 'Buscar...', border: InputBorder.none),
          autofocus: true,
          onSubmitted: (query) {
            context.read<BusinessCubit>().searchBusinesses(query);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.read<BusinessCubit>().searchBusinesses(_searchController.text);
            },
          ),
        ],
      ),
      body: BlocBuilder<BusinessCubit, BusinessState>(
        builder: (context, state) {
          if (state is BusinessLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BusinessLoaded) {
            if (state.businesses.isEmpty) {
              return const Center(child: Text('No se encontraron resultados'));
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
          return const Center(child: Text('Busca tu comercio favorito'));
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
