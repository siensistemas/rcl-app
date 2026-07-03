import 'package:flutter/material.dart';
import 'package:rcl_app/features/profile/presentation/widgets/profile_menu_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Apariencia', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
          const SizedBox(height: 8),
          SwitchListTile(title: const Text('Modo Oscuro'), value: false, onChanged: (value) {}),
          const Divider(),
          const Text('Notificaciones', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
          const SizedBox(height: 8),
          SwitchListTile(title: const Text('Notificaciones Push'), value: true, onChanged: (value) {}),
          SwitchListTile(title: const Text('Promociones'), value: true, onChanged: (value) {}),
          SwitchListTile(title: const Text('Eventos Cercanos'), value: false, onChanged: (value) {}),
          const Divider(),
          const Text('Cuenta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
          const SizedBox(height: 8),
          const ProfileMenuItem(icon: Icons.lock, title: 'Cambiar Contraseña', route: '/settings/change-password'),
          const ProfileMenuItem(icon: Icons.delete, title: 'Eliminar Cuenta', route: ''),
        ],
      ),
    );
  }
}
