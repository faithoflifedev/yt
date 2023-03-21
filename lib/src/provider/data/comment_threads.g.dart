// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_threads.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CommentThreadsClient implements CommentThreadsClient {
  _CommentThreadsClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CommentThreadListResponse> list(
    apiKey,
    accept,
    parts, {
    allThreadsRelatedToChannelId,
    channelId,
    id,
    videoId,
    maxResults,
    moderationStatus,
    order,
    pageToken,
    searchTerms,
    textFormat,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'part': parts,
      r'allThreadsRelatedToChannelId': allThreadsRelatedToChannelId,
      r'channelId': channelId,
      r'id': id,
      r'videoId': videoId,
      r'maxResults': maxResults,
      r'moderationStatus': moderationStatus,
      r'order': order,
      r'pageToken': pageToken,
      r'searchTerms': searchTerms,
      r'textFormat': textFormat,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Accept': accept};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CommentThreadListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/commentThreads',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CommentThreadListResponse.fromJson(_result.data!);
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
