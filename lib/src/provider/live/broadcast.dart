import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yt/yt.dart';

part 'broadcast.g.dart';

@RestApi(baseUrl: 'https://youtube.googleapis.com/youtube/v3')
abstract class BroadcastClient {
  factory BroadcastClient(Dio dio, {String baseUrl}) = _BroadcastClient;

  @GET('/liveBroadcasts')
  Future<LiveBroadcastResponse> list(
      @Header('Authorization')
          String authorization,
      @Header('Accept')
          String accept,
      @Query('part')
          String parts,
      {@Query('broadcastStatus')
          String? broadcastStatus,
      @Query('broadcastType')
          String? broadcastType,
      @Query('id')
          String? id,
      @Query('maxResults')
          int? maxResults,
      @Query('mine')
          bool? mine,
      @Query('onBehalfOfContentOwner')
          String? onBehalfOfContentOwner,
      @Query('onBehalfOfContentOwnerChannel')
          String? onBehalfOfContentOwnerChannel,
      @Query('pageToken')
          String? pageToken});

  @POST('/liveBroadcasts')
  Future<LiveBroadcastItem> insert(
      @Header('Authorization')
          String authorization,
      @Header('Accept')
          String accept,
      @Header('Content-Type')
          String contentType,
      @Query('part')
          String part,
      @Body()
          Map<String, dynamic> body,
      {@Query('onBehalfOfContentOwner')
          String? onBehalfOfContentOwner,
      @Query('onBehalfOfContentOwnerChannel')
          String? onBehalfOfContentOwnerChannel});

  @PUT('/liveBroadcasts')
  Future<LiveBroadcastItem> update(
      @Header('Authorization')
          String authorization,
      @Header('Accept')
          String accept,
      @Header('Content-Type')
          String contentType,
      @Query('part')
          String parts,
      @Body()
          Map<String, dynamic> body,
      {@Query('onBehalfOfContentOwner')
          String? onBehalfOfContentOwner,
      @Query('onBehalfOfContentOwnerChannel')
          String? onBehalfOfContentOwnerChannel});

  @POST('/liveBroadcasts/bind')
  Future<LiveBroadcastItem> bind(
      @Header('Authorization')
          String authorization,
      @Header('Accept')
          String accept,
      @Query('id')
          String id,
      @Query('streamId')
          String streamId,
      @Query('part')
          String parts,
      {@Query('onBehalfOfContentOwner')
          String? onBehalfOfContentOwner,
      @Query('onBehalfOfContentOwnerChannel')
          String? onBehalfOfContentOwnerChannel});

  @POST('/liveBroadcasts/transition')
  Future<LiveBroadcastItem> transition(
      @Header('Authorization')
          String authorization,
      @Header('Accept')
          String accept,
      @Query('broadcastStatus')
          String broadcastStatus,
      @Query('id')
          String id,
      @Query('part')
          String parts,
      {@Query('onBehalfOfContentOwner')
          String? onBehalfOfContentOwner,
      @Query('onBehalfOfContentOwnerChannel')
          String? onBehalfOfContentOwnerChannel});

  @DELETE('/liveBroadcasts')
  Future<void> delete(
      @Header('Authorization')
          String authorization,
      @Header('Accept')
          String accept,
      @Query('id')
          String id,
      {@Query('onBehalfOfContentOwner')
          String? onBehalfOfContentOwner,
      @Query('onBehalfOfContentOwnerChannel')
          String? onBehalfOfContentOwnerChannel});
}
