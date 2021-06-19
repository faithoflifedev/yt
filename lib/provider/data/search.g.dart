// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SearchClient implements SearchClient {
  _SearchClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SearchListResponse> authList(authorization, accept, parts,
      {channelId,
      channelType,
      eventType,
      forContentOwner,
      forDeveloper,
      forMine,
      location,
      locationRadius,
      maxResults,
      onBehalfOfContentOwner,
      order,
      pageToken,
      publishedAfter,
      publishedBefore,
      q,
      regionCode,
      relevanceLanguage,
      safeSearch,
      topicId,
      type,
      videoCaption,
      videoCategoryId,
      videoDefinition,
      videoDimension,
      videoDuration,
      videoEmbeddable,
      videoLicense,
      videoSyndicated,
      videoType}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'channelId': channelId,
      r'channelType': channelType,
      r'eventType': eventType,
      r'forContentOwner': forContentOwner,
      r'forDeveloper': forDeveloper,
      r'forMine': forMine,
      r'location': location,
      r'locationRadius': locationRadius,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'order': order,
      r'pageToken': pageToken,
      r'publishedAfter': publishedAfter,
      r'publishedBefore': publishedBefore,
      r'q': q,
      r'regionCode': regionCode,
      r'relevanceLanguage': relevanceLanguage,
      r'safeSearch': safeSearch,
      r'topicId': topicId,
      r'type': type,
      r'videoCaption': videoCaption,
      r'videoCategoryId': videoCategoryId,
      r'videoDefinition': videoDefinition,
      r'videoDimension': videoDimension,
      r'videoDuration': videoDuration,
      r'videoEmbeddable': videoEmbeddable,
      r'videoLicense': videoLicense,
      r'videoSyndicated': videoSyndicated,
      r'videoType': videoType
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SearchListResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Authorization': authorization,
                  r'Accept': accept
                },
                extra: _extra)
            .compose(_dio.options, '/search',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SearchListResponse> apiKeyList(apiKey, accept, parts,
      {channelId,
      channelType,
      eventType,
      forContentOwner,
      forDeveloper,
      forMine,
      location,
      locationRadius,
      maxResults,
      onBehalfOfContentOwner,
      order,
      pageToken,
      publishedAfter,
      publishedBefore,
      q,
      regionCode,
      relevanceLanguage,
      safeSearch,
      topicId,
      type,
      videoCaption,
      videoCategoryId,
      videoDefinition,
      videoDimension,
      videoDuration,
      videoEmbeddable,
      videoLicense,
      videoSyndicated,
      videoType}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'part': parts,
      r'channelId': channelId,
      r'channelType': channelType,
      r'eventType': eventType,
      r'forContentOwner': forContentOwner,
      r'forDeveloper': forDeveloper,
      r'forMine': forMine,
      r'location': location,
      r'locationRadius': locationRadius,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'order': order,
      r'pageToken': pageToken,
      r'publishedAfter': publishedAfter,
      r'publishedBefore': publishedBefore,
      r'q': q,
      r'regionCode': regionCode,
      r'relevanceLanguage': relevanceLanguage,
      r'safeSearch': safeSearch,
      r'topicId': topicId,
      r'type': type,
      r'videoCaption': videoCaption,
      r'videoCategoryId': videoCategoryId,
      r'videoDefinition': videoDefinition,
      r'videoDimension': videoDimension,
      r'videoDuration': videoDuration,
      r'videoEmbeddable': videoEmbeddable,
      r'videoLicense': videoLicense,
      r'videoSyndicated': videoSyndicated,
      r'videoType': videoType
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SearchListResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Accept': accept},
                extra: _extra)
            .compose(_dio.options, '/search',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchListResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
