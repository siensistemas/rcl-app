import 'package:flutter/material.dart';
import 'package:rcl_app/core/widgets/custom_button.dart';

class BusinessHoursPage extends StatefulWidget {
  const BusinessHoursPage({super.key});

  @override
  State<BusinessHoursPage> createState() => _BusinessHoursPageState();
}

class _BusinessHoursPageState extends State<BusinessHoursPage> {
  final Map<String, Map<String, TimeOfDay?>> _hours = {
    'Lunes': {'open': null, 'close': null},
    'Martes': {'open': null, 'close': null},
    'Miércoles': {'open': null, 'close': null},
    'Jueves': {'open': null, 'close': null},
    'Viernes': {'open': null, 'close': null},
    'Sábado': {'open': null, 'close': null},
    'Domingo': {'open': null, 'close': null},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Horarios')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ..._hours.entries.map((entry) => _buildDayRow(entry.key)),
            const SizedBox(height: 24),
            CustomButton(onPressed: () {}, text: 'Guardar Horarios'),
          ],
        ),
      ),
    );
  }

  Widget _buildDayRow(String day) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(day)),
          Expanded(
            child: _buildTimePicker('Abre', _hours[day]!['open']!, (time) {
              setState(() => _hours[day]!['open'] = time);
            }),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildTimePicker('Cierra', _hours[day]!['close']!, (time) {
              setState(() => _hours[day]!['close'] = time);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePicker(String label, TimeOfDay? time, Function(TimeOfDay) onSelected) {
    return GestureDetector(
      onTap: () async {
        final selected = await showTimePicker(context: context, initialTime: time ?? TimeOfDay.now());
        if (selected != null) onSelected(selected);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
        child: Text(time != null ? time.format(context) : label, style: TextStyle(color: time != null ? Colors.black : Colors.grey)),
      ),
    );
  }
}
