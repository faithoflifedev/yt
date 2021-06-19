import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'expires_in')
  int expiresIn;
  String? scope;
  @JsonKey(name: 'token_type')
  String tokenType;

  Token(
      {required this.accessToken,
      required this.expiresIn,
      this.scope,
      required this.tokenType});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
