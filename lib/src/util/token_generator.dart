import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';
import 'package:yt/src/provider/oauth.dart';
import 'package:yt/src/util/util.dart';
import 'package:yt/yt.dart';

abstract class TokenGenerator {
  Future<Token> generate();
}

class OAuthGenerator implements TokenGenerator {
  final Dio dio;
  final OAuthCredentials oauthCredentials;
  final bool refresh;

  OAuthGenerator(
      {required this.oauthCredentials,
      required this.dio,
      this.refresh = false});

  factory OAuthGenerator.fromYamlCredentials(
      {required String credentialsFile, required Dio dio}) {
    return OAuthGenerator(
        oauthCredentials: OAuthCredentials.fromJson(jsonDecode(
            jsonEncode(loadYaml(File(credentialsFile).readAsStringSync())))),
        dio: dio);
  }

  ///generate and persist the OAuth2 refresh token from a single use auth code
  @override
  Future<Token> generate() async {
    final OAuthClient oAuthClient = OAuthClient(dio);

    final tokenFile = File('${Util.userHome}/.yt/.refreshToken.json');

    final tokenFileExits = tokenFile.existsSync();

    if (tokenFileExits && refresh) tokenFile.deleteSync();

    final tokenStore = <String, dynamic>{};

    String? refreshToken;

    if (tokenFileExits) {
      tokenStore.addAll(json.decode(tokenFile.readAsStringSync()));
    }

    if (tokenStore.containsKey(oauthCredentials.clientId)) {
      refreshToken = tokenStore[oauthCredentials.clientId];
    } else {
      try {
        final token = await oAuthClient.getToken({
          'client_id': oauthCredentials.clientId,
          'client_secret': oauthCredentials.clientSecret,
          'code': oauthCredentials.code,
          'redirect_uri': 'urn:ietf:wg:oauth:2.0:oob',
          'grant_type': 'authorization_code'
        });

        if (token.refreshToken == null) {
          throw Exception('Could not retrieve the refresh token');
        }

        refreshToken = token.refreshToken!;
      } on DioError catch (err) {
        throw AuthorizationException(err.response.toString(), err);
      }

      tokenStore[oauthCredentials.clientId] = refreshToken;

      tokenFile.writeAsStringSync(json.encode(tokenStore));
    }

    try {
      final token = await oAuthClient.getToken({
        'client_id': oauthCredentials.clientId,
        'client_secret': oauthCredentials.clientSecret,
        'refresh_token': refreshToken,
        'grant_type': 'refresh_token'
      });

      return token;
    } on DioError catch (err) {
      throw Exception(err.response?.data);
    }
  }
}
