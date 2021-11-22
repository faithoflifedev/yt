import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:universal_io/io.dart';
import 'package:yt/yt.dart';

part 'videos.g.dart';

///A video resource represents a YouTube video.
@RestApi(baseUrl: 'https://www.googleapis.com/youtube/v3')
abstract class VideoClient {
  factory VideoClient(Dio dio, {String baseUrl}) = _VideoClient;

  ///Returns a list of [VideoItem]s that match the API request parameters.
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

  ///Uploads a [VideoItem] to YouTube and optionally sets the video's metadata.
  @POST('/videos')
  Future<VideoItem> insert(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Body() File video,
    @Query('part') String parts, {
    @Query('notifySubscribers') bool? notifySubscribers,
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
    @Query('onBehalfOfContentOwnerChannel')
        String? onBehalfOfContentOwnerChannel,
  });

  ///Updates a [VideoItem]'s metadata.
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

  ///Add a like or dislike rating to a [VideoItem] or remove a rating from a [VideoItem].
  @POST('/videos/rate')
  Future<void> rate(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Query('id') String id,
    @Query('rating') String rating,
  );

  ///Retrieves the ratings that the authorized user gave to a list of specified videos.
  @GET('/videos/getRating')
  Future<VideoGetRatingResponse> getRating(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Query('id') String id, {
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });

  ///Report a video for containing abusive content.
  @POST('/videos/reportAbuse')
  Future<void> reportAbuse(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Body() ReportAbuse body, {
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });

  ///Deletes a YouTube video.
  @DELETE('/videos')
  Future<void> delete(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Query('id') String id, {
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });
}
