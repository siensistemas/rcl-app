import 'package:flutter/material.dart';

class TourismFilter extends StatelessWidget {
  const TourismFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _filterChip('Todos', true),
            _filterChip('Cultural', false),
            _filterChip('Natural', false),
            _filterChip('Histórico', false),
            _filterChip('Gastronómico', false),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (value) {},
      ),
    );
  }
}
