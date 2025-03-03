import 'package:e_commerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:e_commerce/features/auth/presentation/bloc/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/screens/signup/registeration/widgets/password_text_field.dart';
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
        child: BlocConsumer<SignUpCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Welcome ${state.user!.name}!")),
              );
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
                            style:
                                Theme.of(context).textTheme.bodyMedium!.apply(
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
                            style:
                                Theme.of(context).textTheme.bodyMedium!.apply(
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
                state is AuthLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<SignUpCubit>().signUp(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                                phoneContoller.text);
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
}
