part of '../responses.dart';

// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    required this.totalRecords,
    required this.pageNumber,
    required this.pageSize,
    required this.records,
    this.meta,
  });

  int totalRecords;
  int pageNumber;
  int pageSize;
  List<Category> records;
  Meta? meta;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        totalRecords: json["TotalRecords"],
        pageNumber: json["PageNumber"],
        pageSize: json["PageSize"],
        records: List<Category>.from(json["Records"].map((x) => Category.fromJson(x))),
        meta: (json["Meta"] != null && (json["Meta"] as Map).isNotEmpty) ? Meta.fromJson(json["Meta"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "TotalRecords": totalRecords,
        "PageNumber": pageNumber,
        "PageSize": pageSize,
        "Records": List<dynamic>.from(records.map((x) => x.toJson())),
        "Meta": meta?.toJson(),
      };
}
