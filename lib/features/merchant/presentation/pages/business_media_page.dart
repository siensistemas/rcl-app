import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';
import 'package:rcl_app/core/widgets/custom_button.dart';

class BusinessMediaPage extends StatelessWidget {
  const BusinessMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fotos del Comercio')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Column(
                children: [
                  Icon(Icons.add_photo_alternate, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Agrega fotos de tu comercio', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Logo, portada y galería', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              onPressed: () => context.push(AppRoutes.merchantHours),
              text: 'Siguiente: Horarios',
            ),
          ],
        ),
      ),
    );
  }
}
