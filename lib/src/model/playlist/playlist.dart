import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'snippet.dart';
import 'status.dart';
import 'contentDetails.dart';
import 'player.dart';

part 'playlist.g.dart';

@JsonSerializable(explicitToJson: true)
class Playlist {
  final String kind;
  final String etag;
  final String id;
  final Snippet? snippet;
  final Status? status;
  final ContentDetails? contentDetails;
  final Player? player;
  final dynamic localizations;

  Playlist(
      {required this.kind,
      required this.etag,
      required this.id,
      this.snippet,
      this.status,
      this.contentDetails,
      this.player,
      this.localizations});

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
