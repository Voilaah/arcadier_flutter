part of '../responses.dart';

// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));

String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  Items({
    required this.totalRecords,
    required this.pageNumber,
    required this.pageSize,
    required this.records,
    required this.meta,
  });

  int totalRecords;
  int pageNumber;
  int pageSize;
  List<Item> records = [];
  Meta meta;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        totalRecords: json["TotalRecords"],
        pageNumber: json["PageNumber"],
        pageSize: json["PageSize"],
        records: List<Item>.from(json["Records"].map((x) => Item.fromJson(x))),
        meta: Meta.fromJson(json["Meta"]),
      );

  Map<String, dynamic> toJson() => {
        "TotalRecords": totalRecords,
        "PageNumber": pageNumber,
        "PageSize": pageSize,
        "Records": List<dynamic>.from(records.map((x) => x.toJson())),
        "Meta": meta.toJson(),
      };
}
