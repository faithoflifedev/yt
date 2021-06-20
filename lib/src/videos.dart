import 'package:dio/dio.dart';
import 'package:universal_io/io.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

import 'provider/data/videos.dart';

///Returns a list of [VideoItem]s that match the API request parameters.
class Videos with YouTubeHelper {
  final String token;
  final Dio dio;

  final VideoClient _rest;

  final String _authHeader;

  Videos(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = VideoClient(dio);

  ///Uploads a [VideoItem] to YouTube and optionally sets the video's metadata.
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

  ///Uploads a video to YouTube and optionally sets the video's metadata.
  Future<VideoItem> insert({
    required Map<String, dynamic> body,
    String part = 'snippet,status,contentDetails',
    List<String> partList = const [],
  }) async {
    return await _rest.insert(
        _authHeader, accept, body, buildParts(partList, part));
  }

  ///Updates a [VideoItem]'s metadata.
  Future<VideoItem> update(
      {required Map<String, dynamic> body,
      String part = 'snippet,status,contentDetails',
      List<String> partList = const [],
      required File videoFile}) async {
    return await _rest.update(
        _authHeader, accept, buildParts(partList, part), videoFile);
  }

  ///Add a like or dislike rating to a [VideoItem] or remove a rating from a [VideoItem].
  Future<void> rate({required String id, required String rating}) async {
    return await _rest.rate(_authHeader, accept, id, rating);
  }

  ///Retrieves the ratings that the authorized user gave to a list of specified videos.
  Future<void> getRating() {
    //TODO:
    throw UnimplementedError();
  }

  ///Report a video for containing abusive content.
  Future<void> reportAbuse() {
    //TODO:
    throw UnimplementedError();
  }

  ///Deletes a YouTube video.
  Future<void> delete() {
    //TODO:
    throw UnimplementedError();
  }
}
