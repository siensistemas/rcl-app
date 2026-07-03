import 'package:flutter/material.dart';
import 'package:rcl_app/core/widgets/custom_button.dart';
import 'package:rcl_app/core/widgets/custom_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(controller: _usernameController, label: 'Usuario', prefixIcon: Icons.person),
          const SizedBox(height: 16),
          CustomTextField(controller: _emailController, label: 'Email', prefixIcon: Icons.email),
          const SizedBox(height: 16),
          CustomTextField(controller: _passwordController, label: 'Contraseña', prefixIcon: Icons.lock, obscureText: true),
          const SizedBox(height: 16),
          CustomTextField(controller: _confirmPasswordController, label: 'Confirmar Contraseña', prefixIcon: Icons.lock, obscureText: true),
          const SizedBox(height: 24),
          CustomButton(onPressed: () {}, text: 'Crear Cuenta'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
