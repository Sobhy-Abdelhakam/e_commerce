import 'package:e_commerce/features/auth/presentation/screens/forget_password/reset/reset_password.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class ForgetScreenForm extends StatelessWidget {
  const ForgetScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              label: Text(TTexts.email),
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPassword(),
                  ),
                );
              },
              child: const Text(TTexts.submit),
            ),
          ),
        ],
      ),
    );
  }
}
