part of '../responses.dart';

class PriceRangeResponse {
  PriceRangeResponse({
    required this.minimum,
    required this.maximum,
  });

  double minimum;
  double maximum;

  factory PriceRangeResponse.fromJson(Map<String, dynamic> json) => PriceRangeResponse(
        minimum: json["Minimum"],
        maximum: json["Maximum"],
      );

  Map<String, dynamic> toJson() => {
        "Minimum": minimum,
        "Maximum": maximum,
      };
}
