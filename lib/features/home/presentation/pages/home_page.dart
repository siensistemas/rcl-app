import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_cubit.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_state.dart';
import 'package:rcl_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:rcl_app/features/home/presentation/cubit/home_state.dart';
import 'package:rcl_app/features/home/widgets/category_grid.dart';
import 'package:rcl_app/features/home/widgets/search_bar.dart';
import 'package:rcl_app/features/home/widgets/business_card.dart';
import 'package:rcl_app/features/home/widgets/promotion_carousel.dart';
import 'package:rcl_app/features/auth/presentation/cubit/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RCL - Red Comercial Local'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              context.push(AppRoutes.notifications);
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeCubit>().loadHomeData();
          context.read<BusinessCubit>().getFeaturedBusinesses();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBarWidget(),
              const SizedBox(height: 24),
              const Text('Categorías', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const CategoryGrid(),
              const SizedBox(height: 24),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is HomeLoaded && state.promotions.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Promociones Destacadas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        PromotionCarousel(promotions: state.promotions),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 24),
              const Text('Comercios Destacados', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              BlocBuilder<BusinessCubit, BusinessState>(
                builder: (context, state) {
                  if (state is BusinessLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is FeaturedBusinessesLoaded) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.businesses.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return BusinessCardWidget(business: state.businesses[index]);
                      },
                    );
                  }
                  if (state is BusinessError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Icon(Icons.store, size: 60, color: Colors.white),
                SizedBox(height: 8),
                Text('RCL', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ListTile(leading: const Icon(Icons.home), title: const Text('Inicio'), onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.storefront), title: const Text('Mi Comercio'), onTap: () => context.push(AppRoutes.merchant)),
          ListTile(leading: const Icon(Icons.local_offer), title: const Text('Mis Cupones'), onTap: () => context.push(AppRoutes.coupons)),
          ListTile(leading: const Icon(Icons.event), title: const Text('Eventos'), onTap: () => context.push(AppRoutes.events)),
          ListTile(leading: const Icon(Icons.tour), title: const Text('Turismo'), onTap: () => context.push(AppRoutes.tourism)),
          ListTile(leading: const Icon(Icons.work), title: const Text('Empleos'), onTap: () => context.push(AppRoutes.jobs)),
          const Divider(),
          ListTile(leading: const Icon(Icons.person), title: const Text('Perfil'), onTap: () => context.push(AppRoutes.profile)),
          ListTile(leading: const Icon(Icons.settings), title: const Text('Configuración'), onTap: () => context.push(AppRoutes.settings)),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            onTap: () => context.read<AuthCubit>().logout(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
        BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Comercios'),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Promociones'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case 0: break;
          case 1: context.push(AppRoutes.search);
          case 2: context.push(AppRoutes.businesses);
          case 3: context.push(AppRoutes.promotions);
          case 4: context.push(AppRoutes.profile);
        }
      },
    );
  }
}
