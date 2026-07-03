import 'package:flutter/material.dart';
import 'package:rcl_app/features/classifieds/presentation/widgets/classified_card.dart';

class ClassifiedListPage extends StatelessWidget {
  const ClassifiedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clasificados'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ClassifiedCard(),
          ClassifiedCard(),
          ClassifiedCard(),
        ],
      ),
    );
  }
}
