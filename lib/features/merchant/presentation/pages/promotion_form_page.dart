import 'package:flutter/material.dart';
import 'package:rcl_app/core/widgets/custom_button.dart';
import 'package:rcl_app/core/widgets/custom_text_field.dart';

class PromotionFormPage extends StatefulWidget {
  const PromotionFormPage({super.key});

  @override
  State<PromotionFormPage> createState() => _PromotionFormPageState();
}

class _PromotionFormPageState extends State<PromotionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _discountType = 'percentage';
  final _discountValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva Promoción')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(controller: _titleController, label: 'Título de la Promoción'),
              const SizedBox(height: 16),
              CustomTextField(controller: _descriptionController, label: 'Descripción', maxLines: 3),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _discountType,
                decoration: const InputDecoration(labelText: 'Tipo de Descuento'),
                items: const [
                  DropdownMenuItem(value: 'percentage', child: Text('Porcentaje (%)')),
                  DropdownMenuItem(value: 'fixed', child: Text('Monto Fijo (\$)')),
                ],
                onChanged: (value) => setState(() => _discountType = value!),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _discountValueController,
                label: _discountType == 'percentage' ? 'Porcentaje de Descuento' : 'Monto de Descuento',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              CustomButton(onPressed: () {}, text: 'Crear Promoción'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _discountValueController.dispose();
    super.dispose();
  }
}
