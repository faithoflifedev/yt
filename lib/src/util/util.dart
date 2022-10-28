import 'dart:convert';

import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:loggy/loggy.dart';
import 'package:universal_io/io.dart';

class Util {
  static LogOptions convertToLogOptions(String logLevel) {
    var logOptions = const LogOptions(LogLevel.off);

    switch (logLevel) {
      case 'all':
        logOptions = const LogOptions(LogLevel.all);
        break;

      case 'debug':
        logOptions = const LogOptions(LogLevel.debug);
        break;

      case 'info':
        logOptions = const LogOptions(LogLevel.info);
        break;

      case 'warning':
        logOptions = const LogOptions(LogLevel.warning);
        break;

      case 'error':
        logOptions = const LogOptions(LogLevel.error);
        break;
    }

    return logOptions;
  }

  static ClientId defaultClientId() =>
      clientIdFromFileSpec(defaultCredentialsFileSpec);

  static ClientId clientIdFromFileSpec(String fileSpec) =>
      ClientId.fromJson(json.decode(File(fileSpec).readAsStringSync()));

  static String base64GCloudString(String data) =>
      Util.base64GCloudList(utf8.encode(data));

  static String base64GCloudList(List<int> data) => base64
      .encode(data)
      .replaceAll('/', '_')
      .replaceAll('+', '-')
      .replaceAll('=', '');

  static int unixTimeStamp(DateTime dt) =>
      dt.toUtc().millisecondsSinceEpoch ~/ 1000;

  static T cast<T>(dynamic x, {required T fallback}) => x is T ? x : fallback;

  static String getUploadIdFromUrl(String locationUrl) {
    final locationUri = Uri.parse(locationUrl);

    if (!locationUri.queryParameters.containsKey('upload_id')) {
      throw Exception('The upload ID has not been found.');
    }

    return locationUri.queryParameters['upload_id']!;
  }

  static String? get userHome =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

  static String get defaultCredentialsFileSpec =>
      '${Util.userHome}/.yt/credentials.json';

  static File get defaultCredentialsFile => File(defaultCredentialsFileSpec);

  static File get defaultTokenFile =>
      File('${Util.userHome}/.yt/.refreshToken.json');

  static File get accessCredentialsFile =>
      File('${Util.userHome}/.yt/access_credentials.json');
}
