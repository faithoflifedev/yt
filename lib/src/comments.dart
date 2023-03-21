import 'package:dio/dio.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

import 'provider/data/comments.dart';

class Comments extends YouTubeHelper {
  final String? token;
  final String? apiKey;
  final Dio dio;

  final CommentsClient _rest;

  Comments({required this.dio, this.token, this.apiKey})
      : _rest = CommentsClient(dio);

  /// Returns a list of comments that match the API request parameters.
  Future<CommentListResponse> list(
      {String part = 'id,snippet',
      List<String> partList = const [],
      String? id,
      String? parentId,
      int? maxResults,
      String? pageToken,
      String? textFormat}) async {
    return _rest.list(
      apiKey,
      accept,
      buildParts(partList, part),
      id: id,
      parentId: parentId,
      maxResults: maxResults,
      pageToken: pageToken,
      textFormat: textFormat,
    );
  }

  // Future<ChannelItem> update(
  //     {String part = 'contentDetails,id,localizations,player,snippet,status',
  //     List<String> partList = const [],
  //     required Map<String, dynamic> body,
  //     String? onBehalfOfContentOwner}) async {
  //   return await _rest.update(
  //       _authHeader, accept, contentType, buildParts(partList, part), body);
  // }
}
