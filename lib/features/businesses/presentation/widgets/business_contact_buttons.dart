import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessContactButtons extends StatelessWidget {
  final String? phone;
  final String? website;

  const BusinessContactButtons({super.key, this.phone, this.website});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (phone != null)
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                launchUrl(Uri.parse('tel:$phone'));
              },
              icon: const Icon(Icons.phone),
              label: const Text('Llamar'),
            ),
          ),
        if (phone != null && website != null) const SizedBox(width: 8),
        if (website != null)
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                launchUrl(Uri.parse(website!));
              },
              icon: const Icon(Icons.language),
              label: const Text('Sitio Web'),
            ),
          ),
      ],
    );
  }
}
