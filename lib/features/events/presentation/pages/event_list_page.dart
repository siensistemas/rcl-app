import 'package:flutter/material.dart';
import 'package:rcl_app/features/events/presentation/widgets/event_card.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eventos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          EventCard(),
          EventCard(),
          EventCard(),
        ],
      ),
    );
  }
}
