import 'package:flutter/material.dart';

class PromotionCountdown extends StatelessWidget {
  final DateTime endDate;

  const PromotionCountdown({super.key, required this.endDate});

  @override
  Widget build(BuildContext context) {
    final remaining = endDate.difference(DateTime.now());
    final days = remaining.inDays;
    final hours = remaining.inHours % 24;
    final minutes = remaining.inMinutes % 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimeUnit(days.toString().padLeft(2, '0'), 'días'),
        const SizedBox(width: 8),
        const Text(':', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(width: 8),
        _buildTimeUnit(hours.toString().padLeft(2, '0'), 'horas'),
        const SizedBox(width: 8),
        const Text(':', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(width: 8),
        _buildTimeUnit(minutes.toString().padLeft(2, '0'), 'min'),
      ],
    );
  }

  Widget _buildTimeUnit(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
