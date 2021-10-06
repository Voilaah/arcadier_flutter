part of '../responses.dart';

ResultResponse resultFromJson(String str) => ResultResponse.fromJson(json.decode(str));

String resultToJson(ResultResponse data) => json.encode(data.toJson());

class ResultResponse {
  ResultResponse({
    required this.result,
    this.accessToken,
  });

  bool result;
  TokenResponse? accessToken;

  factory ResultResponse.fromJson(Map<String, dynamic> json) => ResultResponse(
        result: json["Result"],
        // accessToken: json["AccessToken"] ? Token.fromJson(json["AccessToken"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "Result": result,
        "AccessToken": accessToken != null ? accessToken!.toJson() : null,
      };
}
