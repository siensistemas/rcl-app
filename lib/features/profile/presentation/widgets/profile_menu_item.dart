import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: route.isNotEmpty ? () => context.push(route) : null,
    );
  }
}
