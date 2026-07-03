import 'package:flutter/material.dart';

class SchedulePicker extends StatelessWidget {
  final String day;
  final TimeOfDay? openTime;
  final TimeOfDay? closeTime;
  final ValueChanged<TimeOfDay> onOpenChanged;
  final ValueChanged<TimeOfDay> onCloseChanged;

  const SchedulePicker({
    super.key,
    required this.day,
    this.openTime,
    this.closeTime,
    required this.onOpenChanged,
    required this.onCloseChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(day, style: const TextStyle(fontWeight: FontWeight.w500))),
          Expanded(child: _timeButton(context, 'Abre', openTime, onOpenChanged)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('-'),
          ),
          Expanded(child: _timeButton(context, 'Cierra', closeTime, onCloseChanged)),
        ],
      ),
    );
  }

  Widget _timeButton(BuildContext context, String label, TimeOfDay? time, ValueChanged<TimeOfDay> onChanged) {
    return GestureDetector(
      onTap: () async {
        final picked = await showTimePicker(context: context, initialTime: time ?? TimeOfDay.now());
        if (picked != null) onChanged(picked);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]!),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          time?.format(context) ?? label,
          style: TextStyle(color: time != null ? Colors.black : Colors.grey),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
