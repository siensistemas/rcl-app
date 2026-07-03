import 'package:flutter/material.dart';
import 'package:rcl_app/core/widgets/custom_button.dart';
import 'package:rcl_app/core/widgets/custom_image.dart';

class ClassifiedDetailPage extends StatelessWidget {
  const ClassifiedDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomImage(imageUrl: null, width: double.infinity, height: 250),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Título del Anuncio', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('\$100.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      Text('Ubicación', style: TextStyle(color: Colors.grey[600])),
                      const Spacer(),
                      const Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('Hace 2 días', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Descripción detallada del anuncio clasificado con toda la información relevante.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(onPressed: () {}, text: 'Contactar', icon: Icons.chat),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
