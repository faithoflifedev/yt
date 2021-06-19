import 'package:dio/dio.dart';
import 'package:yt/provider/data/playlist.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

class Playlists with YouTubeHelper {
  final String? token;
  final String? apiKey;
  final Dio dio;

  final PlaylistClient _rest;

  final String? _authHeader;

  Playlists({required this.dio, this.token, this.apiKey})
      : _authHeader = token != null ? 'Bearer $token' : null,
        _rest = PlaylistClient(dio);

  Future<PlaylistResponse> list(
      {String part = 'contentDetails,id,localizations,player,snippet,status',
      List<String> partList = const [],
      String? channelId,
      String? id,
      bool? mine,
      int? maxResults,
      String? onBehalfOfContentOwner,
      String? onBehalfOfContentOwnerChannel,
      String? pageToken}) async {
    if (apiKey == null)
      return _rest.authList('Bearer $token', accept, buildParts(partList, part),
          channelId: channelId,
          id: id,
          mine: mine,
          maxResults: maxResults,
          onBehalfOfContentOwner: onBehalfOfContentOwner,
          onBehalfOfContentOwnerChannel: onBehalfOfContentOwnerChannel,
          pageToken: pageToken);
    else
      return _rest.apiKeyList(apiKey!, accept, buildParts(partList, part),
          channelId: channelId,
          id: id,
          mine: mine,
          maxResults: maxResults,
          onBehalfOfContentOwner: onBehalfOfContentOwner,
          onBehalfOfContentOwnerChannel: onBehalfOfContentOwnerChannel,
          pageToken: pageToken);
  }

  Future<Playlist> insert({
    String part = 'contentDetails,id,localizations,player,snippet,status',
    List<String> partList = const [],
    required Map<String, dynamic> body,
    String? onBehalfOfContentOwner,
    String? onBehalfOfContentOwnerChannel,
  }) async {
    return await _rest.insert(
        _authHeader, accept, contentType, buildParts(partList, part), body);
  }

  Future<Playlist> update({
    String part = 'contentDetails,id,localizations,player,snippet,status',
    List<String> partList = const [],
    required Map<String, dynamic> body,
    String? onBehalfOfContentOwner,
    String? onBehalfOfContentOwnerChannel,
  }) async {
    return await _rest.update(
        _authHeader, accept, contentType, buildParts(partList, part), body);
  }

  Future<void> delete({
    required String id,
    String? onBehalfOfContentOwner,
    String? onBehalfOfContentOwnerChannel,
  }) async {
    return await _rest.delete(_authHeader, accept, id);
  }
}
