import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key, required this.controller, required this.lable});
  final TextEditingController controller;
  final String lable;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outline),
        label: Text(widget.lable),
        suffixIcon: IconButton(
          icon: showPassword
              ? const Icon(Icons.remove_red_eye_outlined)
              : const Icon(Icons.enhanced_encryption_outlined),
          tooltip: showPassword ? 'Hide password' : 'Show password',
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
        ),
      ),
      obscureText: !showPassword,
    );
  }
}
