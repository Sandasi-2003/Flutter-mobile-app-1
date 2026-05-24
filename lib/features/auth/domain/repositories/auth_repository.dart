import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> getCurrentUser();
  Future<UserEntity> login(String email, String password);
  Future<void> logout();
  Future<UserEntity> register(String name, String email, String password);
}
