import 'dart:io';

import 'package:dio/dio.dart';
import 'package:yt/provider/data/setThumbnail.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

class SetThumbnail with YouTubeHelper {
  final String token;
  final Dio dio;

  final SetThumbnailClient _rest;

  final String _authHeader;

  SetThumbnail(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = SetThumbnailClient(dio);

  Future<String> location({required String videoId}) async {
    String uploadType = 'resumable';

    final httpResponse =
        await _rest.thumbnailLocation(_authHeader, accept, videoId, uploadType);

    if (!httpResponse.response.headers.map.containsKey('location')) {
      throw Exception(
          'Upload location for the thumbnail could not be dtermined');
    }

    return httpResponse.response.headers.value('location')!;
  }

  Future<ThumbnailSetResponse> set(
      {required String videoId,
      required String uploadId,
      required File thumbnail}) async {
    String uploadType = 'resumable';

    return await _rest.set(_authHeader, 'application/x-www-form-urlencoded',
        videoId, uploadId, thumbnail, uploadType);
  }
}
