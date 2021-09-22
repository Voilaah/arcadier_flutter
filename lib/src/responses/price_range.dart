part of '../responses.dart';

class PriceRange {
  PriceRange({
    required this.minimum,
    required this.maximum,
  });

  int minimum;
  int maximum;

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        minimum: json["Minimum"],
        maximum: json["Maximum"],
      );

  Map<String, dynamic> toJson() => {
        "Minimum": minimum,
        "Maximum": maximum,
      };
}
