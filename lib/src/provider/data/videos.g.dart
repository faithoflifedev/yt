// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _VideoClient implements VideoClient {
  _VideoClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<VideoListResponse> list(authorization, accept, parts,
      {chart,
      id,
      myRating,
      hl,
      maxHeight,
      maxResults,
      maxWidth,
      onBehalfOfContentOwner,
      pageToken,
      regionCode,
      videoCategoryId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'chart': chart,
      r'id': id,
      r'myRating': myRating,
      r'hl': hl,
      r'maxHeight': maxHeight,
      r'maxResults': maxResults,
      r'maxWidth': maxWidth,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'pageToken': pageToken,
      r'regionCode': regionCode,
      r'videoCategoryId': videoCategoryId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Accept': accept
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VideoListResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/videos',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VideoListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VideoItem> insert(authorization, accept, video, parts,
      {notifySubscribers,
      onBehalfOfContentOwner,
      onBehalfOfContentOwnerChannel}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'notifySubscribers': notifySubscribers,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Accept': accept
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = Stream.fromIterable(video.readAsBytesSync().map((i) => [i]));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VideoItem>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/videos',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VideoItem.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VideoItem> update(authorization, accept, Stringparts, video,
      {onBehalfOfContentOwner, onBehalfOfContentOwnerChannel}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': Stringparts.toJson(),
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Accept': accept
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = Stream.fromIterable(video.readAsBytesSync().map((i) => [i]));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VideoItem>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, '/videos',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VideoItem.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> rate(authorization, accept, id, rating) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id, r'rating': rating};
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Accept': accept
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/videos/rate',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<VideoGetRatingResponse> getRating(authorization, accept, id,
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
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VideoGetRatingResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/videos/getRating',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VideoGetRatingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> reportAbuse(authorization, accept, body,
      {onBehalfOfContentOwner}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'onBehalfOfContentOwner': onBehalfOfContentOwner
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Accept': accept
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/videos/reportAbuse',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
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
            .compose(_dio.options, '/videos',
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
