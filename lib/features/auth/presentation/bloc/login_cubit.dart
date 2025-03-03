import 'package:e_commerce/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<AuthState> {
  final SignInUsecase signInUsecase;
  LoginCubit(this.signInUsecase) : super(AuthInitial());
  
  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    final result = await signInUsecase(email, password);
    if (result.hasError) {
      emit(AuthFailure(result.failures!.message));
    } else {
      emit(AuthSuccess(result.data));
    }
  }
}