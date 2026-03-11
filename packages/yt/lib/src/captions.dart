import 'dart:convert';

import 'package:universal_io/io.dart';
import 'package:yt/src/youtube_api_helper.dart';
import 'package:yt/yt.dart';

import 'provider/data/captions.dart';

/// A caption resource represents a YouTube caption track. A caption track is
/// associated with exactly one YouTube video.
class Captions extends YouTubeApiHelper {
  final CaptionClient _rest;
  final CaptionUploadClient _restUpload;

  Captions({required super.dio})
    : _rest = CaptionClient(dio),
      _restUpload = CaptionUploadClient(dio);

  /// Retrieves a list of caption tracks associated with a specified video.
  Future<CaptionListResponse> list({
    required String videoId,
    String part = 'snippet',
    List<String> partList = const [],
    String? id,
    String? onBehalfOf,
    String? onBehalfOfContentOwner,
  }) async => await _rest.list(
    accept,
    buildParts(partList, part),
    videoId,
    id: id,
    onBehalfOf: onBehalfOf,
    onBehalfOfContentOwner: onBehalfOfContentOwner,
  );

  /// Uploads a caption track for a video.
  ///
  /// The [body] must contain the caption snippet metadata (videoId, language, name).
  /// The [captionFile] is the actual caption track text file to upload.
  /// The [mimeType] defaults to `text/plain` but can be overridden
  /// (e.g. `application/x-subrip` for SRT files).
  Future<CaptionItem> insert({
    required Map<String, dynamic> body,
    required File captionFile,
    String mimeType = 'text/plain',
    String part = 'snippet',
    List<String> partList = const [],
    String? onBehalfOf,
    String? onBehalfOfContentOwner,
  }) async {
    const boundary = 'yt_caption_boundary';
    final jsonPart = jsonEncode(body);
    final filePart = await captionFile.readAsString();

    final multipartBody =
        '--$boundary\r\n'
        'Content-Type: application/json; charset=UTF-8\r\n\r\n'
        '$jsonPart\r\n'
        '--$boundary\r\n'
        'Content-Type: $mimeType\r\n\r\n'
        '$filePart\r\n'
        '--$boundary--';

    return _restUpload.insert(
      accept,
      'multipart/related; boundary=$boundary',
      buildParts(partList, part),
      'multipart',
      multipartBody,
      onBehalfOf: onBehalfOf,
      onBehalfOfContentOwner: onBehalfOfContentOwner,
    );
  }

  /// Updates a caption track.
  ///
  /// Provide [captionFile] to replace the existing caption track content.
  /// If [captionFile] is omitted, only the snippet metadata is updated
  /// (e.g. toggling the [isDraft] status).
  Future<CaptionItem> update({
    required Map<String, dynamic> body,
    File? captionFile,
    String mimeType = 'text/plain',
    String part = 'snippet',
    List<String> partList = const [],
    String? onBehalfOf,
    String? onBehalfOfContentOwner,
  }) async {
    if (captionFile != null) {
      const boundary = 'yt_caption_boundary';
      final jsonPart = jsonEncode(body);
      final filePart = await captionFile.readAsString();

      final multipartBody =
          '--$boundary\r\n'
          'Content-Type: application/json; charset=UTF-8\r\n\r\n'
          '$jsonPart\r\n'
          '--$boundary\r\n'
          'Content-Type: $mimeType\r\n\r\n'
          '$filePart\r\n'
          '--$boundary--';

      return _restUpload.updateWithFile(
        accept,
        'multipart/related; boundary=$boundary',
        buildParts(partList, part),
        'multipart',
        multipartBody,
        onBehalfOf: onBehalfOf,
        onBehalfOfContentOwner: onBehalfOfContentOwner,
      );
    }

    return await _rest.update(
      accept,
      contentType,
      buildParts(partList, part),
      body,
      onBehalfOf: onBehalfOf,
      onBehalfOfContentOwner: onBehalfOfContentOwner,
    );
  }

  /// Downloads a caption track. Returns the raw caption track content as a string.
  ///
  /// The track is returned in its original format unless [tfmt] is specified,
  /// and in its original language unless [tlang] is specified.
  ///
  /// Supported values for [tfmt]: `sbv`, `srt`, `vtt`.
  Future<String> download({
    required String id,
    String? tfmt,
    String? tlang,
    String? onBehalfOf,
    String? onBehalfOfContentOwner,
  }) async {
    final response = await _rest.download(
      '*/*',
      id,
      tfmt: tfmt,
      tlang: tlang,
      onBehalfOf: onBehalfOf,
      onBehalfOfContentOwner: onBehalfOfContentOwner,
    );

    return response.data?.toString() ?? '';
  }

  /// Deletes a specified caption track.
  Future<void> delete({
    required String id,
    String? onBehalfOf,
    String? onBehalfOfContentOwner,
  }) async {
    return _rest.delete(
      accept,
      id,
      onBehalfOf: onBehalfOf,
      onBehalfOfContentOwner: onBehalfOfContentOwner,
    );
  }
}
