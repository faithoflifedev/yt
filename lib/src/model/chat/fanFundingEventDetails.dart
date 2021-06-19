import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'fanFundingEventDetails.g.dart';

@JsonSerializable()
class FanFundingEventDetails {
  final int? amountMicros;
  final String? currency;
  final String? amountDisplayString;
  final String? userComment;

  FanFundingEventDetails(
      {this.amountMicros,
      this.currency,
      this.amountDisplayString,
      this.userComment});

  factory FanFundingEventDetails.fromJson(Map<String, dynamic> json) =>
      _$FanFundingEventDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$FanFundingEventDetailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
