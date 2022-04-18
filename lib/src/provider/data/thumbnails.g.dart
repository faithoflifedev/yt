// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnails.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ThumbnailsClient implements ThumbnailsClient {
  _ThumbnailsClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/upload/youtube/v3/thumbnails';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<dynamic>> location(
      authorization, accept, videoId, uploadType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'videoId': videoId,
      r'uploadType': uploadType
    };
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Accept': accept
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/set',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<ThumbnailSetResponse> upload(
      authorization, contentType, videoId, uploadId, image, uploadType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'videoId': videoId,
      r'upload_id': uploadId,
      r'uploadType': uploadType
    };
    final _headers = <String, dynamic>{
      r'Authorization': authorization,
      r'Content-Type': contentType
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = Stream.fromIterable(image.readAsBytesSync().map((i) => [i]));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ThumbnailSetResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, '/set',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ThumbnailSetResponse.fromJson(_result.data!);
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
