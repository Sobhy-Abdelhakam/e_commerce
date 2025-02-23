import 'package:e_commerce/features/onboarding/on_boarding_controller.dart';
import 'package:e_commerce/features/onboarding/widgets/on_boarding_next_btn.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
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
          children: const [
            OnBoardingPage(
              image: TImages.onBoarding1,
              title: TTexts.onBoardingTitle1,
              subTitle: TTexts.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: TImages.onBoarding2,
              title: TTexts.onBoardingTitle2,
              subTitle: TTexts.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: TImages.onBoarding3,
              title: TTexts.onBoardingTitle3,
              subTitle: TTexts.onBoardingSubTitle3,
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
