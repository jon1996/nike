import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller; // Add controller
  final String? Function(String?) validator; // Add validator

  const MyTextField({
    super.key,
    required this.text,
    this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.controller, // Pass the controller
    required this.validator, // Pass the validator
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller, // Set the controller
        obscureText: isPassword ? true : false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validator, // Use the validator
      ),
    );
  }
}
