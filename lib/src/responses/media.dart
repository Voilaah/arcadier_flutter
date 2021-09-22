part of '../responses.dart';

Media mediaFromJson(String str) => Media.fromJson(json.decode(str));

String mediaToJson(Media data) => json.encode(data.toJson());

class Media {
  Media({
    required this.id,
    required this.mediaUrl,
  });

  dynamic id;
  String mediaUrl;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["ID"],
        mediaUrl: json["MediaUrl"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MediaUrl": mediaUrl,
      };
}
