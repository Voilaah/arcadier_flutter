part of '../responses.dart';

class ArcadierPriceRange {
  ArcadierPriceRange({
    required this.minimum,
    required this.maximum,
  });

  double minimum;
  double maximum;

  factory ArcadierPriceRange.fromJson(Map<String, dynamic> json) => ArcadierPriceRange(
        minimum: json["Minimum"],
        maximum: json["Maximum"],
      );

  Map<String, dynamic> toJson() => {
        "Minimum": minimum,
        "Maximum": maximum,
      };
}
