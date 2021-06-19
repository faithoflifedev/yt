import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable(explicitToJson: true)
class Status {
  final String lifeCycleStatus;
  final String privacyStatus;
  final String recordingStatus;
  final bool madeForKids;
  final bool selfDeclaredMadeForKids;

  Status(
      {required this.lifeCycleStatus,
      required this.privacyStatus,
      required this.recordingStatus,
      required this.madeForKids,
      required this.selfDeclaredMadeForKids});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
