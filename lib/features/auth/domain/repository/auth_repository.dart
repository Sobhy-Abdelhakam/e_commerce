import 'package:e_commerce/core/call_result/response.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Response<UserInfo>> signUp(
    String name,
    String email,
    String password,
    String phoneNumber,
  );

  Future<Response<UserInfo>> signIn(
    String email,
    String password,
  );

  Future<Response<void>> signOut();

  Future<Response<void>> resetPassword(
    String email,
  );

  // Future<void> updateProfile({
  //   required String username,
  //   required String email,
  // });

  Future<bool> isUserSignedIn();
}
