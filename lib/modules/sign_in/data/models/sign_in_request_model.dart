class SignInRequestModel {
  final String? email;
  final String? password;

  SignInRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}