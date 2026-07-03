import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';

class BusinessListTile extends StatelessWidget {
  const BusinessListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.store),
        ),
        title: const Text('Nombre del Comercio'),
        subtitle: const Text('0 promociones activas'),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'edit':
                context.push(AppRoutes.merchantBusinessForm);
              case 'promotions':
                context.push(AppRoutes.merchantPromotionForm);
              case 'analytics':
                context.push(AppRoutes.merchantAnalytics);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'edit', child: Text('Editar')),
            const PopupMenuItem(value: 'promotions', child: Text('Promociones')),
            const PopupMenuItem(value: 'analytics', child: Text('Analíticas')),
          ],
        ),
      ),
    );
  }
}
