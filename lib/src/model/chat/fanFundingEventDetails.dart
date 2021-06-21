import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'fanFundingEventDetails.g.dart';

///Note: This object and its child properties have been deprecated. As of February 28, 2017, liveChatMessage resources will no longer return details for Fan Funding events.
///
///This object contains details about the funding event. It is only present if the message type is fanFundingEvent.
@deprecated
@JsonSerializable()
class FanFundingEventDetails {
  ///The amount of the fund.
  final int? amountMicros;

  ///The currency in which the fund was made.
  final String? currency;

  ///A rendered string that displays the fund amount and currency to the user.
  final String? amountDisplayString;
  //The comment added by the user to this fan funding event.
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
