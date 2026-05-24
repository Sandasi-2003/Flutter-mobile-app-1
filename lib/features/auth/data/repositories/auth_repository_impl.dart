import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.remoteDataSource});

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<UserEntity?> getCurrentUser() => remoteDataSource.mockUser();

  @override
  Future<UserEntity> login(String email, String password) =>
      remoteDataSource.mockUser();

  @override
  Future<void> logout() async {}

  @override
  Future<UserEntity> register(String name, String email, String password) =>
      remoteDataSource.mockUser();
}
