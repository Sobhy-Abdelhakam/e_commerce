import 'package:flutter/material.dart';

class OnBoardingController {
  OnBoardingController._privateConstructor();
  static final OnBoardingController instance =
      OnBoardingController._privateConstructor();

  final pageController = PageController();
  int currentPageIndex = 0;

  void updatePageIndecator(int index) => currentPageIndex = index;
  void dotNavigationClick(int index) {
    currentPageIndex = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex == 2) {
      // Go To Login Screen
    } else {
      currentPageIndex += 1;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  void skipPage() {
    currentPageIndex = 2;
    pageController.jumpToPage(2);
  }
}
