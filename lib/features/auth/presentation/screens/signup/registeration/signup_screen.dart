import 'package:e_commerce/core/network/network_info.dart';
import 'package:e_commerce/features/auth/data/repository/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';
import 'package:e_commerce/features/auth/domain/usecase/register_usecase.dart';
import 'package:e_commerce/features/auth/presentation/bloc/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/screens/signup/registeration/widgets/signup_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NetworkInfo networkInfo =
        NetworkInfoImpl(InternetConnectionChecker.instance);
    AuthRepository authRepository = AuthRepoImpl(networkInfo: networkInfo);
    RegisterUseCase registerUseCase = RegisterUseCase(authRepository);
    return BlocProvider(
      create: (context) => SignUpCubit(registerUseCase),
      child: Scaffold(
        appBar: AppBar(),
        body: const SignupScreenView(),
      ),
    );
  }
}
