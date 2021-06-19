import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../yt.dart';

part 'chat.g.dart';

@RestApi(baseUrl: 'https://youtube.googleapis.com/youtube/v3')
abstract class ChatClient {
  factory ChatClient(Dio dio, {String baseUrl}) = _ChatClient;

  @GET('/liveChat/messages')
  Future<LiveChatMessageListResponse> list(
      @Header('Authorization') String authorization,
      @Header('Accept') String accept,
      @Query('part') String parts,
      @Query('liveChatId') String liveChatId,
      {@Query('hl') String? hl,
      @Query('maxResults') int? maxResults,
      @Query('pageToken') String? pageToken,
      @Query('profileImageSize') int? profileImageSize});

  @POST('/liveChat/messages')
  Future<LiveChatMessage> insert(
      @Header('Authorization') String authorization,
      @Header('Accept') String accept,
      @Header('Content-Type') String contentType,
      @Query('part') String part,
      @Body() Map<String, dynamic> data);

  @DELETE('/liveChat/messages')
  Future<void> delete(@Header('Authorization') String authorization,
      @Header('Accept') String accept, @Query('id') String id);
}
