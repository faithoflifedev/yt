// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CommentsClient implements CommentsClient {
  _CommentsClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CommentListResponse> list(
    apiKey,
    accept,
    parts, {
    id,
    parentId,
    maxResults,
    pageToken,
    textFormat,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'part': parts,
      r'id': id,
      r'parentId': parentId,
      r'maxResults': maxResults,
      r'pageToken': pageToken,
      r'textFormat': textFormat,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Accept': accept};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CommentListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/comments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CommentListResponse.fromJson(_result.data!);
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
