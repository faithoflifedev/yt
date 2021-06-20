import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yt/yt.dart';

part 'playlists.g.dart';

@RestApi(baseUrl: 'https://www.googleapis.com/youtube/v3')
abstract class PlaylistClient {
  factory PlaylistClient(Dio dio, {String baseUrl}) = _PlaylistClient;

  @GET('/playlists')
  Future<PlaylistResponse> authList(
      @Header('Authorization')
          String authorization,
      @Header('Accept')
          String accept,
      @Query('part')
          String parts,
      {@Query('channelId')
          String? channelId,
      @Query('id')
          String? id,
      @Query('mine')
          bool? mine,
      @Query('hl')
          int? hl,
      @Query('maxResults')
          int? maxResults,
      @Query('onBehalfOfContentOwner')
          String? onBehalfOfContentOwner,
      @Query('onBehalfOfContentOwnerChannel')
          String? onBehalfOfContentOwnerChannel,
      @Query('pageToken')
          String? pageToken});

  @GET('/playlists')
  Future<PlaylistResponse> apiKeyList(
      @Query('key')
          String apiKey,
      @Header('Accept')
          String accept,
      @Query('part')
          String parts,
      {@Query('channelId')
          String? channelId,
      @Query('id')
          String? id,
      @Query('mine')
          bool? mine,
      @Query('hl')
          int? hl,
      @Query('maxResults')
          int? maxResults,
      @Query('onBehalfOfContentOwner')
          String? onBehalfOfContentOwner,
      @Query('onBehalfOfContentOwnerChannel')
          String? onBehalfOfContentOwnerChannel,
      @Query('pageToken')
          String? pageToken});

  @POST('/playlists')
  Future<Playlist> insert(
      @Header('Authorization')
          String? authorization,
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

  @PUT('/playlists')
  Future<Playlist> update(
      @Header('Authorization') String? authorization,
      @Header('Accept') String accept,
      @Header('Content-Type') String contentType,
      @Query('part') String parts,
      @Body() Map<String, dynamic> body,
      {@Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner});

  @DELETE('/playlists')
  Future<void> delete(@Header('Authorization') String? authorization,
      @Header('Accept') String accept, @Query('id') String id,
      {@Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner});
}
