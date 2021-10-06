part of '../requests.dart';

// To parse this JSON data, do
//
//     final userRequest = userRequestFromJson(jsonString);

UserRequest userRequestFromJson(String str) => UserRequest.fromJson(json.decode(str));

String userRequestToJson(UserRequest data) => json.encode(data.toJson());

class UserRequest {
  UserRequest({
    this.email,
    this.firstName,
    this.lastName,
    this.displayName,
    this.description,
    this.phoneNumber,
    this.media,
    this.customFields,
    this.timeZone,
    this.active,
    this.enabled,
    this.visible,
  });

  String? email;
  String? firstName;
  String? lastName;
  String? displayName;
  String? description;
  String? phoneNumber;
  List<ArcadierMedia>? media;
  List<ArcadierCustomField>? customFields;
  String? timeZone;
  bool? active;
  bool? enabled;
  bool? visible;

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        email: json["Email"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        displayName: json["DisplayName"],
        description: json["Description"],
        phoneNumber: json["PhoneNumber"],
        media: List<ArcadierMedia>.from(json["Media"].map((x) => ArcadierMedia.fromJson(x))),
        customFields: List<ArcadierCustomField>.from(json["CustomFields"].map((x) => ArcadierCustomField.fromJson(x))),
        timeZone: json["TimeZone"],
        active: json["Active"],
        enabled: json["Enabled"],
        visible: json["Visible"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "FirstName": firstName,
        "LastName": lastName,
        "DisplayName": displayName,
        "Description": description,
        "PhoneNumber": phoneNumber,
        "Media": media != null ? List<dynamic>.from(media!.map((x) => x.toJson())) : null,
        "CustomFields": customFields != null ? List<dynamic>.from(customFields!.map((x) => x.toJson())) : null,
        "TimeZone": timeZone,
        "Active": active,
        "Enabled": enabled,
        "Visible": visible,
      };
}
