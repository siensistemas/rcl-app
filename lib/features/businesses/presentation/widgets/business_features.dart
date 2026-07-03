import 'package:flutter/material.dart';
import 'package:rcl_app/features/businesses/domain/entities/business.dart';

class BusinessFeatures extends StatelessWidget {
  final Business business;

  const BusinessFeatures({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (business.isOpen)
          _buildChip('Abierto ahora', Colors.green)
        else
          _buildChip('Cerrado', Colors.red),
        if (business.isFeatured)
          _buildChip('Destacado', Colors.amber),
        if (business.tags != null)
          ...business.tags!.map((tag) => _buildChip(tag, Colors.blue)),
      ],
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      label: Text(label, style: TextStyle(fontSize: 12, color: color)),
      backgroundColor: color.withAlpha(25),
      side: BorderSide.none,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
