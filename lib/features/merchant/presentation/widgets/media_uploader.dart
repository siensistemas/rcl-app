import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaUploader extends StatelessWidget {
  final String label;
  final VoidCallback? onUploaded;

  const MediaUploader({super.key, required this.label, this.onUploaded});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picker = ImagePicker();
        final image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          onUploaded?.call();
        }
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_photo_alternate, size: 40, color: Colors.grey),
              const SizedBox(height: 8),
              Text(label, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }
}
