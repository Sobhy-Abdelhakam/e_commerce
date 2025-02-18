import 'package:e_commerce/features/auth/presentation/screens/forget_password/forget/widgets/forget_screen_form.dart';
import 'package:e_commerce/features/auth/presentation/screens/forget_password/forget/widgets/forget_screen_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ForgetScreenHeader(),
              SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),
              ForgetScreenForm(),
            ],
          ),
        ),
      ),
    );
  }
}
