// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BroadcastClient implements BroadcastClient {
  _BroadcastClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://youtube.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LiveBroadcastResponse> list(
    accept,
    parts, {
    broadcastStatus,
    broadcastType,
    id,
    maxResults,
    mine,
    onBehalfOfContentOwner,
    onBehalfOfContentOwnerChannel,
    pageToken,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'broadcastStatus': broadcastStatus,
      r'broadcastType': broadcastType,
      r'id': id,
      r'maxResults': maxResults,
      r'mine': mine,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
      r'pageToken': pageToken,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Accept': accept};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LiveBroadcastResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/liveBroadcasts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveBroadcastResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveBroadcastItem> insert(
    accept,
    contentType,
    part,
    body, {
    onBehalfOfContentOwner,
    onBehalfOfContentOwnerChannel,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': part,
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
        .fetch<Map<String, dynamic>>(_setStreamType<LiveBroadcastItem>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/liveBroadcasts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveBroadcastItem.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveBroadcastItem> update(
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
        .fetch<Map<String, dynamic>>(_setStreamType<LiveBroadcastItem>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/liveBroadcasts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveBroadcastItem.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveBroadcastItem> bind(
    accept,
    id,
    streamId,
    parts, {
    onBehalfOfContentOwner,
    onBehalfOfContentOwnerChannel,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id,
      r'streamId': streamId,
      r'part': parts,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Accept': accept};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveBroadcastItem>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/liveBroadcasts/bind',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveBroadcastItem.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveBroadcastItem> transition(
    accept,
    id,
    parts, {
    broadcastStatus,
    onBehalfOfContentOwner,
    onBehalfOfContentOwnerChannel,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id,
      r'part': parts,
      r'broadcastStatus': broadcastStatus,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Accept': accept};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveBroadcastItem>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/liveBroadcasts/transition',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveBroadcastItem.fromJson(_result.data!);
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
          '/liveBroadcasts',
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
