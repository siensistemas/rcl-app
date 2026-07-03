import 'package:flutter/material.dart';
import 'package:rcl_app/features/jobs/presentation/widgets/job_card.dart';

class JobListPage extends StatelessWidget {
  const JobListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Empleos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          JobCard(),
          JobCard(),
          JobCard(),
        ],
      ),
    );
  }
}
