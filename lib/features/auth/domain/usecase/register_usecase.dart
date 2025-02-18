import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<void> call({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    return await repository.signUp(
      name: name,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
  }
}
