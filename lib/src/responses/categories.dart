part of '../responses.dart';

// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

ArcadierCategories categoriesFromJson(String str) => ArcadierCategories.fromJson(json.decode(str));

String categoriesToJson(ArcadierCategories data) => json.encode(data.toJson());

class ArcadierCategories {
  ArcadierCategories({
    required this.totalRecords,
    required this.pageNumber,
    required this.pageSize,
    required this.records,
    this.meta,
  });

  int totalRecords;
  int pageNumber;
  int pageSize;
  List<ArcadierCategory> records;
  ArcadierMeta? meta;

  factory ArcadierCategories.fromJson(Map<String, dynamic> json) => ArcadierCategories(
        totalRecords: json["TotalRecords"],
        pageNumber: json["PageNumber"],
        pageSize: json["PageSize"],
        records: List<ArcadierCategory>.from(json["Records"].map((x) => ArcadierCategory.fromJson(x))),
        meta: (json["Meta"] != null && (json["Meta"] as Map).isNotEmpty) ? ArcadierMeta.fromJson(json["Meta"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "TotalRecords": totalRecords,
        "PageNumber": pageNumber,
        "PageSize": pageSize,
        "Records": List<dynamic>.from(records.map((x) => x.toJson())),
        "Meta": meta?.toJson(),
      };
}
