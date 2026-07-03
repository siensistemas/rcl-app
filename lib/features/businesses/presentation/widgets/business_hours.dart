import 'package:flutter/material.dart';

class BusinessHours extends StatelessWidget {
  const BusinessHours({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Horario', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildDayRow('Lunes', '9:00 - 18:00'),
            _buildDayRow('Martes', '9:00 - 18:00'),
            _buildDayRow('Miércoles', '9:00 - 18:00'),
            _buildDayRow('Jueves', '9:00 - 18:00'),
            _buildDayRow('Viernes', '9:00 - 18:00'),
            _buildDayRow('Sábado', '10:00 - 14:00'),
            _buildDayRow('Domingo', 'Cerrado'),
          ],
        ),
      ),
    );
  }

  Widget _buildDayRow(String day, String hours) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: const TextStyle(fontSize: 14)),
          Text(hours, style: TextStyle(fontSize: 14, color: hours == 'Cerrado' ? Colors.red : Colors.green)),
        ],
      ),
    );
  }
}
