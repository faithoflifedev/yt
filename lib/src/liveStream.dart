import 'package:dio/dio.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

import 'provider/live/stream.dart';

class LiveStream with YouTubeHelper {
  final String token;
  final Dio dio;

  final StreamClient _rest;

  final String _authHeader;

  LiveStream(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = StreamClient(dio);

  Future<LiveStreamListResponse> list(
      {String part = 'snippet,status,contentDetails',
      List<String> partList = const [],
      String? id,
      bool? mine,
      int? maxResults,
      String? onBehalfOfContentOwner,
      String? onBehalfOfContentOwnerChannel,
      String? pageToken}) async {
    return _rest.list(_authHeader, accept, buildParts(partList, part),
        id: id,
        mine: mine,
        maxResults: maxResults,
        onBehalfOfContentOwner: onBehalfOfContentOwner,
        onBehalfOfContentOwnerChannel: onBehalfOfContentOwnerChannel,
        pageToken: pageToken);
  }

  Future<LiveStreamItem> insert({
    String part = 'snippet,status,contentDetails',
    List<String> partList = const [],
    required Map<String, dynamic> body,
    String? onBehalfOfContentOwner,
    String? onBehalfOfContentOwnerChannel,
  }) async {
    return await _rest.insert(
        _authHeader, accept, contentType, buildParts(partList, part), body);
  }

  Future<LiveStreamItem> update({
    String part = 'snippet,status,contentDetails',
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
