// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _StreamClient implements StreamClient {
  _StreamClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://youtube.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LiveStreamListResponse> list(authorization, accept, parts,
      {id,
      mine,
      maxResults,
      onBehalfOfContentOwner,
      onBehalfOfContentOwnerChannel,
      pageToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'id': id,
      r'mine': mine,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
      r'pageToken': pageToken
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LiveStreamListResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Authorization': authorization,
                  r'Accept': accept
                },
                extra: _extra)
            .compose(_dio.options, '/liveStreams',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveStreamListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveStreamItem> insert(authorization, accept, contentType, parts, body,
      {onBehalfOfContentOwner, onBehalfOfContentOwnerChannel}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LiveStreamItem>(Options(
                method: 'POST',
                headers: <String, dynamic>{
                  r'Authorization': authorization,
                  r'Accept': accept,
                  r'Content-Type': contentType
                },
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, '/liveStreams',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveStreamItem.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveStreamItem> update(authorization, accept, contentType, parts, body,
      {onBehalfOfContentOwner, onBehalfOfContentOwnerChannel}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LiveStreamItem>(Options(
                method: 'PUT',
                headers: <String, dynamic>{
                  r'Authorization': authorization,
                  r'Accept': accept,
                  r'Content-Type': contentType
                },
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, '/liveStreams',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveStreamItem.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(authorization, accept, id,
      {onBehalfOfContentOwner, onBehalfOfContentOwnerChannel}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel
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
        .compose(_dio.options, '/liveStreams',
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
