import 'package:dio/dio.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

import 'provider/data/channels.dart';

class Channels extends YouTubeHelper {
  final String? token;
  final String? apiKey;
  final Dio dio;

  final ChannelClient _rest;

  final String? _authHeader;

  Channels({required this.dio, this.token, this.apiKey})
      : _authHeader = token != null ? 'Bearer $token' : null,
        _rest = ChannelClient(dio);

  Future<ChannelResponse> list(
      {String part = 'contentDetails,id,localizations,player,snippet,status',
      List<String> partList = const [],
      String? categoryId,
      String? forUsername,
      String? id,
      bool? managedByMe,
      bool? mine,
      String? hl,
      int? maxResults,
      String? onBehalfOfContentOwner,
      String? pageToken}) async {
    if (apiKey == null)
      return _rest.authList('Bearer $token', accept, buildParts(partList, part),
          categoryId: categoryId,
          forUsername: forUsername,
          id: id,
          managedByMe: managedByMe,
          mine: mine,
          hl: hl,
          maxResults: maxResults,
          onBehalfOfContentOwner: onBehalfOfContentOwner,
          pageToken: pageToken);
    else
      return _rest.apiKeyList(apiKey!, accept, buildParts(partList, part),
          categoryId: categoryId,
          forUsername: forUsername,
          id: id,
          managedByMe: managedByMe,
          mine: mine,
          hl: hl,
          maxResults: maxResults,
          onBehalfOfContentOwner: onBehalfOfContentOwner,
          pageToken: pageToken);
  }

  ///Modifies a Channels For example, you could change a Channelss title, description, or privacy status.
  Future<ChannelItem> update(
      {String part = 'contentDetails,id,localizations,player,snippet,status',
      List<String> partList = const [],
      required Map<String, dynamic> body,
      String? onBehalfOfContentOwner}) async {
    return await _rest.update(
        _authHeader, accept, contentType, buildParts(partList, part), body);
  }
}
