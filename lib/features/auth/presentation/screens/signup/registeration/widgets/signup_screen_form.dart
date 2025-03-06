import 'package:e_commerce/core/helpers/app_regex.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:e_commerce/features/auth/presentation/bloc/signup_cubit.dart';
import 'package:e_commerce/features/auth/widgets/password_text_field.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreenForm extends StatefulWidget {
  const SignupScreenForm({super.key});

  @override
  State<SignupScreenForm> createState() => _SignupScreenFormState();
}

class _SignupScreenFormState extends State<SignupScreenForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isAgreed = false;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    String? emailValidator(String? email) {
      if (email == null || email.isEmpty) return 'Email is required';
      if (!AppRegex.isEmailValid(email)) return 'Enter a valid email';
      return null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Form(
        key: _formKey,
        child: BlocConsumer<SignUpCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        "Verification email sent to ${state.user!.email}")),
              );
              Navigator.pop(context);
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Column(
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
                  controller: phoneController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_outlined),
                    label: Text(TTexts.phoneNo),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    if (!AppRegex.isPhoneNumberValid(value)) {
                      return 'Enter valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                PasswordTextField(
                  controller: passwordController,
                  lable: TTexts.password,
                ),
                const SizedBox(
                  height: TSizes.xs,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: _isAgreed,
                        onChanged: (value) {
                          setState(() {
                            _isAgreed = value!;
                          });
                        }),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '${TTexts.iAgreeTo} ',
                              style: Theme.of(context).textTheme.labelMedium),
                          TextSpan(
                            text: TTexts.privacyPolicy,
                            style:
                                Theme.of(context).textTheme.labelMedium!.apply(
                                      color: isDark
                                          ? TColors.primaryDark
                                          : TColors.primaryLight,
                                      decoration: TextDecoration.underline,
                                      // decorationColor: isDark
                                      //     ? TColors.primaryDark
                                      //     : TColors.primaryLight,
                                    ),
                          ),
                          TextSpan(
                              text: ' ${TTexts.and} ',
                              style: Theme.of(context).textTheme.labelMedium),
                          TextSpan(
                            text: TTexts.termsOfUse,
                            style:
                                Theme.of(context).textTheme.labelMedium!.apply(
                                      color: isDark
                                          ? TColors.primaryDark
                                          : TColors.primaryLight,
                                      decoration: TextDecoration.underline,
                                      // decorationColor: isDark
                                      //     ? TColors.primaryDark
                                      //     : TColors.primaryLight,
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
                state is AuthLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SignUpCubit>().signUp(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    phoneController.text,
                                  );
                            }
                          },
                          child: const Text(TTexts.createAccount),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
