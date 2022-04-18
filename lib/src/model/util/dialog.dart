import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:yt/util/emoji_formatter.dart';

import 'keyword.dart';

part 'dialog.g.dart';

@JsonSerializable(explicitToJson: true)
class Dialog {
  final String name;
  final List<String> answers;
  final Keyword keyword;

  Dialog({required this.name, required this.answers, required this.keyword});

  String get answer => EmojiFormatter.format((answers..shuffle()).first);

  factory Dialog.fromJson(Map<String, dynamic> json) => _$DialogFromJson(json);

  Map<String, dynamic> toJson() => _$DialogToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
