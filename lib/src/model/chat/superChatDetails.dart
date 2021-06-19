import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'superChatDetails.g.dart';

@JsonSerializable()
class SuperChatDetails {
  final int? amountMicros;
  final String? currency;
  final String? amountDisplayString;
  final String? userComment;
  final int? tier;

  SuperChatDetails(
      {this.amountMicros,
      this.currency,
      this.amountDisplayString,
      this.userComment,
      this.tier});

  factory SuperChatDetails.fromJson(Map<String, dynamic> json) =>
      _$SuperChatDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SuperChatDetailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
