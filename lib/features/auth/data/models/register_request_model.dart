class RegisterRequestModel {
  const RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;
}
