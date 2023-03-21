// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_items.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PlaylistItemsClient implements PlaylistItemsClient {
  _PlaylistItemsClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PlaylistItemListResponse> list(
    apiKey,
    accept,
    parts, {
    id,
    playlistId,
    maxResults,
    onBehalfOfContentOwner,
    pageToken,
    videoId,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'part': parts,
      r'id': id,
      r'playlistId': playlistId,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'pageToken': pageToken,
      r'videoId': videoId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Accept': accept};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlaylistItemListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/playlistItems',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlaylistItemListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Playlist> insert(
    accept,
    contentType,
    part,
    body, {
    onBehalfOfContentOwner,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': part,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': accept,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Playlist>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/playlistItems',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Playlist.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Playlist> update(
    accept,
    contentType,
    parts,
    body, {
    onBehalfOfContentOwner,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': accept,
      r'Content-Type': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Playlist>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/playlistItems',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Playlist.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(
    accept,
    id, {
    onBehalfOfContentOwner,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
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
          '/playlistItems',
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
