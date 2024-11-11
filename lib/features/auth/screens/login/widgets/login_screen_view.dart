import 'package:e_commerce/features/auth/widgets/footer_login_signup.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'Login_screen_form.dart';
import 'login_screen_header.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          TSizes.defaultSpace,
          TSizes.appBarHeight,
          TSizes.defaultSpace,
          TSizes.defaultSpace,
        ),
        child: Column(
          children: [
            // title, and sub-title
            LoginScreenHeader(),
            // form for sign in
            LoginScreenForm(),
            // google and face book
            FooterLoginSignup(orString: TTexts.orSignInWith),
          ],
        ),
      ),
    );
  }
}
