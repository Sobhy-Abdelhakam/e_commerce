import 'package:e_commerce/core/call_result/response.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';

class SignInUsecase {
  final AuthRepository _authRepository;
  SignInUsecase(this._authRepository);
  
  Future<Response<UserInfo>> call(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return Future.value(Response(InvalidInputFailures("Email and password cannot be empty")));
    }
    return _authRepository.signIn(email, password);
  }
}