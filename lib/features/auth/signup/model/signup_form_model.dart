class SignupFormModel {
  final String email;
  final String password;
  final String confirmPassword;

  const SignupFormModel({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  SignupFormModel copyWith({
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignupFormModel(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
