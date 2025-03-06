import 'package:e_commerce/core/helpers/app_regex.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:e_commerce/features/auth/presentation/bloc/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/screens/forget_password/forget/forget_password.dart';
import 'package:e_commerce/features/auth/presentation/screens/signup/registeration/signup_screen.dart';
import 'package:e_commerce/features/auth/widgets/password_text_field.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenForm extends StatefulWidget {
  const LoginScreenForm({
    super.key,
  });

  @override
  State<LoginScreenForm> createState() => _LoginScreenFormState();
}

class _LoginScreenFormState extends State<LoginScreenForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Form(
        key: _formKey,
        child: BlocConsumer<LoginCubit, AuthState>(
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
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: TTexts.email,
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                PasswordTextField(
                    controller: passwordController, lable: TTexts.password),
                // TextFormField(
                //   controller: passwordController,
                //   obscureText: !isPasswordVisible,
                //   decoration: InputDecoration(
                //       hintText: TTexts.password,
                //       prefixIcon: const Icon(Icons.lock_outline),
                //       suffixIcon: GestureDetector(
                //         onTap: (){
                //           setState(() {
                //             isPasswordVisible = !isPasswordVisible;
                //           });
                //         },
                //         child: Icon(
                //           isPasswordVisible? Icons.visibility_outlined : Icons.visibility_off_outlined
                //           )
                //         )
                //         ),
                // ),
                const SizedBox(
                  height: TSizes.sm,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text(TTexts.rememberMe)
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPassword(),
                          ),
                        );
                      },
                      child: const Text(TTexts.forgetPassword),
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
                              context.read<LoginCubit>().signIn(
                                    emailController.text,
                                    passwordController.text,
                                  );
                            }
                          },
                          child: const Text(TTexts.signIn),
                        ),
                      ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text(TTexts.createAccount),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
