import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable(explicitToJson: true)
class Status {
  final String uploadStatus;
  final String failureReason;
  final String rejectionReason;
  final String privacyStatus;
  final DateTime publishAt;
  final String license;
  final bool embeddable;
  final bool publicStatsViewable;
  final bool madeForKids;
  final bool selfDeclaredMadeForKids;

  Status(
      {required this.uploadStatus,
      required this.failureReason,
      required this.rejectionReason,
      required this.privacyStatus,
      required this.publishAt,
      required this.license,
      required this.embeddable,
      required this.publicStatsViewable,
      required this.madeForKids,
      required this.selfDeclaredMadeForKids});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
