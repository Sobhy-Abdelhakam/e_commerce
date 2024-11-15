import 'package:e_commerce/features/auth/screens/signup/registeration/widgets/signup_screen_form.dart';
import 'package:e_commerce/features/auth/widgets/footer_login_signup.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignupScreenView extends StatelessWidget {
  const SignupScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SignupScreenForm(),
            const FooterLoginSignup(orString: TTexts.orSignUpWith),
          ],
        ),
      ),
    );
  }
}
