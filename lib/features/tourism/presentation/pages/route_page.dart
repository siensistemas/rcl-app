import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ruta Turística')),
      body: const Center(
        child: Text('Mapa de ruta turística'),
      ),
    );
  }
}
