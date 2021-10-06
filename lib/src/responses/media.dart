part of '../responses.dart';

MediaResponse mediaFromJson(String str) => MediaResponse.fromJson(json.decode(str));

String mediaToJson(MediaResponse data) => json.encode(data.toJson());

class MediaResponse {
  MediaResponse({
    required this.id,
    required this.mediaUrl,
  });

  dynamic id;
  String mediaUrl;

  factory MediaResponse.fromJson(Map<String, dynamic> json) => MediaResponse(
        id: json["ID"],
        mediaUrl: json["MediaUrl"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MediaUrl": mediaUrl,
      };
}
