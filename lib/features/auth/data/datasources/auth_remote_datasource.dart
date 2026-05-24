import '../models/user_model.dart';

class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<UserModel> mockUser() async {
    return const UserModel(
      id: 'user-1',
      name: 'Sandasi',
      email: 'Sandasi@example.com',
    );
  }
}
