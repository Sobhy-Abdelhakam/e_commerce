import 'package:e_commerce/features/auth/widgets/success_verifi_reset.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SuccessVerification extends StatelessWidget {
  const SuccessVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const SizedBox(
              height: TSizes.appBarHeight,
            ),
            SuccessVerifiReset(
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              image: TImages.successIllustration,
              textOfButton: TTexts.done,
              buttonClick: () {
                Navigator.popUntil(
                  context,
                  (router) => router.settings.name == 'LoginPage',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
