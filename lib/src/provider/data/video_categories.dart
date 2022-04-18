import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yt/yt.dart';

part 'video_categories.g.dart';

///A video resource represents a YouTube video.
@RestApi(baseUrl: 'https://www.googleapis.com/youtube/v3')
abstract class VideoCategoriesClient {
  factory VideoCategoriesClient(Dio dio, {String baseUrl}) =
      _VideoCategoriesClient;

  ///Returns a list of [VideoItem]s that match the API request parameters.
  @GET('/youtube/v3/videoCategories')
  Future<VideoCategoryListResponse> list(
    @Header('Authorization') String authorization,
    @Header('Accept') String accept,
    @Query('part') String parts, {
    @Query('id') String? id,
    @Query('regionCode') String? regionCode,
    @Query('hl') bool? hl,
  });
}
