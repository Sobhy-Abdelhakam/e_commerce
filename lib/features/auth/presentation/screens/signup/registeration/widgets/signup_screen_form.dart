import 'package:e_commerce/features/auth/presentation/screens/signup/registeration/widgets/password_text_field.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreenForm extends StatefulWidget {
  const SignupScreenForm({super.key});

  @override
  State<SignupScreenForm> createState() => _SignupScreenFormState();
}

class _SignupScreenFormState extends State<SignupScreenForm> {
  final _formKey = GlobalKey<FormState>();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    // SupabaseAuth().signUp(
    //   email: emailController.text,
    //   password: passwordController.text,
    //   name: nameController.text,
    //   phone: phoneContoller.text,
    // );
    Supabase.instance.client.auth.signUp(
      email: 'sobhy.altayer2016@gmail.com',
      password: '123456',
      data: {'name': 'test', 'age': '24', 'gender':'male', 'phone': '1234567890'},
      // phone: '1234567890',
    );
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const VerificationScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneContoller = TextEditingController();
    final passwordController = TextEditingController();

    String? emailValidator(String? email) {
      const pattern = r'\S+@\S+\.\S+';
      final regex = RegExp(pattern);
      if (email!.isEmpty) return 'Email is required';
      if (!regex.hasMatch(email)) return 'Enter a valid email';
      return null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                label: Text(TTexts.name),
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                label: Text(TTexts.email),
              ),
              validator: emailValidator,
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: phoneContoller,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone_outlined),
                label: Text(TTexts.phoneNo),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            PasswordTextField(
              controller: passwordController,
              lable: TTexts.password,
            ),
            const SizedBox(
              height: TSizes.sm,
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${TTexts.iAgreeTo} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                        text: TTexts.privacyPolicy,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: isDark
                                  ? TColors.primaryDark
                                  : TColors.primaryLight,
                              decoration: TextDecoration.underline,
                              decorationColor: isDark
                                  ? TColors.primaryDark
                                  : TColors.primaryLight,
                            ),
                      ),
                      TextSpan(
                          text: ' ${TTexts.and} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                        text: TTexts.termsOfUse,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: isDark
                                  ? TColors.primaryDark
                                  : TColors.primaryLight,
                              decoration: TextDecoration.underline,
                              decorationColor: isDark
                                  ? TColors.primaryDark
                                  : TColors.primaryLight,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
