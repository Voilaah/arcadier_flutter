part of '../responses.dart';

TokenResponse tokenFromJson(String str) => TokenResponse.fromJson(json.decode(str));

String tokenToJson(TokenResponse data) => json.encode(data.toJson());

class TokenResponse {
  TokenResponse({
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

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
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
