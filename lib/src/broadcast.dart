import 'package:dio/dio.dart';
import 'package:yt/provider/live/broadcast.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

///A liveBroadcast resource represents an event that will be streamed, via live video, on YouTube.
class Broadcast with YouTubeHelper {
  final String token;
  final Dio dio;

  final BroadcastClient _rest;

  final String _authHeader;

  Broadcast(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = BroadcastClient(dio);

  ///Returns a list of YouTube broadcasts that match the API request parameters.
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

  ///Creates a broadcast.
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

  ///Updates a broadcast. For example, you could modify the broadcast settings defined in the [LiveBroadcastItem] resource's [LiveBroadcastItem.contentDetails] object.
  Future<LiveBroadcastItem> update(
      {required Map<String, dynamic> body,
      String part = 'snippet,status,contentDetails',
      List<String> partList = const [],
      String? onBehalfOfContentOwner,
      String? onBehalfOfContentOwnerChannel}) async {
    return await _rest.update(
        _authHeader, accept, contentType, buildParts(partList, part), body,
        onBehalfOfContentOwner: onBehalfOfContentOwner,
        onBehalfOfContentOwnerChannel: onBehalfOfContentOwnerChannel);
  }

  ///Changes the status of a YouTube live broadcast and initiates any processes associated with the new status. For example, when you transition a broadcast's status to testing, YouTube starts to transmit video to that broadcast's monitor stream. Before calling this method, you should confirm that the value of the [LiveBroadcastItem.status] property for the stream bound to your broadcast is active.
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

  ///Binds a YouTube broadcast to a stream or removes an existing binding between a broadcast and a stream. A broadcast can only be bound to one video stream, though a video stream may be bound to more than one broadcast.
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

  ///Deletes a broadcast.
  Future<void> delete({
    required String id,
    String? onBehalfOfContentOwner,
    String? onBehalfOfContentOwnerChannel,
  }) async {
    await _rest.delete(_authHeader, accept, id);
  }
}
