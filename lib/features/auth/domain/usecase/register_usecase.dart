import 'package:e_commerce/core/call_result/response.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Response<UserInfo>> call(String name, String email, String password, String phoneNumber) {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      return Future.value(Response(InvalidInputFailures("Fields cannot be empty")));
    }
    return repository.signUp(name, email, password, phoneNumber);
  }
}
