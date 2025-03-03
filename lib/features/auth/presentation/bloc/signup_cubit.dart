import 'package:e_commerce/features/auth/domain/usecase/register_usecase.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<AuthState> {
  final RegisterUseCase registerUseCase;
  SignUpCubit(this.registerUseCase) : super(AuthInitial());
  Future<void> signUp(String name, String email, String password, String phoneNumber) async{
    emit(AuthLoading());
    final result = await registerUseCase(name, email, password, phoneNumber);
    if(result.hasError){
      emit(AuthFailure(result.failures!.message));
    } else {
      emit(AuthSuccess(result.data));
    }
  }
}