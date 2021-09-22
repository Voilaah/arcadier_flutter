part of '../responses.dart';

class Category {
  Category({
    required this.id,
    required this.name,
    this.description,
    required this.sortOrder,
    required this.media,
    required this.parentCategoryId,
    this.childCategories,
    this.level,
    required this.createdDateTime,
    required this.modifiedDateTime,
    this.commission,
    this.customFields,
  });

  String id;
  String name;
  String? description;
  int sortOrder;
  List<Media> media = [];
  String parentCategoryId;
  dynamic childCategories;
  dynamic level;
  int createdDateTime;
  int modifiedDateTime;
  dynamic commission;
  dynamic customFields;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["ID"],
        name: json["Name"],
        description: json["Description"],
        sortOrder: json["SortOrder"],
        media: json["Media"],
        parentCategoryId: json["ParentCategoryID"] == null ? null : json["ParentCategoryID"],
        childCategories: json["ChildCategories"],
        level: json["Level"],
        createdDateTime: json["CreatedDateTime"],
        modifiedDateTime: json["ModifiedDateTime"],
        commission: json["Commission"],
        customFields: json["CustomFields"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "Description": description,
        "SortOrder": sortOrder,
        "Media": media,
        "ParentCategoryID": parentCategoryId == null ? null : parentCategoryId,
        "ChildCategories": childCategories,
        "Level": level,
        "CreatedDateTime": createdDateTime,
        "ModifiedDateTime": modifiedDateTime,
        "Commission": commission,
        "CustomFields": customFields,
      };
}