import 'package:e_commerce/features/auth/presentation/screens/login/widgets/login_screen_view.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreenView(),
    );
  }
}