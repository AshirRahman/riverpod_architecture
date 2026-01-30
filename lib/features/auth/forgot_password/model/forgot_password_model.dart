class ForgotPasswordModel {
  final String email;

  const ForgotPasswordModel({this.email = ''});

  ForgotPasswordModel copyWith({String? email}) {
    return ForgotPasswordModel(
      email: email ?? this.email,
    );
  }
}
