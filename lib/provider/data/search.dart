import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../yt.dart';

part 'search.g.dart';

@RestApi(baseUrl: 'https://www.googleapis.com/youtube/v3')
abstract class SearchClient {
  factory SearchClient(Dio dio, {String baseUrl}) = _SearchClient;

  @GET('/search')
  Future<SearchListResponse> authList(
      @Header('Authorization') String authorization,
      @Header('Accept') String accept,
      @Query('part') String parts,
      {@Query('channelId') String? channelId,
      @Query('channelType') String? channelType,
      @Query('eventType') String? eventType,
      @Query('forContentOwner') bool? forContentOwner,
      @Query('forDeveloper') bool? forDeveloper,
      @Query('forMine') bool? forMine,
      @Query('location') String? location,
      @Query('locationRadius') String? locationRadius,
      @Query('maxResults') int? maxResults,
      @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
      @Query('order') String? order,
      @Query('pageToken') String? pageToken,
      @Query('publishedAfter') String? publishedAfter,
      @Query('publishedBefore') String? publishedBefore,
      @Query('q') String? q,
      @Query('regionCode') String? regionCode,
      @Query('relevanceLanguage') String? relevanceLanguage,
      @Query('safeSearch') String? safeSearch,
      @Query('topicId') String? topicId,
      @Query('type') String? type,
      @Query('videoCaption') String? videoCaption,
      @Query('videoCategoryId') String? videoCategoryId,
      @Query('videoDefinition') String? videoDefinition,
      @Query('videoDimension') String? videoDimension,
      @Query('videoDuration') String? videoDuration,
      @Query('videoEmbeddable') String? videoEmbeddable,
      @Query('videoLicense') String? videoLicense,
      @Query('videoSyndicated') String? videoSyndicated,
      @Query('videoType') String? videoType});

  @GET('/search')
  Future<SearchListResponse> apiKeyList(@Query('key') String apiKey,
      @Header('Accept') String accept, @Query('part') String parts,
      {@Query('channelId') String? channelId,
      @Query('channelType') String? channelType,
      @Query('eventType') String? eventType,
      @Query('forContentOwner') bool? forContentOwner,
      @Query('forDeveloper') bool? forDeveloper,
      @Query('forMine') bool? forMine,
      @Query('location') String? location,
      @Query('locationRadius') String? locationRadius,
      @Query('maxResults') int? maxResults,
      @Query('onBehalfOfContentOwner') String? onBehalfOfContentOwner,
      @Query('order') String? order,
      @Query('pageToken') String? pageToken,
      @Query('publishedAfter') String? publishedAfter,
      @Query('publishedBefore') String? publishedBefore,
      @Query('q') String? q,
      @Query('regionCode') String? regionCode,
      @Query('relevanceLanguage') String? relevanceLanguage,
      @Query('safeSearch') String? safeSearch,
      @Query('topicId') String? topicId,
      @Query('type') String? type,
      @Query('videoCaption') String? videoCaption,
      @Query('videoCategoryId') String? videoCategoryId,
      @Query('videoDefinition') String? videoDefinition,
      @Query('videoDimension') String? videoDimension,
      @Query('videoDuration') String? videoDuration,
      @Query('videoEmbeddable') String? videoEmbeddable,
      @Query('videoLicense') String? videoLicense,
      @Query('videoSyndicated') String? videoSyndicated,
      @Query('videoType') String? videoType});
}
