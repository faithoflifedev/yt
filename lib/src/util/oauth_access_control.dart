import 'dart:convert';

import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' show Client;
import 'package:yt/src/util/util.dart';

class OAuthAccessControl {
  final ClientId clientId;

  final Client httpClient;

  late AccessCredentials accessCredentials;

  bool initialized = false;

  String get token => accessCredentials.accessToken.data;

  OAuthAccessControl({required this.clientId, required this.httpClient});

  Future<void> checkAccessToken() async {
    if (!initialized) {
      await init();
    }

    if (accessCredentials.accessToken.expiry.isBefore(DateTime.now())) {
      accessCredentials =
          await refreshCredentials(clientId, accessCredentials, httpClient);
    }
  }

  Future<void> init() async {
    final credentialsFile = Util.accessCredentialsFile;

    if (credentialsFile.existsSync()) {
      accessCredentials = AccessCredentials.fromJson(
          json.decode(credentialsFile.readAsStringSync()));

      accessCredentials =
          await refreshCredentials(clientId, accessCredentials, httpClient);
    } else {
      accessCredentials = await obtainAccessCredentialsViaUserConsent(
          clientId, ['https://www.googleapis.com/auth/youtube'], httpClient,
          (String url) {
        print('Please go to the following URL and grant access:');
        print('  => $url');
      });

      credentialsFile.writeAsStringSync(
        json.encode(accessCredentials.toJson()),
        flush: true,
      );
    }

    initialized = true;
  }
}
