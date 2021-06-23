// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatedPlaylists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedPlaylists _$RelatedPlaylistsFromJson(Map<String, dynamic> json) {
  return RelatedPlaylists(
    likes: json['likes'] as String,
    uploads: json['uploads'] as String,
  );
}

Map<String, dynamic> _$RelatedPlaylistsToJson(RelatedPlaylists instance) =>
    <String, dynamic>{
      'likes': instance.likes,
      'uploads': instance.uploads,
    };
