import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'textMessageDetails.g.dart';

@JsonSerializable()
class TextMessageDetails {
  final String messageText;

  TextMessageDetails({required this.messageText});

  factory TextMessageDetails.fromJson(Map<String, dynamic> json) =>
      _$TextMessageDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TextMessageDetailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
