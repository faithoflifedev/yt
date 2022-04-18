// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_chat_message_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveChatMessageListResponse _$LiveChatMessageListResponseFromJson(
        Map<String, dynamic> json) =>
    LiveChatMessageListResponse(
      kind: json['kind'] as String,
      etag: json['etag'] as String,
      nextPageToken: json['nextPageToken'] as String?,
      pollingIntervalMillis: json['pollingIntervalMillis'] as int?,
      offlineAt: json['offlineAt'] == null
          ? null
          : DateTime.parse(json['offlineAt'] as String),
      pageInfo: PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => LiveChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LiveChatMessageListResponseToJson(
        LiveChatMessageListResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'pollingIntervalMillis': instance.pollingIntervalMillis,
      'offlineAt': instance.offlineAt?.toIso8601String(),
      'pageInfo': instance.pageInfo.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
