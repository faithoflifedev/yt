import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yt/yt.dart';

part 'captions.g.dart';

/// A caption resource represents a YouTube caption track. A caption track is associated with exactly one YouTube video.
@RestApi(baseUrl: 'https://www.googleapis.com/youtube/v3')
abstract class CaptionClient {
  factory CaptionClient(Dio dio, {String baseUrl}) = _CaptionClient;

  /// Retrieves a list of caption tracks associated with a specified video.
  @GET('/captions')
  Future<CaptionListResponse> list(
    @Header('Accept') String accept,
    @Query('part') String parts,
    @Query('videoId') String videoId, {
    @Query('id') String? id,
    @Query('onBehalfOf') String? onBehalfOf,
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });

  /// Downloads a caption track, returning its raw content.
  @GET('/captions/{id}')
  Future<HttpResponse<dynamic>> download(
    @Header('Accept') String accept,
    @Path('id') String id, {
    @Query('tfmt') String? tfmt,
    @Query('tlang') String? tlang,
    @Query('onBehalfOf') String? onBehalfOf,
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });

  /// Updates a caption track. For metadata-only updates (no file replacement).
  @PUT('/captions')
  Future<CaptionItem> update(
    @Header('Accept') String accept,
    @Header('Content-Type') String contentType,
    @Query('part') String parts,
    @Body() Map<String, dynamic> body, {
    @Query('onBehalfOf') String? onBehalfOf,
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });

  /// Deletes a specified caption track.
  @DELETE('/captions')
  Future<void> delete(
    @Header('Accept') String accept,
    @Query('id') String id, {
    @Query('onBehalfOf') String? onBehalfOf,
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });
}

/// Handles multipart uploads for inserting and updating caption track files.
@RestApi(baseUrl: 'https://www.googleapis.com/upload/youtube/v3')
abstract class CaptionUploadClient {
  factory CaptionUploadClient(Dio dio, {String baseUrl}) = _CaptionUploadClient;

  /// Uploads a new caption track.
  @POST('/captions')
  Future<CaptionItem> insert(
    @Header('Accept') String accept,
    @Header('Content-Type') String contentType,
    @Query('part') String parts,
    @Query('uploadType') String uploadType,
    @Body() String body, {
    @Query('onBehalfOf') String? onBehalfOf,
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });

  /// Replaces the file of an existing caption track.
  @PUT('/captions')
  Future<CaptionItem> updateWithFile(
    @Header('Accept') String accept,
    @Header('Content-Type') String contentType,
    @Query('part') String parts,
    @Query('uploadType') String uploadType,
    @Body() String body, {
    @Query('onBehalfOf') String? onBehalfOf,
    @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  });
}
