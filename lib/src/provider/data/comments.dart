import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yt/yt.dart';

part 'comments.g.dart';

/// A comment resource contains information about a single YouTube comment. A comment resource can represent a comment about either a video or a channel. In addition, the comment could be a top-level comment or a reply to a top-level comment.
@RestApi(baseUrl: 'https://www.googleapis.com/youtube/v3')
abstract class CommentsClient {
  factory CommentsClient(Dio dio, {String baseUrl}) = _CommentsClient;

  /// Returns a list of comments that match the API request parameters.
  @GET('/comments')
  Future<CommentListResponse> list(
    @Query('key') String? apiKey,
    @Header('Accept') String accept,
    @Query('part') String parts, {
    @Query('id') String? id,
    @Query('parentId') String? parentId,
    @Query('maxResults') int? maxResults,
    @Query('pageToken') String? pageToken,
    @Query('textFormat') String? textFormat,
  });

  // @PUT('/channels')
  // Future<ChannelItem> update(
  //
  //   @Header('Accept') String accept,
  //   @Header('Content-Type') String contentType,
  //   @Query('part') String parts,
  //   @Body() Map<String, dynamic> body, {
  //   @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
  // });
}
