import 'package:dio/dio.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

import 'provider/live/chat.dart';

///A liveChatMessage resource represents a chat message in a YouTube live chat. The resource can contain details about several types of messages, including a newly posted text message or fan funding event.
///
///The live chat feature is enabled by default for live broadcasts and is available while the live event is active. (After the event ends, live chat is no longer available for that event.)
class Chat with YouTubeHelper {
  final String token;
  final Dio dio;

  final ChatClient _rest;

  final String _authHeader;

  Chat(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = ChatClient(dio);

  ///Lists live chat messages for a specific chat.
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

  ///Adds a message to a live chat.
  Future<LiveChatMessage> insert({
    required Map<String, dynamic> body,
  }) async {
    String part = 'snippet';

    if (body['snippet']['textMessageDetails']['messageText'] == '')
      throw Exception();

    return await _rest.insert(_authHeader, accept, contentType, part, body);
  }

  ///Deletes a chat message. The API request must be authorized by the channel owner or a moderator of the live chat.
  Future<void> delete({required String id}) async {
    return _rest.delete(_authHeader, accept, id);
  }
}
