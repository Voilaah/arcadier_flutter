part of '../responses.dart';

ArcadierToken tokenFromJson(String str) => ArcadierToken.fromJson(json.decode(str));

String tokenToJson(ArcadierToken data) => json.encode(data.toJson());

class ArcadierToken {
  ArcadierToken({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.refreshToken,
    required this.userId,
  });

  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String refreshToken;
  final String userId;

  factory ArcadierToken.fromJson(Map<String, dynamic> json) => ArcadierToken(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
        userId: json["UserId"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "UserId": userId,
      };

  @override
  String toString() => "access_token $accessToken";
}
