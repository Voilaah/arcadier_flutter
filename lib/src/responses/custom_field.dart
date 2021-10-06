part of '../responses.dart';

class CustomFieldResponse {
  CustomFieldResponse({
    required this.code,
    required this.name,
    required this.dataFieldType,
    required this.values,
    required this.isComparable,
  });

  String code;
  String name;
  String dataFieldType;
  List<String> values;
  bool isComparable;

  factory CustomFieldResponse.fromJson(Map<String, dynamic> json) => CustomFieldResponse(
        code: json["Code"],
        name: json["Name"],
        dataFieldType: json["DataFieldType"],
        values: List<String>.from(json["Values"].map((x) => x)),
        isComparable: json["IsComparable"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "DataFieldType": dataFieldType,
        "Values": List<dynamic>.from(values.map((x) => x)),
        "IsComparable": isComparable,
      };
}
