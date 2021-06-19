import 'dart:io';

import 'package:dio/dio.dart';
import 'package:yt/provider/data/video.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

class Videos with YouTubeHelper {
  final String token;
  final Dio dio;

  final VideoClient _rest;

  final String _authHeader;

  Videos(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = VideoClient(dio);

  Future<VideoListResponse> list(
      {String part = 'snippet,status,contentDetails',
      List<String> partList = const [],
      String? chart,
      String? id,
      String? myRating,
      bool? hl,
      int? maxHeight,
      int? maxResults,
      int? maxWidth,
      String? onBehalfOfContentOwner,
      String? pageToken,
      String? regionCode,
      String? videoCategoryId}) async {
    return await _rest.list(_authHeader, accept, buildParts(partList, part));
  }

  Future<VideoItem> insert({
    required Map<String, dynamic> body,
    String part = 'snippet,status,contentDetails',
    List<String> partList = const [],
  }) async {
    return await _rest.insert(
        _authHeader, accept, body, buildParts(partList, part));
  }

  Future<VideoItem> update(
      {required Map<String, dynamic> body,
      String part = 'snippet,status,contentDetails',
      List<String> partList = const [],
      required File videoFile}) async {
    return await _rest.update(
        _authHeader, accept, buildParts(partList, part), videoFile);
  }

  Future<void> rate({required String id, required String rating}) async {
    return await _rest.rate(_authHeader, accept, id, rating);
  }
}
