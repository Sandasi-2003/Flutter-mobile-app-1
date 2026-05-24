import '../repositories/auth_repository.dart';

class LoginUsecase {
  const LoginUsecase(this.repository);

  final AuthRepository repository;
}
