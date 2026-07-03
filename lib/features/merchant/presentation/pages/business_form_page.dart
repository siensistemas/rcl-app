import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';
import 'package:rcl_app/core/widgets/custom_button.dart';
import 'package:rcl_app/core/widgets/custom_text_field.dart';

class BusinessFormPage extends StatefulWidget {
  const BusinessFormPage({super.key});

  @override
  State<BusinessFormPage> createState() => _BusinessFormPageState();
}

class _BusinessFormPageState extends State<BusinessFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Comercio')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(controller: _nameController, label: 'Nombre del Comercio', prefixIcon: Icons.store),
              const SizedBox(height: 16),
              CustomTextField(controller: _descriptionController, label: 'Descripción', prefixIcon: Icons.description, maxLines: 3),
              const SizedBox(height: 16),
              CustomTextField(controller: _addressController, label: 'Dirección', prefixIcon: Icons.location_on),
              const SizedBox(height: 16),
              CustomTextField(controller: _phoneController, label: 'Teléfono', prefixIcon: Icons.phone),
              const SizedBox(height: 16),
              CustomTextField(controller: _websiteController, label: 'Sitio Web', prefixIcon: Icons.language),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () => context.push(AppRoutes.merchantMedia),
                text: 'Siguiente: Fotos',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    super.dispose();
  }
}
