import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';
import 'package:rcl_app/features/merchant/presentation/widgets/stats_card.dart';
import 'package:rcl_app/features/merchant/presentation/widgets/business_list_tile.dart';

class MerchantDashboardPage extends StatelessWidget {
  const MerchantDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Comercio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push(AppRoutes.merchantBusinessForm),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Resumen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: StatsCard(title: 'Vistas Hoy', value: '0', icon: Icons.visibility)),
                const SizedBox(width: 8),
                Expanded(child: StatsCard(title: 'Cupones', value: '0', icon: Icons.local_offer)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: StatsCard(title: 'Promociones', value: '0', icon: Icons.campaign)),
                const SizedBox(width: 8),
                Expanded(child: StatsCard(title: 'Rating', value: '0.0', icon: Icons.star)),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Mis Comercios', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const BusinessListTile(),
          ],
        ),
      ),
    );
  }
}
