import 'package:flutter/material.dart';
import 'package:rcl_app/core/widgets/custom_image.dart';

class BusinessGallery extends StatelessWidget {
  final List<String> photos;

  const BusinessGallery({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Galería', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return CustomImage(
                imageUrl: photos[index],
                width: 160,
                height: 120,
                borderRadius: 8,
              );
            },
          ),
        ),
      ],
    );
  }
}
