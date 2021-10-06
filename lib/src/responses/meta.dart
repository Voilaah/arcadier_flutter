part of '../responses.dart';

class MetaResponse {
  MetaResponse({
    required this.priceRange,
  });

  PriceRangeResponse priceRange;

  factory MetaResponse.fromJson(Map<String, dynamic> json) => MetaResponse(
        priceRange: PriceRangeResponse.fromJson(json["PriceRange"]),
      );

  Map<String, dynamic> toJson() => {
        "PriceRange": priceRange.toJson(),
      };
}
