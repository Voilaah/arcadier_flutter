part of '../responses.dart';

// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

CategoriesResponse categoriesFromJson(String str) => CategoriesResponse.fromJson(json.decode(str));

String categoriesToJson(CategoriesResponse data) => json.encode(data.toJson());

class CategoriesResponse {
  CategoriesResponse({
    required this.totalRecords,
    required this.pageNumber,
    required this.pageSize,
    required this.records,
    this.meta,
  });

  int totalRecords;
  int pageNumber;
  int pageSize;
  List<CategoryResponse> records;
  MetaResponse? meta;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
        totalRecords: json["TotalRecords"],
        pageNumber: json["PageNumber"],
        pageSize: json["PageSize"],
        records: List<CategoryResponse>.from(json["Records"].map((x) => CategoryResponse.fromJson(x))),
        meta: (json["Meta"] != null && (json["Meta"] as Map).isNotEmpty) ? MetaResponse.fromJson(json["Meta"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "TotalRecords": totalRecords,
        "PageNumber": pageNumber,
        "PageSize": pageSize,
        "Records": List<dynamic>.from(records.map((x) => x.toJson())),
        "Meta": meta?.toJson(),
      };
}
