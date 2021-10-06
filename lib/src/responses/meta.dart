part of '../responses.dart';

class ArcadierMeta {
  ArcadierMeta({
    required this.priceRange,
  });

  ArcadierPriceRange priceRange;

  factory ArcadierMeta.fromJson(Map<String, dynamic> json) => ArcadierMeta(
        priceRange: ArcadierPriceRange.fromJson(json["PriceRange"]),
      );

  Map<String, dynamic> toJson() => {
        "PriceRange": priceRange.toJson(),
      };
}
