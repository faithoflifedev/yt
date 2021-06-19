import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../yt.dart';

part 'setThumbnail.g.dart';

@RestApi(baseUrl: 'https://www.googleapis.com/upload/youtube/v3/thumbnails')
abstract class SetThumbnailClient {
  factory SetThumbnailClient(Dio dio, {String baseUrl}) = _SetThumbnailClient;

  @POST('/set')
  Future<HttpResponse<dynamic>> thumbnailLocation(
      @Header('Authorization') String authorization,
      @Header('Accept') String accept,
      @Query('videoId') String videoId,
      @Query('uploadType') String uploadType);

  @POST('/set')
  Future<ThumbnailSetResponse> set(
      @Header('Authorization') String authorization,
      @Header('Content-Type') String contentType,
      @Query('videoId') String videoId,
      @Query('upload_id') String uploadId,
      @Body() File image,
      @Query('uploadType') String uploadType);
}
