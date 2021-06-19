import 'package:dio/dio.dart';
import 'package:yt/provider/live/chat.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

class Chat with YouTubeHelper {
  final String token;
  final Dio dio;

  final ChatClient _rest;

  final String _authHeader;

  Chat(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = ChatClient(dio);

  Future<LiveChatMessageListResponse> list(
      {required String liveChatId,
      String? hl,
      int? maxResults,
      String? pageToken,
      int? profileImageSize}) async {
    final String part = 'snippet,authorDetails';

    return await _rest.list(_authHeader, accept, part, liveChatId,
        hl: hl,
        maxResults: maxResults,
        pageToken: pageToken,
        profileImageSize: profileImageSize);
  }

  Future<LiveChatMessage> insert({
    required Map<String, dynamic> body,
  }) async {
    String part = 'snippet';

    if (body['snippet']['textMessageDetails']['messageText'] == '')
      throw Exception();

    return await _rest.insert(_authHeader, accept, contentType, part, body);
  }

  Future<void> delete({required String id}) async {
    return _rest.delete(_authHeader, accept, id);
  }
}
