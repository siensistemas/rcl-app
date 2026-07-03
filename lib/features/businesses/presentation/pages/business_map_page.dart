import 'package:flutter/material.dart';

class BusinessMapPage extends StatelessWidget {
  const BusinessMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
      body: const Center(
        child: Text('Mapa de comercios cercanos'),
      ),
    );
  }
}
