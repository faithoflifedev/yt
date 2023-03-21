import 'package:dio/dio.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

import 'provider/data/comment_threads.dart';

class CommentThreads extends YouTubeHelper {
  final String? token;
  final String? apiKey;
  final Dio dio;

  final CommentThreadsClient _rest;

  CommentThreads({required this.dio, this.token, this.apiKey})
      : _rest = CommentThreadsClient(dio);

  /// Returns a list of comment threads that match the API request parameters.
  Future<CommentThreadListResponse> list(
      {String part = 'id,replies,snippet',
      List<String> partList = const [],
      String? allThreadsRelatedToChannelId,
      String? channelId,
      String? id,
      String? videoId,
      int? maxResults,
      String? moderationStatus,
      String? order,
      String? pageToken,
      String? searchTerms,
      String? textFormat}) async {
    return _rest.list(
      apiKey,
      accept,
      buildParts(partList, part),
      allThreadsRelatedToChannelId: allThreadsRelatedToChannelId,
      channelId: channelId,
      id: id,
      videoId: videoId,
      maxResults: maxResults,
      moderationStatus: moderationStatus,
      order: order,
      pageToken: pageToken,
      searchTerms: searchTerms,
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
