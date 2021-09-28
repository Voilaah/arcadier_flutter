part of '../responses.dart';

// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    required this.totalRecords,
    required this.pageNumber,
    required this.pageSize,
    required this.records,
  });

  int totalRecords;
  int pageNumber;
  int pageSize;
  List<User> records;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        totalRecords: json["TotalRecords"],
        pageNumber: json["PageNumber"],
        pageSize: json["PageSize"],
        records: List<User>.from(json["Records"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TotalRecords": totalRecords,
        "PageNumber": pageNumber,
        "PageSize": pageSize,
        "Records": List<User>.from(records.map((x) => x.toJson())),
      };
}

enum Role { USER, MERCHANT, OWNER, ADMIN }

final roleValues = EnumValues({"Admin": Role.ADMIN, "Merchant": Role.MERCHANT, "Owner": Role.OWNER, "User": Role.USER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
