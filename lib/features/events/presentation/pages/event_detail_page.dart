import 'package:flutter/material.dart';
import 'package:rcl_app/core/widgets/custom_button.dart';
import 'package:rcl_app/core/widgets/custom_image.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomImage(imageUrl: null, width: double.infinity, height: 200),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Título del Evento', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 4),
                      const Text('15 Jul 2025', style: TextStyle(fontSize: 14)),
                      const SizedBox(width: 16),
                      const Icon(Icons.access_time, size: 16),
                      const SizedBox(width: 4),
                      const Text('18:00', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('Dirección del evento', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Descripción detallada del evento con toda la información relevante para los asistentes.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(onPressed: () {}, text: 'Asistiré', icon: Icons.event_available),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
