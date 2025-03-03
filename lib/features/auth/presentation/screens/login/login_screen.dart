import 'package:e_commerce/core/network/network_info.dart';
import 'package:e_commerce/features/auth/data/repository/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';
import 'package:e_commerce/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:e_commerce/features/auth/presentation/bloc/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/screens/login/widgets/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  // final SignInUsecase signInUsecase = SignInUsecase(AuthRepoImpl(
  //     networkInfo: NetworkInfoImpl(InternetConnectionChecker.instance)));
  // final AuthViewmodel viewModel = AuthViewmodel(
  //   signInUsecase: signInUsecase,
  //    registerUseCase: registerUseCase,
  //     resetPasswordUseCase: resetPasswordUseCase
  //     );

  @override
  Widget build(BuildContext context) {
    NetworkInfo networkInfo =
        NetworkInfoImpl(InternetConnectionChecker.instance);
    AuthRepository authRepository = AuthRepoImpl(networkInfo: networkInfo);
    SignInUsecase signInUsecase = SignInUsecase(authRepository);
    // RegisterUseCase registerUseCase = RegisterUseCase(authRepository);
    // ResetPassword resetPassword = ResetPassword(authRepository);
    // AuthViewmodel authViewmodel = AuthViewmodel(
    //   signInUsecase: signInUsecase,
    //   registerUseCase: registerUseCase,
    //   resetPasswordUseCase: resetPassword,
    // );
    // AuthCubit authCubit = AuthCubit(
    //   signInUsecase,
    //   registerUseCase,
    //   resetPassword,
    // );
    LoginCubit loginCubit = LoginCubit(signInUsecase);
    return BlocProvider<LoginCubit>(
      create: (context) => loginCubit,
      child: const Scaffold(
        body: LoginScreenView(),
      ),
    );
  }
}
