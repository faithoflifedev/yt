import 'package:dio/dio.dart';
import 'package:yt/src/help.dart';
import 'package:yt/yt.dart';

import 'provider/data/video_categories.dart';

///Returns a list of [VideoItem]s that match the API request parameters.
class VideoCategories extends YouTubeHelper {
  final Dio dio;

  final VideoCategoriesClient _rest;

  ///A videoCategory resource identifies a category that has been or could be
  ///associated with uploaded videos.
  VideoCategories(this.dio) : _rest = VideoCategoriesClient(dio);

  ///Retrieves a list of categories that can be associated with YouTube videos
  ///in the United States. The regionCode parameter specifies the country for
  ///which categories are being retrieved.
  Future<VideoCategoryListResponse> list(
      {String part = 'snippet',
      List<String> partList = const [],
      String? id,
      String? regionCode,
      String? hl}) async {
    return await _rest.list(
      accept,
      buildParts(partList, part),
      id: id,
      regionCode: regionCode,
      hl: hl,
    );
  }
}
