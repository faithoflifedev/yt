import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:universal_io/io.dart';
import 'package:yt/src/provider/oauth.dart';
import 'package:yt/src/util/util.dart';

///Generate a refresh token used to authenticate the command line API requests
class YoutubeAuthorizeCommand extends Command {
  @override
  String get description =>
      'Generate a refresh token used to authenticate the command line API requests';

  @override
  String get name => 'authorize';

  @override
  void run() async {
    final OAuthClient oAuthClient = OAuthClient(Dio());

    final tokenStore = <String, dynamic>{};

    final credFile = Util.defaultCredentialsFile;

    final tokenFile = Util.defaultTokenFile;

    final hasCred = credFile.existsSync();

    final hasToken = tokenFile.existsSync();

    String? approval;

    final credentials = <String, dynamic>{};

    if (hasCred) {
      print('Do you want to overwrite credentials for this clientId [y/n]:');

      approval = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

      //use existing credentials from filesystem
      if (approval != null && approval.startsWith('n')) {
        final content = credFile.readAsStringSync();

        try {
          credentials.addAll(json.decode(content));
        } catch (exception) {
          stderr.write('Error reading the credentials file.\n');

          exit(64);
        }
      }
    }

    if (hasToken) {
      try {
        tokenStore.addAll(json.decode(tokenFile.readAsStringSync()));
      } catch (exception) {
        stderr.write('Error reading the token file.\n');

        exit(64);
      }
    }

    if (credentials.containsKey('clientId') &&
        tokenStore.containsKey(credentials['clientId'])) {
      print('Do you want to overwrite authorization for this clientId [y/n]:');

      approval = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

      if (approval != null && approval.startsWith('n')) {
        exit(0);
      } else {
        tokenStore.clear();

        tokenFile.deleteSync();
      }
    }

    if (!credentials.containsKey('clientId')) {
      print('Enter clientId:');

      credentials['identifier'] =
          stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

      print('Enter clientSecret:');

      credentials['secret'] =
          stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
    }

    print(
        'Follow the link provided below, provide your YouTube credentials for authorization and then paste in the provided "code":');

    print(
        'https://accounts.google.com/o/oauth2/v2/auth?client_id=${credentials['identifier']}&response_type=code&scope=https://www.googleapis.com/auth/youtube&redirect_uri=urn:ietf:wg:oauth:2.0:oob&access_type=offline');

    print('\nEnter authorization code:');

    credentials['code'] =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

    if (credentials['identifier'] == null ||
        credentials['secret'] == null ||
        credentials['code'] == null) {
      throw Exception('Error: missing required data.');
    }

    if (!hasCred) {
      credFile.createSync(recursive: true);
    }

    credFile.writeAsStringSync(json.encode(credentials));

    final token = await oAuthClient.getToken({
      'client_id': credentials['identifier'],
      'client_secret': credentials['secret'],
      'code': credentials['code'],
      'redirect_uri': 'urn:ietf:wg:oauth:2.0:oob',
      'grant_type': 'authorization_code'
    });

    if (token.refreshToken == null) {
      throw Exception('Could not retrieve the refresh token');
    }

    tokenStore.addAll({credentials['identifier']!: token.refreshToken});

    tokenFile.createSync(recursive: true);

    tokenFile.writeAsStringSync(json.encode(tokenStore));

    print('Authorization completed.');
  }
}
