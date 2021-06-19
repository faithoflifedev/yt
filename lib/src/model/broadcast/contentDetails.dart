import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'monitorStream.dart';

part 'contentDetails.g.dart';

@JsonSerializable(explicitToJson: true)
class ContentDetails {
  final String? boundStreamId;
  final DateTime? boundStreamLastUpdateTimeMs;
  final MonitorStream monitorStream;
  final bool enableEmbed;
  final bool enableDvr;
  final bool enableContentEncryption;
  final bool startWithSlate;
  final bool recordFromStart;
  final bool enableClosedCaptions;
  final String closedCaptionsType;
  final bool enableLowLatency;
  final String latencyPreference;
  final String projection;
  final bool enableAutoStart;
  final bool enableAutoStop;

  ContentDetails(
      {required this.boundStreamId,
      required this.boundStreamLastUpdateTimeMs,
      required this.monitorStream,
      required this.enableEmbed,
      required this.enableDvr,
      required this.enableContentEncryption,
      required this.startWithSlate,
      required this.recordFromStart,
      required this.enableClosedCaptions,
      required this.closedCaptionsType,
      required this.enableLowLatency,
      required this.latencyPreference,
      required this.projection,
      required this.enableAutoStart,
      required this.enableAutoStop});

  factory ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$ContentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ContentDetailsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
