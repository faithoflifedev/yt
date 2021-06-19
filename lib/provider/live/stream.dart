import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../yt.dart';

part 'stream.g.dart';

@RestApi(baseUrl: 'https://youtube.googleapis.com/youtube/v3')
abstract class StreamClient {
  factory StreamClient(Dio dio, {String baseUrl}) = _StreamClient;

  @GET('/liveStreams')
  Future<LiveStreamListResponse> list(
      @Header('Authorization')
          String authorization,
      @Header('Accept')
          String accept,
      @Query('part')
          String parts,
      {@Query('id')
          String? id,
      @Query('mine')
          bool? mine,
      @Query('maxResults')
          int? maxResults,
      @Query('onBehalfOfContentOwner')
          String? onBehalfOfContentOwner,
      @Query('onBehalfOfContentOwnerChannel')
          String? onBehalfOfContentOwnerChannel,
      @Query('pageToken')
          String? pageToken});

  @POST('/liveStreams')
  Future<LiveStreamItem> insert(
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

  @PUT('/liveStreams')
  Future<LiveStreamItem> update(
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

  @DELETE('/liveStreams')
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
