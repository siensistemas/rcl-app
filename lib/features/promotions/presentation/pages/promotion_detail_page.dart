import 'package:flutter/material.dart';
import 'package:rcl_app/core/widgets/custom_button.dart';
import 'package:rcl_app/core/widgets/custom_image.dart';

class PromotionDetailPage extends StatelessWidget {
  const PromotionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomImage(
                imageUrl: null,
                width: double.infinity,
                height: 250,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Título de la Promoción', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Comercio: Nombre del Comercio', style: TextStyle(fontSize: 16, color: Colors.blue)),
                  const SizedBox(height: 16),
                  const Text(
                    'Descripción detallada de la promoción con toda la información relevante para el usuario.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  const Text('Válido hasta: 31 Dic 2025', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 32),
                  CustomButton(
                    onPressed: () {},
                    text: 'Reclamar Cupón',
                    icon: Icons.discount,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
