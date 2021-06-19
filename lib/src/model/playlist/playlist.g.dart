// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return Playlist(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    id: json['id'] as String,
    snippet: json['snippet'] == null
        ? null
        : Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
    contentDetails: json['contentDetails'] == null
        ? null
        : ContentDetails.fromJson(
            json['contentDetails'] as Map<String, dynamic>),
    player: json['player'] == null
        ? null
        : Player.fromJson(json['player'] as Map<String, dynamic>),
    localizations: json['localizations'],
  );
}

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
      'snippet': instance.snippet?.toJson(),
      'status': instance.status?.toJson(),
      'contentDetails': instance.contentDetails?.toJson(),
      'player': instance.player?.toJson(),
      'localizations': instance.localizations,
    };
