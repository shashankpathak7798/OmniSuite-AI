import 'package:jwt_decode/jwt_decode.dart';

class SignInResponseModel {
  final String? accessToken;
  final String? refreshToken;

  SignInResponseModel({
    this.accessToken,
    this.refreshToken,
  });

  String? get userId {
    if (accessToken == null) return null;
    final jwt = Jwt.parseJwt(accessToken!);

    return jwt["userId"];
  }

  String? get emailId {
    if (accessToken == null) return null;
    final jwt = Jwt.parseJwt(accessToken!);

    return jwt["email"];
  }

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );
}
