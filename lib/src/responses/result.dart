part of '../responses.dart';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {
  Result({
    required this.result,
    this.accessToken,
  });

  bool result;
  Token? accessToken;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        result: json["Result"],
        // accessToken: json["AccessToken"] ? Token.fromJson(json["AccessToken"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "Result": result,
        "AccessToken": accessToken != null ? accessToken!.toJson() : null,
      };
}
