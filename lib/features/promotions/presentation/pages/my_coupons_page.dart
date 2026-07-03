import 'package:flutter/material.dart';

class MyCouponsPage extends StatelessWidget {
  const MyCouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Cupones')),
      body: const Center(child: Text('No tienes cupones activos')),
    );
  }
}
