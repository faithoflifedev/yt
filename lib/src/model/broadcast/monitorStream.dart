import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'monitorStream.g.dart';

@JsonSerializable()
class MonitorStream {
  final bool enableMonitorStream;
  final int? broadcastStreamDelayMs;
  final String? embedHtml;

  @JsonSerializable()
  MonitorStream({
    required this.enableMonitorStream,
    this.broadcastStreamDelayMs,
    this.embedHtml,
  });

  factory MonitorStream.fromJson(Map<String, dynamic> json) =>
      _$MonitorStreamFromJson(json);

  Map<String, dynamic> toJson() => _$MonitorStreamToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
