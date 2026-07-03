import 'package:flutter/material.dart';
import 'package:rcl_app/core/widgets/custom_button.dart';

class JobDetailPage extends StatelessWidget {
  const JobDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del Empleo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Título del Puesto', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Nombre de la Empresa', style: TextStyle(fontSize: 16, color: Colors.blue)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text('Ubicación', style: TextStyle(color: Colors.grey[600])),
                const SizedBox(width: 16),
                const Icon(Icons.work, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text('Tiempo Completo', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            const Text('Descripción', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Descripción detallada del puesto con requisitos, responsabilidades y beneficios ofrecidos.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Requisitos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('• Experiencia previa\n• Conocimientos técnicos\n• Disponibilidad'),
            const SizedBox(height: 24),
            CustomButton(onPressed: () {}, text: 'Aplicar Ahora', icon: Icons.send),
          ],
        ),
      ),
    );
  }
}
