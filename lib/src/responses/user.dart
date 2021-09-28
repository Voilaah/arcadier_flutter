part of '../responses.dart';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    this.userName = null,
    required this.email,
    this.firstName,
    this.lastName,
    this.displayName,
    this.description,
    this.dob,
    this.phoneNumber,
    required this.dateJoined,
    this.roles,
    this.media,
    required this.customFields,
    required this.timeZone,
    required this.onboarded,
    this.onboardedDateTime,
    required this.active,
    required this.enabled,
    required this.visible,
    required this.guest,
    required this.addresses,
    required this.paymentMethods,
    required this.paymentAcceptanceMethods,
    required this.userLogins,
    required this.adminOwnerId,
    required this.languageCode,
    required this.accountOwnerId,
    required this.permissions,
    required this.totalSuccessfulOrderCount,
  }) {
    roles = [];
    media = [];
  }

  String id;
  String? userName;
  String email;
  String? firstName;
  String? lastName;
  String? displayName;
  String? description;
  dynamic? dob;
  String? phoneNumber;
  int dateJoined;
  List<String>? roles = [];
  List<Media>? media = [];
  dynamic customFields;
  dynamic timeZone;
  bool onboarded;
  int? onboardedDateTime;
  bool active;
  bool enabled;
  bool visible;
  bool guest;
  dynamic addresses;
  dynamic paymentMethods;
  dynamic paymentAcceptanceMethods;
  dynamic userLogins;
  dynamic adminOwnerId;
  dynamic languageCode;
  dynamic accountOwnerId;
  dynamic permissions;
  int totalSuccessfulOrderCount;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["ID"],
        userName: json["UserName"],
        email: json["Email"],
        firstName: json["FirstName"] ?? json["FirstName"],
        lastName: json["LastName"] ?? json["LastName"],
        displayName: json["DisplayName"] ?? json["DisplayName"],
        description: json["Description"],
        dob: json["DOB"],
        phoneNumber: json["PhoneNumber"],
        dateJoined: json["DateJoined"],
        roles: List<String>.from(json["Roles"].map((x) => x)),
        media: List<Media>.from(json["Media"].map((x) => x)),
        customFields: json["CustomFields"],
        timeZone: json["TimeZone"],
        onboarded: json["Onboarded"],
        onboardedDateTime: json["OnboardedDateTime"],
        active: json["Active"],
        enabled: json["Enabled"],
        visible: json["Visible"],
        guest: json["Guest"],
        addresses: json["Addresses"],
        paymentMethods: json["PaymentMethods"],
        paymentAcceptanceMethods: json["PaymentAcceptanceMethods"],
        userLogins: json["UserLogins"],
        adminOwnerId: json["AdminOwnerID"],
        languageCode: json["LanguageCode"],
        accountOwnerId: json["AccountOwnerID"],
        permissions: json["Permissions"],
        totalSuccessfulOrderCount: json["TotalSuccessfulOrderCount"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "UserName": userName,
        "Email": email,
        "FirstName": firstName,
        "LastName": lastName,
        "DisplayName": displayName,
        "Description": description,
        "DOB": dob,
        "PhoneNumber": phoneNumber,
        "DateJoined": dateJoined,
        "Roles": List<dynamic>.from(roles!.map((x) => x)),
        "Media": List<dynamic>.from(media!.map((x) => x)),
        "CustomFields": customFields,
        "TimeZone": timeZone,
        "Onboarded": onboarded,
        "OnboardedDateTime": onboardedDateTime,
        "Active": active,
        "Enabled": enabled,
        "Visible": visible,
        "Guest": guest,
        "Addresses": addresses,
        "PaymentMethods": paymentMethods,
        "PaymentAcceptanceMethods": paymentAcceptanceMethods,
        "UserLogins": userLogins,
        "AdminOwnerID": adminOwnerId,
        "LanguageCode": languageCode,
        "AccountOwnerID": accountOwnerId,
        "Permissions": permissions,
        "TotalSuccessfulOrderCount": totalSuccessfulOrderCount,
      };
}
