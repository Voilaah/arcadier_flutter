part of '../responses.dart';

// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

ArcadierItems itemsFromJson(String str) => ArcadierItems.fromJson(json.decode(str));

String itemsToJson(ArcadierItems data) => json.encode(data.toJson());

class ArcadierItems {
  ArcadierItems({
    required this.totalRecords,
    required this.pageNumber,
    required this.pageSize,
    required this.records,
    required this.meta,
  });

  int totalRecords;
  int pageNumber;
  int pageSize;
  List<ArcadierItem> records = [];
  ArcadierMeta meta;

  factory ArcadierItems.fromJson(Map<String, dynamic> json) => ArcadierItems(
        totalRecords: json["TotalRecords"],
        pageNumber: json["PageNumber"],
        pageSize: json["PageSize"],
        records: List<ArcadierItem>.from(json["Records"].map((x) => ArcadierItem.fromJson(x))),
        meta: ArcadierMeta.fromJson(json["Meta"]),
      );

  Map<String, dynamic> toJson() => {
        "TotalRecords": totalRecords,
        "PageNumber": pageNumber,
        "PageSize": pageSize,
        "Records": List<dynamic>.from(records.map((x) => x.toJson())),
        "Meta": meta.toJson(),
      };
}
