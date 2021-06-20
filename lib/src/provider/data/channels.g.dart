// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channels.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ChannelClient implements ChannelClient {
  _ChannelClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ChannelResponse> authList(authorization, accept, parts,
      {categoryId,
      forUsername,
      id,
      managedByMe,
      mine,
      hl,
      maxResults,
      onBehalfOfContentOwner,
      pageToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'categoryId': categoryId,
      r'forUsername': forUsername,
      r'id': id,
      r'managedByMe': managedByMe,
      r'mine': mine,
      r'hl': hl,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'pageToken': pageToken
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ChannelResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Authorization': authorization,
                  r'Accept': accept
                },
                extra: _extra)
            .compose(_dio.options, '/channels',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ChannelResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ChannelResponse> apiKeyList(apiKey, accept, parts,
      {categoryId,
      forUsername,
      id,
      managedByMe,
      mine,
      hl,
      maxResults,
      onBehalfOfContentOwner,
      pageToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'part': parts,
      r'categoryId': categoryId,
      r'forUsername': forUsername,
      r'id': id,
      r'managedByMe': managedByMe,
      r'mine': mine,
      r'hl': hl,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'pageToken': pageToken
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ChannelResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Accept': accept},
                extra: _extra)
            .compose(_dio.options, '/search',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ChannelResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ChannelItem> update(authorization, accept, contentType, parts, body,
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
        _setStreamType<ChannelItem>(Options(
                method: 'PUT',
                headers: <String, dynamic>{
                  r'Authorization': authorization,
                  r'Accept': accept,
                  r'Content-Type': contentType
                },
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, '/liveBroadcasts',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ChannelItem.fromJson(_result.data!);
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
