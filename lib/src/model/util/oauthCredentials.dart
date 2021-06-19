import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:yaml/yaml.dart';

part 'oauthCredentials.g.dart';

@JsonSerializable()
class OAuthCredentials {
  final String url;
  final String clientId;
  final String clientSecret;
  final String refreshToken;

  OAuthCredentials(
      {required this.url,
      required this.clientId,
      required this.clientSecret,
      required this.refreshToken});

  factory OAuthCredentials.fromYaml(String yamlFile) {
    final jsonString = jsonEncode(loadYaml(File(yamlFile).readAsStringSync()));

    return OAuthCredentials.fromJson(jsonDecode(jsonString));
  }

  factory OAuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$OAuthCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$OAuthCredentialsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
