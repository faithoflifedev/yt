// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channelItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelItem _$ChannelItemFromJson(Map<String, dynamic> json) {
  return ChannelItem(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ChannelItemToJson(ChannelItem instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
    };
