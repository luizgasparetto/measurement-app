import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> createUser(String name, String email, String password);
  Future<String> authenticateUser(String email, String password);
  Future<UserEntity> getUser();
}
