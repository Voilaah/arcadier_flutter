part of '../responses.dart';

class Meta {
  Meta({
    required this.priceRange,
  });

  PriceRange priceRange;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        priceRange: PriceRange.fromJson(json["PriceRange"]),
      );

  Map<String, dynamic> toJson() => {
        "PriceRange": priceRange.toJson(),
      };
}
