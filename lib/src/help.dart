abstract class YouTubeHelper {
  final accept = 'application/json';

  final contentType = 'application/json';

  String buildParts(List<String> partList, String part) {
    if (partList.isEmpty && part == '') {
      throw Exception(
          'I need either of the partList or part field to have an entry');
    }

    final List<String> tmpList = [];

    tmpList.addAll(partList);

    tmpList.addAll(part.trim().split(','));

    return tmpList.toSet().toList().join(',');
  }

  // Future<T> checkResponse<T>(Function run) async {
  //   late final Future<T> result;

  //   try {
  //     result = await run();
  //   } on DioError catch (error) {
  //     throw Exception(
  //         '${error.response?.statusCode} - ${error.response?.data['error']['errors'].first['message']}');
  //   }

  //   return result;
  // }
}
