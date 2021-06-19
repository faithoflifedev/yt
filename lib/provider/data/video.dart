import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../yt.dart';

part 'video.g.dart';

@RestApi(baseUrl: 'https://www.googleapis.com/youtube/v3')
abstract class VideoClient {
  factory VideoClient(Dio dio, {String baseUrl}) = _VideoClient;

  @GET('/videos')
  Future<VideoListResponse> list(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Query('part') String parts, {
    @Query('chart') String? chart,
    @Query('id') String? id,
    @Query('myRating') String? myRating,
    @Query('hl') bool? hl,
    @Query('maxHeight') int? maxHeight,
    @Query('maxResults') int? maxResults,
    @Query('maxWidth') int? maxWidth,
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
    @Query('pageToken') String? pageToken,
    @Query('regionCode') String? regionCode,
    @Query('videoCategoryId') String? videoCategoryId,
  });

  @POST('/videos')
  Future<VideoItem> insert(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Body() Map<String, dynamic> body,
    @Query('part') String parts, {
    @Query('notifySubscribers') bool? notifySubscribers,
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
    @Query('onBehalfOfContentOwnerChannel')
        String? onBehalfOfContentOwnerChannel,
  });

  @PUT('/videos')
  Future<VideoItem> update(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Query('part') Stringparts,
    @Body() File video, {
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
    @Query('onBehalfOfContentOwnerChannel')
        String? onBehalfOfContentOwnerChannel,
  });

  @POST('/videos/rate')
  Future<void> rate(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Query('id') String id,
    @Query('rating') String rating,
  );

  @GET('/videos/getRating')
  Future<VideoGetRatingResponse> getRating(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Query('id') String id, {
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });

  @POST('/videos/reportAbuse')
  Future<void> reportAbuse(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Body() Map<String, dynamic> body, {
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });

  @DELETE('/videos')
  Future<void> delete(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Query('id') String id, {
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });
}
