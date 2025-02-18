abstract class AuthRepository {
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  });

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> resetPassword({
    required String email,
  });

  Future<void> updateProfile({
    required String username,
    required String email,
  });

  Future<bool> isUserSignedIn();
}