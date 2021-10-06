part of '../responses.dart';

ArcadierResult resultFromJson(String str) => ArcadierResult.fromJson(json.decode(str));

String resultToJson(ArcadierResult data) => json.encode(data.toJson());

class ArcadierResult {
  ArcadierResult({
    required this.result,
    this.accessToken,
  });

  bool result;
  ArcadierToken? accessToken;

  factory ArcadierResult.fromJson(Map<String, dynamic> json) => ArcadierResult(
        result: json["Result"],
        // accessToken: json["AccessToken"] ? Token.fromJson(json["AccessToken"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "Result": result,
        "AccessToken": accessToken != null ? accessToken!.toJson() : null,
      };
}
