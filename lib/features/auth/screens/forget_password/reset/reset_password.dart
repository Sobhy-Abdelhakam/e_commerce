import 'package:e_commerce/features/auth/widgets/success_verifi_reset.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: SuccessVerifiReset(
          title: TTexts.changeYourPasswordTitle,
          subTitle: TTexts.changeYourPasswordSubTitle,
          image: TImages.deliveredEmailIllustration,
        ),
      ),
    );
  }
}
