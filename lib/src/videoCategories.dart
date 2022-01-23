import 'package:dio/dio.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

import 'provider/data/videoCategories.dart';

///Returns a list of [VideoItem]s that match the API request parameters.
class VideoCategories extends YouTubeHelper {
  final String token;
  final Dio dio;

  final VideoCategoriesClient _rest;

  final String _authHeader;

  VideoCategories(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = VideoCategoriesClient(dio);

  ///Retrieves a list of categories that can be associated with YouTube videos
  ///in the United States. The regionCode parameter specifies the country for
  ///which categories are being retrieved.
  Future<VideoCategoryListResponse> list(
      {String part = 'snippet',
      List<String> partList = const [],
      String? id,
      String? regionCode,
      bool? hl}) async {
    return await _rest.list(_authHeader, accept, buildParts(partList, part),
        id: id, regionCode: regionCode, hl: hl);
  }
}
