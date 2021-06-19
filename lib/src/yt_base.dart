import 'package:dio/dio.dart';
import 'package:yt/util/tokenGenerator.dart';
import 'package:yt/yt.dart';

class Yt {
  static final dio = Dio();

  final DateTime tokenExpiry = DateTime(2010, 0, 0);

  bool useToken = true;

  String? _token;

  TokenGenerator? tokenGenerator;

  String? _apiKey;

  void set token(String token) => _token = token;

  Yt();

  factory Yt.withKey(String apiKey) {
    final yt = Yt();

    yt._apiKey = apiKey;

    yt.useToken = false;

    return yt;
  }

  factory Yt.withOAuth(OAuthCredentials oauthCredentials) {
    Yt yt = Yt();

    yt.tokenGenerator =
        OAuthGenerator(oauthCredentials: oauthCredentials, dio: dio);

    return yt;
  }

  factory Yt.withJwt(String credentialsFile, String scope) {
    Yt yt = Yt();

    yt.tokenGenerator =
        JwtGenerator(credentialsFile: credentialsFile, scope: scope, dio: dio);

    return yt;
  }

  Future<void> init() async {
    if (tokenGenerator == null) throw Exception();

    await _confirmToken();
  }

  Future<void> _confirmToken() async {
    if (tokenExpiry.isBefore(DateTime.now())) {
      final tokenData = await tokenGenerator!.generate();

      _token = tokenData.accessToken;

      tokenExpiry.add(Duration(seconds: tokenData.expiresIn));
    }
  }

  Future<Broadcast> get broadcast async {
    await _confirmToken();

    return Broadcast(_token!, dio);
  }

  Future<Chat> get chat async {
    await _confirmToken();

    return Chat(_token!, dio);
  }

  Future<Playlists> get playlist async {
    if (useToken) await _confirmToken();

    return Playlists(token: _token, apiKey: _apiKey, dio: dio);
  }

  Future<Search> get search async {
    if (useToken) await _confirmToken();

    return Search(token: _token, apiKey: _apiKey, dio: dio);
  }

  Future<LiveStream> get stream async {
    await _confirmToken();

    return LiveStream(_token!, dio);
  }

  Future<SetThumbnail> get thumbnail async {
    await _confirmToken();

    return SetThumbnail(_token!, dio);
  }

  Future<Vision> get vision async {
    await _confirmToken();

    return Vision(_token!, dio);
  }
}
