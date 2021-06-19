import 'package:dio/dio.dart';
import 'package:yt/provider/data/search.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

class Search with YouTubeHelper {
  final String? token;
  final String? apiKey;
  final Dio dio;

  final SearchClient _rest;

  final String? _authHeader;

  Search({required this.dio, this.token, this.apiKey})
      : _authHeader = token != null ? 'Bearer $token' : null,
        _rest = SearchClient(dio);

  Future<SearchListResponse> list(
      {String part = 'snippet,status,contentDetails',
      List<String> partList = const [],
      String? channelId,
      String? channelType,
      String? eventType,
      bool? forContentOwner,
      bool? forDeveloper,
      bool? forMine,
      String? location,
      String? locationRadius,
      int? maxResults,
      String? onBehalfOfContentOwner,
      String? order,
      String? pageToken,
      String? publishedAfter,
      String? publishedBefore,
      String? q,
      String? regionCode,
      String? relevanceLanguage,
      String? safeSearch,
      String? topicId,
      String? type,
      String? videoCaption,
      String? videoCategoryId,
      String? videoDefinition,
      String? videoDimension,
      String? videoDuration,
      String? videoEmbeddable,
      String? videoLicense,
      String? videoSyndicated}) async {
    if (apiKey == null)
      return _rest.authList(_authHeader!, accept, buildParts(partList, part),
          channelId: channelId,
          channelType: channelType,
          eventType: eventType,
          forContentOwner: forContentOwner,
          forDeveloper: forDeveloper,
          forMine: forMine,
          location: location,
          locationRadius: locationRadius,
          maxResults: maxResults,
          onBehalfOfContentOwner: onBehalfOfContentOwner,
          order: order,
          pageToken: pageToken,
          publishedAfter: publishedAfter,
          publishedBefore: publishedBefore,
          q: q,
          regionCode: regionCode,
          relevanceLanguage: relevanceLanguage,
          safeSearch: safeSearch,
          topicId: topicId,
          type: type,
          videoCaption: videoCaption,
          videoCategoryId: videoCategoryId,
          videoDefinition: videoDefinition,
          videoDimension: videoDimension,
          videoDuration: videoDuration,
          videoEmbeddable: videoEmbeddable,
          videoLicense: videoLicense,
          videoSyndicated: videoSyndicated);
    else
      return _rest.apiKeyList(apiKey!, accept, buildParts(partList, part),
          channelId: channelId,
          channelType: channelType,
          eventType: eventType,
          forContentOwner: forContentOwner,
          forDeveloper: forDeveloper,
          forMine: forMine,
          location: location,
          locationRadius: locationRadius,
          maxResults: maxResults,
          onBehalfOfContentOwner: onBehalfOfContentOwner,
          order: order,
          pageToken: pageToken,
          publishedAfter: publishedAfter,
          publishedBefore: publishedBefore,
          q: q,
          regionCode: regionCode,
          relevanceLanguage: relevanceLanguage,
          safeSearch: safeSearch,
          topicId: topicId,
          type: type,
          videoCaption: videoCaption,
          videoCategoryId: videoCategoryId,
          videoDefinition: videoDefinition,
          videoDimension: videoDimension,
          videoDuration: videoDuration,
          videoEmbeddable: videoEmbeddable,
          videoLicense: videoLicense,
          videoSyndicated: videoSyndicated);
  }
}
