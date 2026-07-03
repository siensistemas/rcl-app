import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';

class CategoryGrid extends StatelessWidget {
  static const List<_Category> _categories = [
    _Category(icon: Icons.restaurant, name: 'Comida', color: Colors.orange),
    _Category(icon: Icons.shopping_bag, name: 'Tiendas', color: Colors.blue),
    _Category(icon: Icons.local_hospital, name: 'Salud', color: Colors.red),
    _Category(icon: Icons.sports_esports, name: 'Entretenimiento', color: Colors.purple),
    _Category(icon: Icons.build, name: 'Servicios', color: Colors.teal),
    _Category(icon: Icons.school, name: 'Educación', color: Colors.indigo),
    _Category(icon: Icons.fitness_center, name: 'Deportes', color: Colors.green),
    _Category(icon: Icons.more_horiz, name: 'Más', color: Colors.grey),
  ];

  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.85,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return GestureDetector(
          onTap: () {
            context.push(AppRoutes.businesses);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: category.color.withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(category.icon, color: category.color, size: 28),
              ),
              const SizedBox(height: 6),
              Text(
                category.name,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Category {
  final IconData icon;
  final String name;
  final MaterialColor color;

  const _Category({required this.icon, required this.name, required this.color});
}
