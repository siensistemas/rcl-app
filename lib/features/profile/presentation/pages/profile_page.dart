import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcl_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rcl_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rcl_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:rcl_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:rcl_app/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:rcl_app/features/profile/presentation/widgets/profile_stats.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              const ProfileHeader(),
              const SizedBox(height: 16),
              const ProfileStats(),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ProfileMenuItem(icon: Icons.person, title: 'Editar Perfil', route: '/profile/edit'),
                    ProfileMenuItem(icon: Icons.notifications, title: 'Notificaciones', route: '/notifications'),
                    ProfileMenuItem(icon: Icons.local_offer, title: 'Mis Cupones', route: '/coupons'),
                    ProfileMenuItem(icon: Icons.storefront, title: 'Mi Comercio', route: '/merchant'),
                    Divider(),
                    ProfileMenuItem(icon: Icons.settings, title: 'Configuración', route: '/settings'),
                    ProfileMenuItem(icon: Icons.help, title: 'Ayuda', route: ''),
                    ProfileMenuItem(icon: Icons.info, title: 'Acerca de', route: ''),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton.icon(
                  onPressed: () => context.read<AuthCubit>().logout(),
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
                ),
              ),
              const SizedBox(height: 32),
            ],
          );
        },
      ),
    );
  }
}
