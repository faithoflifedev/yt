import 'package:dio/dio.dart';
import 'package:yt/provider/live/broadcast.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

class Broadcast with YouTubeHelper {
  final String token;
  final Dio dio;

  final BroadcastClient _rest;

  final String _authHeader;

  Broadcast(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = BroadcastClient(dio);

  Future<LiveBroadcastResponse> list(
      {String part = 'snippet,status,contentDetails',
      List<String> partList = const [],
      String? broadcastStatus,
      String? broadcastType,
      String? id,
      int? maxResults,
      bool? mine,
      String? onBehalfOfContentOwner,
      String? onBehalfOfContentOwnerChannel,
      String? pageToken}) async {
    return await _rest.list(_authHeader, accept, buildParts(partList, part),
        broadcastStatus: broadcastStatus,
        broadcastType: broadcastType,
        id: id,
        maxResults: maxResults,
        mine: mine,
        onBehalfOfContentOwner: onBehalfOfContentOwner,
        onBehalfOfContentOwnerChannel: onBehalfOfContentOwnerChannel,
        pageToken: pageToken);
  }

  Future<LiveBroadcastItem> insert(
      {required Map<String, dynamic> body,
      String part = 'snippet,status,contentDetails',
      List<String> partList = const [],
      String? onBehalfOfContentOwner,
      String? onBehalfOfContentOwnerChannel}) async {
    return await _rest.insert(
        _authHeader, accept, contentType, buildParts(partList, part), body,
        onBehalfOfContentOwner: onBehalfOfContentOwner,
        onBehalfOfContentOwnerChannel: onBehalfOfContentOwnerChannel);
  }

  Future<LiveBroadcastItem> transition({
    required broadcastStatus,
    required String id,
    String part = 'snippet,status,contentDetails',
    List<String> partList = const [],
    String? onBehalfOfContentOwner,
    String? onBehalfOfContentOwnerChannel,
  }) async {
    return await _rest.transition(
        _authHeader, accept, broadcastStatus, id, buildParts(partList, part));
  }

  Future<LiveBroadcastItem> bind({
    required String broadcastId,
    required String streamId,
    String part = 'snippet,status,contentDetails',
    List<String> partList = const [],
    String? onBehalfOfContentOwner,
    String? onBehalfOfContentOwnerChannel,
  }) async {
    return _rest.bind(
        _authHeader, accept, broadcastId, streamId, buildParts(partList, part));
  }

  Future<void> delete({
    required String id,
    String? onBehalfOfContentOwner,
    String? onBehalfOfContentOwnerChannel,
  }) async {
    await _rest.delete(_authHeader, accept, id);
  }
}
