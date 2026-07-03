import 'package:flutter/material.dart';
import 'package:rcl_app/features/tourism/presentation/widgets/attraction_card.dart';
import 'package:rcl_app/features/tourism/presentation/widgets/tourism_filter.dart';

class TourismPage extends StatelessWidget {
  const TourismPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Turismo')),
      body: Column(
        children: [
          const TourismFilter(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                AttractionCard(),
                AttractionCard(),
                AttractionCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
