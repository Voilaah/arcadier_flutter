part of '../responses.dart';

// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

UsersResponse usersFromJson(String str) => UsersResponse.fromJson(json.decode(str));

String usersToJson(UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
  UsersResponse({
    required this.totalRecords,
    required this.pageNumber,
    required this.pageSize,
    required this.records,
  });

  int totalRecords;
  int pageNumber;
  int pageSize;
  List<UserResponse> records;

  factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        totalRecords: json["TotalRecords"],
        pageNumber: json["PageNumber"],
        pageSize: json["PageSize"],
        records: List<UserResponse>.from(json["Records"].map((x) => UserResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TotalRecords": totalRecords,
        "PageNumber": pageNumber,
        "PageSize": pageSize,
        "Records": List<UserResponse>.from(records.map((x) => x.toJson())),
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
