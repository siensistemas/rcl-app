import 'package:flutter/material.dart';
import 'package:rcl_app/features/notifications/presentation/widgets/notification_item.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notificaciones')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationItem(
            icon: Icons.local_offer,
            title: 'Nueva Promoción',
            subtitle: '50% OFF en Tu Comercio Favorito',
            time: 'Hace 5 min',
            isUnread: true,
          ),
          NotificationItem(
            icon: Icons.event,
            title: 'Evento Cercano',
            subtitle: 'Feria Gastronómica este sábado',
            time: 'Hace 1 hora',
            isUnread: true,
          ),
          NotificationItem(
            icon: Icons.star,
            title: 'Nueva Reseña',
            subtitle: 'Calificaron tu comercio con 5 estrellas',
            time: 'Hace 2 horas',
            isUnread: false,
          ),
        ],
      ),
    );
  }
}
