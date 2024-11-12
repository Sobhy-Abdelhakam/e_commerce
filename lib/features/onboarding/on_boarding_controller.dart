import 'package:e_commerce/features/auth/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingController {
  OnBoardingController._privateConstructor();
  static final OnBoardingController instance =
      OnBoardingController._privateConstructor();

  final pageController = PageController();

  void dotNavigationClick(int index) {
    pageController.jumpToPage(index);
  }

  void nextPage(BuildContext context) {
    if (pageController.page == 2) {
      // Go To Login Screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: const RouteSettings(name: 'LoginPage'),
        ),
      );
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  void skipPage(BuildContext context) {
    // Go To Login Screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
        settings: const RouteSettings(name: 'LoginPage'),
      ),
    );
  }
}
