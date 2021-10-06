part of '../responses.dart';

// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

ArcadierUsers usersFromJson(String str) => ArcadierUsers.fromJson(json.decode(str));

String usersToJson(ArcadierUsers data) => json.encode(data.toJson());

class ArcadierUsers {
  ArcadierUsers({
    required this.totalRecords,
    required this.pageNumber,
    required this.pageSize,
    required this.records,
  });

  int totalRecords;
  int pageNumber;
  int pageSize;
  List<ArcadierUser> records;

  factory ArcadierUsers.fromJson(Map<String, dynamic> json) => ArcadierUsers(
        totalRecords: json["TotalRecords"],
        pageNumber: json["PageNumber"],
        pageSize: json["PageSize"],
        records: List<ArcadierUser>.from(json["Records"].map((x) => ArcadierUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TotalRecords": totalRecords,
        "PageNumber": pageNumber,
        "PageSize": pageSize,
        "Records": List<ArcadierUser>.from(records.map((x) => x.toJson())),
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
