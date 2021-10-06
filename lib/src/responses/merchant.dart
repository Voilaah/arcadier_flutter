part of '../responses.dart';

class MerchantDetail {
  MerchantDetail({
    required this.id,
    this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    this.description,
    this.dob,
    required this.phoneNumber,
    this.dateJoined,
    this.roles,
    required this.media,
    this.customFields,
    this.timeZone,
    this.onboarded,
    this.onboardedDateTime,
    this.active,
    this.enabled,
    this.visible,
    this.guest,
    this.addresses,
    this.paymentMethods,
    this.paymentAcceptanceMethods,
    this.userLogins,
    this.adminOwnerId,
    this.languageCode,
    this.accountOwnerId,
    this.permissions,
    required this.totalSuccessfulOrderCount,
  });

  String id;
  String? userName;
  String email;
  String firstName;
  String lastName;
  String displayName;
  String? description;
  dynamic dob;
  String phoneNumber;
  dynamic dateJoined;
  dynamic roles;
  List<MediaResponse> media;
  dynamic customFields;
  dynamic timeZone;
  dynamic onboarded;
  dynamic onboardedDateTime;
  dynamic active;
  dynamic enabled;
  dynamic visible;
  dynamic guest;
  dynamic addresses;
  dynamic paymentMethods;
  dynamic paymentAcceptanceMethods;
  dynamic userLogins;
  dynamic adminOwnerId;
  dynamic languageCode;
  dynamic accountOwnerId;
  dynamic permissions;
  int totalSuccessfulOrderCount;

  factory MerchantDetail.fromJson(Map<String, dynamic> json) => MerchantDetail(
        id: json["ID"],
        userName: json["UserName"],
        email: json["Email"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        displayName: json["DisplayName"],
        description: json["Description"],
        dob: json["DOB"],
        phoneNumber: json["PhoneNumber"],
        dateJoined: json["DateJoined"],
        roles: json["Roles"],
        media: List<MediaResponse>.from(json["Media"].map((x) => MediaResponse.fromJson(x))),
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
        "Roles": roles,
        "Media": List<dynamic>.from(media.map((x) => x.toJson())),
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
