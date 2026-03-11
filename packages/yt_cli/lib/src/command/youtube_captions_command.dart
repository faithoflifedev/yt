import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:universal_io/io.dart';
import 'package:yt/yt.dart';

import 'youtube_helper_command.dart';

/// A caption resource represents a YouTube caption track. A caption track is
/// associated with exactly one YouTube video.
class YoutubeCaptionsCommand extends YtHelperCommand {
  @override
  String get description =>
      'A caption resource represents a YouTube caption track. A caption track is associated with exactly one YouTube video.';

  @override
  String get name => 'captions';

  YoutubeCaptionsCommand() {
    addSubcommand(YoutubeListCaptionsCommand());
    addSubcommand(YoutubeInsertCaptionsCommand());
    addSubcommand(YoutubeUpdateCaptionsCommand());
    addSubcommand(YoutubeDownloadCaptionsCommand());
    addSubcommand(YoutubeDeleteCaptionsCommand());
  }
}

/// Retrieves a list of caption tracks associated with a specified video.
class YoutubeListCaptionsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Retrieves a list of caption tracks associated with a specified video.';

  @override
  String get name => 'list';

  YoutubeListCaptionsCommand() {
    argParser
      ..addOption(
        'video-id',
        mandatory: true,
        valueHelp: 'videoId',
        help:
            'The videoId parameter specifies the YouTube video ID of the video for which the API should return caption tracks.',
      )
      ..addOption(
        'part',
        defaultsTo: 'snippet',
        help:
            '''The part parameter specifies a comma-separated list of one or more caption resource parts that the API response will include.

The following list contains the part names that you can include in the parameter value:
id, snippet''',
      )
      ..addOption(
        'id',
        valueHelp: 'id',
        help:
            'The id parameter specifies a comma-separated list of IDs that identify the caption resources to retrieve. If you specify an id, the part parameter must include the id part.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final captionListResponse = await captions.list(
        videoId: argResults!['video-id'],
        part: argResults!['part'],
        id: argResults?['id'],
      );

      print(captionListResponse);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Uploads a caption track for a video.
class YoutubeInsertCaptionsCommand extends YtHelperCommand {
  @override
  String get description => 'Uploads a caption track for a video.';

  @override
  String get name => 'insert';

  YoutubeInsertCaptionsCommand() {
    argParser
      ..addOption(
        'part',
        defaultsTo: 'snippet',
        help:
            '''The part parameter specifies a comma-separated list of one or more caption resource parts that the API response will include.

The following list contains the part names that you can include in the parameter value:
id, snippet''',
      )
      ..addOption(
        'body',
        mandatory: true,
        valueHelp: 'json',
        help:
            'Provide a caption resource [https://developers.google.com/youtube/v3/docs/captions#resource] in the request body.',
      )
      ..addOption(
        'caption-file',
        mandatory: true,
        valueHelp: 'path',
        help: 'The path to the caption track file to upload.',
      )
      ..addOption(
        'mime-type',
        defaultsTo: 'text/plain',
        valueHelp: 'mimeType',
        help:
            'The MIME type of the caption track file, e.g. application/x-subrip for SRT files.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final captionItem = await captions.insert(
        body: json.decode(argResults!['body']),
        captionFile: File(argResults!['caption-file']),
        mimeType: argResults!['mime-type'],
        part: argResults!['part'],
      );

      print(captionItem);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Updates a caption track. You can change the track's draft status, upload a
/// new caption file for the track, or both.
class YoutubeUpdateCaptionsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Updates a caption track. You can change the track\'s draft status, upload a new caption file for the track, or both.';

  @override
  String get name => 'update';

  YoutubeUpdateCaptionsCommand() {
    argParser
      ..addOption(
        'part',
        defaultsTo: 'snippet',
        help:
            '''The part parameter serves two purposes. It identifies the properties that the write operation will set as well as the properties that the API response will include.

The following list contains the part names that you can include in the parameter value:
id, snippet''',
      )
      ..addOption(
        'body',
        mandatory: true,
        valueHelp: 'json',
        help:
            'Provide a caption resource [https://developers.google.com/youtube/v3/docs/captions#resource] in the request body.',
      )
      ..addOption(
        'caption-file',
        valueHelp: 'path',
        help:
            'The path to a replacement caption track file. If omitted, only the snippet metadata (e.g. draft status) is updated.',
      )
      ..addOption(
        'mime-type',
        defaultsTo: 'text/plain',
        valueHelp: 'mimeType',
        help: 'The MIME type of the replacement caption track file.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final captionFile = argResults?['caption-file'] != null
          ? File(argResults!['caption-file'])
          : null;

      final captionItem = await captions.update(
        body: json.decode(argResults!['body']),
        captionFile: captionFile,
        mimeType: argResults!['mime-type'],
        part: argResults!['part'],
      );

      print(captionItem);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Downloads a caption track.
class YoutubeDownloadCaptionsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Downloads a caption track. The caption track is returned in its original format unless the tfmt parameter specifies a different format, and in its original language unless the tlang parameter specifies a different language.';

  @override
  String get name => 'download';

  YoutubeDownloadCaptionsCommand() {
    argParser
      ..addOption(
        'id',
        mandatory: true,
        valueHelp: 'id',
        help: 'The id parameter identifies the caption track to download.',
      )
      ..addOption(
        'tfmt',
        valueHelp: 'format',
        allowed: ['sbv', 'srt', 'vtt'],
        help:
            'The tfmt parameter specifies the caption track format. Supported values: sbv, srt, vtt.',
      )
      ..addOption(
        'tlang',
        valueHelp: 'language',
        help:
            'The tlang parameter specifies the language to use for auto-translated captions. The parameter value is a BCP-47 language code.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final content = await captions.download(
        id: argResults!['id'],
        tfmt: argResults?['tfmt'],
        tlang: argResults?['tlang'],
      );

      print(content);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

/// Deletes a specified caption track.
class YoutubeDeleteCaptionsCommand extends YtHelperCommand {
  @override
  String get description => 'Deletes a specified caption track.';

  @override
  String get name => 'delete';

  YoutubeDeleteCaptionsCommand() {
    argParser.addOption(
      'id',
      mandatory: true,
      valueHelp: 'id',
      help: 'The id parameter identifies the caption track to delete.',
    );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      await captions.delete(id: argResults!['id']);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
