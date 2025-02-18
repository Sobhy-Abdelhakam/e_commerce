import 'package:e_commerce/features/auth/presentation/screens/signup/email_verification/success_verification.dart';
import 'package:e_commerce/features/auth/widgets/success_verifi_reset.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SuccessVerifiReset(
              title: TTexts.confirmEmail,
              subTitle: TTexts.confirmEmailSubTitle,
              image: TImages.deliveredEmailIllustration,
              textOfButton: TTexts.tContinue,
              buttonClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessVerification(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(TTexts.resendEmail),
            ),
          ],
        ),
      ),
    );
  }
}
