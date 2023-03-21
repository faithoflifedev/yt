// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SubscriptionsClient implements SubscriptionsClient {
  _SubscriptionsClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SubscriptionListResponse> list(
    accept,
    parts, {
    channelId,
    id,
    mine,
    myRecentSubscribers,
    mySubscribers,
    forChannelId,
    maxResults,
    onBehalfOfContentOwner,
    onBehalfOfContentOwnerChannel,
    order,
    pageToken,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'part': parts,
      r'channelId': channelId,
      r'id': id,
      r'mine': mine,
      r'myRecentSubscribers': myRecentSubscribers,
      r'mySubscribers': mySubscribers,
      r'forChannelId': forChannelId,
      r'maxResults': maxResults,
      r'onBehalfOfContentOwner': onBehalfOfContentOwner,
      r'onBehalfOfContentOwnerChannel': onBehalfOfContentOwnerChannel,
      r'order': order,
      r'pageToken': pageToken,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Accept': accept};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SubscriptionListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/subscriptions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SubscriptionListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Subscription> insert(
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
        .fetch<Map<String, dynamic>>(_setStreamType<Subscription>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/subscriptions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Subscription.fromJson(_result.data!);
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
          '/subscriptions',
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
