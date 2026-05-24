import '../repositories/auth_repository.dart';

class LogoutUsecase {
  const LogoutUsecase(this.repository);

  final AuthRepository repository;
}
