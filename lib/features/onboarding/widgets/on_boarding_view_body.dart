import 'package:e_commerce/features/onboarding/on_boarding_controller.dart';
import 'package:e_commerce/features/onboarding/widgets/on_boarding_next_btn.dart';
import 'package:flutter/material.dart';

import 'on_boarding_dot_nav.dart';
import 'on_boarding_page.dart';
import 'on_boarding_skip.dart';

class OnBoardingViewBody extends StatelessWidget {
  OnBoardingViewBody({super.key});
  final controller = OnBoardingController.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndecator,
          children: const [
            OnBoardingPage(
              image: 'assets/images/onboarding1.png',
              title: 'Choose your product',
              subTitle:
                  'this is the discription of on boarding screen for this page in page view',
            ),
            OnBoardingPage(
              image: 'assets/images/onboarding2.png',
              title: 'Deliver at your door step',
              subTitle:
                  'this is the discription of on boarding screen for this page in page view',
            ),
            OnBoardingPage(
              image: 'assets/images/onboarding3.png',
              title: 'Deliver at your door step',
              subTitle:
                  'this is the discription of on boarding screen for this page in page view',
            ),
          ],
        ),
        const OnBoardingSkip(),
        const OnBoardingDotNavigation(),
        const OnBoardingNextButton(),
      ],
    );
  }
}
