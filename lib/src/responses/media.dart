part of '../responses.dart';

ArcadierMedia mediaFromJson(String str) => ArcadierMedia.fromJson(json.decode(str));

String mediaToJson(ArcadierMedia data) => json.encode(data.toJson());

class ArcadierMedia {
  ArcadierMedia({
    required this.id,
    required this.mediaUrl,
  });

  dynamic id;
  String mediaUrl;

  factory ArcadierMedia.fromJson(Map<String, dynamic> json) => ArcadierMedia(
        id: json["ID"],
        mediaUrl: json["MediaUrl"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MediaUrl": mediaUrl,
      };
}
