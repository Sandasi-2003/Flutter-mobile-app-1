import '../repositories/auth_repository.dart';

class GetCurrentUserUsecase {
  const GetCurrentUserUsecase(this.repository);

  final AuthRepository repository;
}
