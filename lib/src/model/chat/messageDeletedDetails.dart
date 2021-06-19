import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'messageDeletedDetails.g.dart';

@JsonSerializable()
class MessageDeletedDetails {
  final String? deletedMessageId;

  MessageDeletedDetails({this.deletedMessageId});

  factory MessageDeletedDetails.fromJson(Map<String, dynamic> json) =>
      _$MessageDeletedDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDeletedDetailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
