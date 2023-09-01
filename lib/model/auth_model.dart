import 'package:jwt_decode/jwt_decode.dart';

class Auth {
  String userId;
  String fullName;
  String accessToken;
  String refreshToken;

  Auth({
    required this.userId,
    required this.fullName,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Auth.fromJson(Map<String, dynamic> data) {
    final jwt = Jwt.parseJwt(data["accessToken"]);
    return Auth(
      userId: jwt["iss"],
      fullName: jwt["fullName"],
      accessToken: data["accessToken"],
      refreshToken: data["refreshToken"],
    );
  }

  Map<String, dynamic> toJson() => {
        "iss": userId,
        "fullName": fullName,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
