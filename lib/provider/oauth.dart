import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:yt/src/model/util/token.dart';

part 'oauth.g.dart';

@RestApi(baseUrl: 'https://oauth2.googleapis.com')
abstract class OAuthClient {
  factory OAuthClient(Dio dio, {String baseUrl}) = _OAuthClient;

  @POST('/token')
  Future<Token> getToken(@Body() Map<String, dynamic> params);
}
