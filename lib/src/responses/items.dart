part of '../responses.dart';

// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

ItemsResponse itemsFromJson(String str) => ItemsResponse.fromJson(json.decode(str));

String itemsToJson(ItemsResponse data) => json.encode(data.toJson());

class ItemsResponse {
  ItemsResponse({
    required this.totalRecords,
    required this.pageNumber,
    required this.pageSize,
    required this.records,
    required this.meta,
  });

  int totalRecords;
  int pageNumber;
  int pageSize;
  List<ItemResponse> records = [];
  MetaResponse meta;

  factory ItemsResponse.fromJson(Map<String, dynamic> json) => ItemsResponse(
        totalRecords: json["TotalRecords"],
        pageNumber: json["PageNumber"],
        pageSize: json["PageSize"],
        records: List<ItemResponse>.from(json["Records"].map((x) => ItemResponse.fromJson(x))),
        meta: MetaResponse.fromJson(json["Meta"]),
      );

  Map<String, dynamic> toJson() => {
        "TotalRecords": totalRecords,
        "PageNumber": pageNumber,
        "PageSize": pageSize,
        "Records": List<dynamic>.from(records.map((x) => x.toJson())),
        "Meta": meta.toJson(),
      };
}
