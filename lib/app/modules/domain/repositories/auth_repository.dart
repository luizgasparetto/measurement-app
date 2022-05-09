import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<String> authenticateUser(String email, String password);
  Future<UserEntity> getUser();
}
