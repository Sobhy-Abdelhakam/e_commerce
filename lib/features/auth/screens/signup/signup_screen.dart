import 'package:e_commerce/features/auth/screens/signup/widgets/signup_screen_view.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SignupScreenView(),
    );
  }
}