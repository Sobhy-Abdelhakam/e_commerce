import 'package:e_commerce/features/auth/domain/usecase/register_usecase.dart';

class RegisterationViewmodel {
  final RegisterUseCase registerUseCase;
  RegisterationViewmodel(this.registerUseCase);

  String name = '';
  String email = '';
  String phoneNumber = '';
  String password = '';

  Future<void> registerUser() async{
    try {
      await registerUseCase(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password
      );
    } catch (e) {
      
    }
  }
}