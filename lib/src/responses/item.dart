part of '../responses.dart';

// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    required this.id,
    this.sku,
    required this.name,
    this.buyerDescription,
    this.sellerDescription,
    required this.price,
    this.priceUnit,
    required this.stockLimited,
    required this.stockQuantity,
    required this.isVisibleToCustomer,
    required this.active,
    required this.isAvailable,
    this.dateOfPurchase,
    this.weight,
    this.weightUnit,
    this.cubes,
    this.cubeUnit,
    this.length,
    this.lengthUnit,
    this.width,
    this.widthUnit,
    this.height,
    this.heightUnit,
    this.additionalDetails,
    this.expiryDate,
    required this.currencyCode,
    this.parentId,
    this.averageRating,
    required this.instantBuy,
    required this.negotiation,
    this.keywords,
    required this.merchantDetail,
    this.location,
    required this.categories,
    required this.shippingMethods,
    required this.pickupAddresses,
    required this.media,
    this.tags,
    this.scheduler,
    this.distance,
    required this.customFields,
    required this.createdDateTime,
    required this.modifiedDateTime,
    required this.hasChildItems,
    required this.childItems,
    required this.addOns,
    this.serviceBookingUnitGuid,
    this.bookingUnit,
    this.durationUnit,
    required this.isLocked,
  });

  String id;
  String? sku;
  String name;
  String? buyerDescription;
  String? sellerDescription;
  double price;
  dynamic priceUnit;
  bool stockLimited;
  int stockQuantity;
  bool isVisibleToCustomer;
  bool active;
  bool isAvailable;
  dynamic dateOfPurchase;
  dynamic weight;
  dynamic weightUnit;
  dynamic cubes;
  dynamic cubeUnit;
  dynamic length;
  dynamic lengthUnit;
  dynamic width;
  dynamic widthUnit;
  dynamic height;
  dynamic heightUnit;
  dynamic additionalDetails;
  dynamic expiryDate;
  String currencyCode;
  dynamic parentId;
  dynamic averageRating;
  bool instantBuy;
  bool negotiation;
  dynamic keywords;
  MerchantDetail merchantDetail;
  dynamic location;
  List<Category> categories;
  List<dynamic> shippingMethods;
  List<dynamic> pickupAddresses;
  List<Media> media;
  dynamic tags;
  dynamic scheduler;
  dynamic distance;
  List<CustomField> customFields;
  int createdDateTime;
  int modifiedDateTime;
  bool hasChildItems;
  List<dynamic>? childItems;
  List<dynamic>? addOns;
  dynamic serviceBookingUnitGuid;
  dynamic bookingUnit;
  dynamic durationUnit;
  bool isLocked;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["ID"],
        sku: json["SKU"],
        name: json["Name"],
        buyerDescription: json["BuyerDescription"],
        sellerDescription: json["SellerDescription"],
        price: json["Price"],
        priceUnit: json["PriceUnit"],
        stockLimited: json["StockLimited"],
        stockQuantity: json["StockQuantity"],
        isVisibleToCustomer: json["IsVisibleToCustomer"],
        active: json["Active"],
        isAvailable: json["IsAvailable"],
        dateOfPurchase: json["DateOfPurchase"],
        weight: json["Weight"],
        weightUnit: json["WeightUnit"],
        cubes: json["Cubes"],
        cubeUnit: json["CubeUnit"],
        length: json["Length"],
        lengthUnit: json["LengthUnit"],
        width: json["Width"],
        widthUnit: json["WidthUnit"],
        height: json["Height"],
        heightUnit: json["HeightUnit"],
        additionalDetails: json["AdditionalDetails"],
        expiryDate: json["ExpiryDate"],
        currencyCode: json["CurrencyCode"],
        parentId: json["ParentID"],
        averageRating: json["AverageRating"],
        instantBuy: json["InstantBuy"],
        negotiation: json["Negotiation"],
        keywords: json["Keywords"],
        merchantDetail: MerchantDetail.fromJson(json["MerchantDetail"]),
        location: json["Location"],
        categories: List<Category>.from(json["Categories"].map((x) => Category.fromJson(x))),
        shippingMethods:
            json["ShippingMethods"] != null ? List<dynamic>.from(json["ShippingMethods"].map((x) => x)) : [],
        pickupAddresses:
            json["PickupAddresses"] != null ? List<dynamic>.from(json["PickupAddresses"].map((x) => x)) : [],
        media: json["Media"] != null ? List<Media>.from(json["Media"].map((x) => Media.fromJson(x))) : [],
        tags: json["Tags"],
        scheduler: json["Scheduler"],
        distance: json["Distance"],
        customFields: List<CustomField>.from(json["CustomFields"].map((x) => CustomField.fromJson(x))),
        createdDateTime: json["CreatedDateTime"],
        modifiedDateTime: json["ModifiedDateTime"],
        hasChildItems: json["HasChildItems"],
        childItems: json["ChildItems"] != null ? List<dynamic>.from(json["ChildItems"].map((x) => x)) : [],
        addOns: json["AddOns"] != null ? List<dynamic>.from(json["AddOns"].map((x) => x)) : [],
        serviceBookingUnitGuid: json["ServiceBookingUnitGuid"],
        bookingUnit: json["BookingUnit"],
        durationUnit: json["DurationUnit"],
        isLocked: json["IsLocked"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "SKU": sku,
        "Name": name,
        "BuyerDescription": buyerDescription,
        "SellerDescription": sellerDescription,
        "Price": price,
        "PriceUnit": priceUnit,
        "StockLimited": stockLimited,
        "StockQuantity": stockQuantity,
        "IsVisibleToCustomer": isVisibleToCustomer,
        "Active": active,
        "IsAvailable": isAvailable,
        "DateOfPurchase": dateOfPurchase,
        "Weight": weight,
        "WeightUnit": weightUnit,
        "Cubes": cubes,
        "CubeUnit": cubeUnit,
        "Length": length,
        "LengthUnit": lengthUnit,
        "Width": width,
        "WidthUnit": widthUnit,
        "Height": height,
        "HeightUnit": heightUnit,
        "AdditionalDetails": additionalDetails,
        "ExpiryDate": expiryDate,
        "CurrencyCode": currencyCode,
        "ParentID": parentId,
        "AverageRating": averageRating,
        "InstantBuy": instantBuy,
        "Negotiation": negotiation,
        "Keywords": keywords,
        "MerchantDetail": merchantDetail.toJson(),
        "Location": location,
        "Categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "ShippingMethods": List<dynamic>.from(shippingMethods.map((x) => x)),
        "PickupAddresses": List<dynamic>.from(pickupAddresses.map((x) => x)),
        "Media": List<dynamic>.from(media.map((x) => x.toJson())),
        "Tags": tags,
        "Scheduler": scheduler,
        "Distance": distance,
        "CustomFields": List<dynamic>.from(customFields.map((x) => x.toJson())),
        "CreatedDateTime": createdDateTime,
        "ModifiedDateTime": modifiedDateTime,
        "HasChildItems": hasChildItems,
        "ChildItems": childItems != null ? List<dynamic>.from(childItems!.map((x) => x)) : [],
        "AddOns": addOns != null ? List<dynamic>.from(addOns!.map((x) => x)) : [],
        "ServiceBookingUnitGuid": serviceBookingUnitGuid,
        "BookingUnit": bookingUnit,
        "DurationUnit": durationUnit,
        "IsLocked": isLocked,
      };
}
