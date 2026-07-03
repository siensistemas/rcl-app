import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';
import 'package:rcl_app/core/widgets/custom_image.dart';
import 'package:rcl_app/features/businesses/domain/entities/business.dart';

class BusinessCardWidget extends StatelessWidget {
  final Business business;

  const BusinessCardWidget({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.push(AppRoutes.businessDetail);
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CustomImage(
                imageUrl: business.logoUrl,
                width: 64,
                height: 64,
                borderRadius: 8,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      business.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    if (business.category != null)
                      Text(
                        business.category!,
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          business.rating.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.location_on, size: 14, color: Colors.grey),
                        Text(
                          business.distance != null
                              ? '${business.distance!.toStringAsFixed(0)} m'
                              : 'Cerca de ti',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
