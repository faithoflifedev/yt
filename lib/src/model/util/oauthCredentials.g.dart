// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauthCredentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthCredentials _$OAuthCredentialsFromJson(Map<String, dynamic> json) {
  return OAuthCredentials(
    url: json['url'] as String,
    clientId: json['clientId'] as String,
    clientSecret: json['clientSecret'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$OAuthCredentialsToJson(OAuthCredentials instance) =>
    <String, dynamic>{
      'url': instance.url,
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret,
      'code': instance.code,
    };
