import 'package:flutter/material.dart';
import 'package:rcl_app/core/widgets/custom_image.dart';
import 'package:rcl_app/features/promotions/domain/entities/promotion.dart';

class PromotionCard extends StatelessWidget {
  final Promotion promotion;
  final VoidCallback? onTap;

  const PromotionCard({super.key, required this.promotion, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: CustomImage(
                imageUrl: promotion.imageUrl,
                height: 140,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(promotion.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  if (promotion.businessName != null)
                    Text(promotion.businessName!, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.discount, size: 16, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(
                        promotion.discountType == 'percentage'
                            ? '${promotion.discountValue.toStringAsFixed(0)}% OFF'
                            : '${promotion.discountValue.toStringAsFixed(2)} OFF',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const Spacer(),
                      Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        'Hasta ${promotion.endDate.day}/${promotion.endDate.month}',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
