part of '../requests.dart';

// To parse this JSON data, do
//
//     final userRequest = userRequestFromJson(jsonString);

UserRequest userRequestFromJson(String str) => UserRequest.fromJson(json.decode(str));

String userRequestToJson(UserRequest data) => json.encode(data.toJson());

class UserRequest {
  UserRequest({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.description,
    required this.phoneNumber,
    required this.media,
    required this.customFields,
    required this.timeZone,
    required this.active,
    required this.enabled,
    required this.visible,
  });

  String email;
  String firstName;
  String lastName;
  String displayName;
  String description;
  String phoneNumber;
  List<Media> media;
  List<CustomField> customFields;
  String timeZone;
  bool active;
  bool enabled;
  bool visible;

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        email: json["Email"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        displayName: json["DisplayName"],
        description: json["Description"],
        phoneNumber: json["PhoneNumber"],
        media: List<Media>.from(json["Media"].map((x) => Media.fromJson(x))),
        customFields: List<CustomField>.from(json["CustomFields"].map((x) => CustomField.fromJson(x))),
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
        "Media": List<dynamic>.from(media.map((x) => x.toJson())),
        "CustomFields": List<dynamic>.from(customFields.map((x) => x.toJson())),
        "TimeZone": timeZone,
        "Active": active,
        "Enabled": enabled,
        "Visible": visible,
      };
}
