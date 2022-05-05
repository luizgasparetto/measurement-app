abstract class AuthRepository {
  Future<void> signUp(String name, String email, String password);
  Future<void> authenticateUser(String email, String password);
  Future<String> isAuthenticated();
}
