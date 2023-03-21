// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _StreamClient implements StreamClient {
  _StreamClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://youtube.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LiveStreamListResponse> list(
    accept,
    parts, {
    id,
    mine,
    maxResults,
    onBehalfOfContentOwner,
    onBehalfOfContentOwnerChannel,
    pageToken,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'id': id,
      r'mine': mine,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
      r'pageToken': pageToken,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Accept': accept};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LiveStreamListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/liveStreams',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveStreamListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveStreamItem> insert(
    accept,
    contentType,
    parts,
    body, {
    onBehalfOfContentOwner,
    onBehalfOfContentOwnerChannel,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': accept,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveStreamItem>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/liveStreams',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveStreamItem.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveStreamItem> update(
    accept,
    contentType,
    parts,
    body, {
    onBehalfOfContentOwner,
    onBehalfOfContentOwnerChannel,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': accept,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveStreamItem>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/liveStreams',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveStreamItem.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(
    accept,
    id, {
    onBehalfOfContentOwner,
    onBehalfOfContentOwnerChannel,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Accept': accept};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/liveStreams',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
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
