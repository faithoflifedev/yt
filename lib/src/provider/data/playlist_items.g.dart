// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_items.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _PlaylistItemsClient implements PlaylistItemsClient {
  _PlaylistItemsClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PlaylistItemListResponse> authList(authorization, accept, parts,
      {id,
      playlistId,
      maxResults,
      onBehalfOfContentOwner,
      pageToken,
      videoId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'id': id,
      r'playlistId': playlistId,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'pageToken': pageToken,
      r'videoId': videoId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Accept': accept
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlaylistItemListResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/playlistItems',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlaylistItemListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PlaylistItemListResponse> apiKeyList(apiKey, accept, parts,
      {id,
      playlistId,
      maxResults,
      onBehalfOfContentOwner,
      pageToken,
      videoId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'part': parts,
      r'id': id,
      r'playlistId': playlistId,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'pageToken': pageToken,
      r'videoId': videoId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Accept': accept};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlaylistItemListResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/playlistItems',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlaylistItemListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Playlist> insert(authorization, accept, contentType, part, body,
      {onBehalfOfContentOwner}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': part,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Accept': accept,
      r'Content-Type': contentType
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Playlist>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, '/playlistItems',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Playlist.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Playlist> update(authorization, accept, contentType, parts, body,
      {onBehalfOfContentOwner}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Accept': accept,
      r'Content-Type': contentType
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Playlist>(Options(
                method: 'PUT',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, '/playlistItems',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Playlist.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(authorization, accept, id,
      {onBehalfOfContentOwner}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Accept': accept
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/playlistItems',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
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
