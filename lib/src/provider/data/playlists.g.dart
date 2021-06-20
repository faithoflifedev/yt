// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlists.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PlaylistClient implements PlaylistClient {
  _PlaylistClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PlaylistResponse> authList(authorization, accept, parts,
      {channelId,
      id,
      mine,
      hl,
      maxResults,
      onBehalfOfContentOwner,
      onBehalfOfContentOwnerChannel,
      pageToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'channelId': channelId,
      r'id': id,
      r'mine': mine,
      r'hl': hl,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
      r'pageToken': pageToken
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlaylistResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Authorization': authorization,
                  r'Accept': accept
                },
                extra: _extra)
            .compose(_dio.options, '/playlists',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlaylistResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PlaylistResponse> apiKeyList(apiKey, accept, parts,
      {channelId,
      id,
      mine,
      hl,
      maxResults,
      onBehalfOfContentOwner,
      onBehalfOfContentOwnerChannel,
      pageToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'part': parts,
      r'channelId': channelId,
      r'id': id,
      r'mine': mine,
      r'hl': hl,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
      r'pageToken': pageToken
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlaylistResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Accept': accept},
                extra: _extra)
            .compose(_dio.options, '/playlists',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlaylistResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Playlist> insert(authorization, accept, contentType, part, body,
      {onBehalfOfContentOwner, onBehalfOfContentOwnerChannel}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': part,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Playlist>(Options(
                method: 'POST',
                headers: <String, dynamic>{
                  r'Authorization': authorization,
                  r'Accept': accept,
                  r'Content-Type': contentType
                },
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, '/playlists',
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
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Playlist>(Options(
                method: 'PUT',
                headers: <String, dynamic>{
                  r'Authorization': authorization,
                  r'Accept': accept,
                  r'Content-Type': contentType
                },
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, '/playlists',
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
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'DELETE',
            headers: <String, dynamic>{
              r'Authorization': authorization,
              r'Accept': accept
            },
            extra: _extra)
        .compose(_dio.options, '/playlists',
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
