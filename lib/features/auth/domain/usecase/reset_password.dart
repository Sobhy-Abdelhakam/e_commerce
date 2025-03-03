import 'package:e_commerce/core/call_result/response.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';

class ResetPassword {
  final AuthRepository _authRepository;
  ResetPassword(this._authRepository);
  Future<Response<void>> call(String email) {
    if (email.isEmpty) {
      return Future.value(Response(InvalidInputFailures("Email cannot be empty")));
    }
    return _authRepository.resetPassword(email);
  }
}