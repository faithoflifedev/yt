import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:yt/yt.dart';

/// A comment resource contains information about a single YouTube comment.
class YoutubeCommentsCommand extends YtHelperCommand {
  @override
  String get description =>
      'A comment resource contains information about a single YouTube comment.';

  @override
  String get name => 'comments';

  YoutubeCommentsCommand() {
    addSubcommand(YoutubeListCommentsCommand());
  }
}

/// Returns a list of comments that match the API request parameters.
class YoutubeListCommentsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Returns a list of comments that match the API request parameters.';
  @override
  String get name => 'list';

  YoutubeListCommentsCommand() {
    argParser
      ..addOption('part',
          defaultsTo: 'id,snippet',
          help:
              '''The part parameter specifies a comma-separated list of one or more comment resource properties that the API response will include.

The following list contains the part names that you can include in the parameter value:
id, snippet''')
      ..addOption('id',
          valueHelp: 'string',
          help:
              'The id parameter specifies a comma-separated list of comment IDs for the resources that are being retrieved. In a comment resource, the id property specifies the comment\'s ID.')
      ..addOption('parent-id',
          valueHelp: 'string',
          help:
              'The parentId parameter specifies the ID of the comment for which replies should be retrieved.');
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final commentListResponse = await comments.list(
        part: argResults!['part'],
        id: argResults?['id'],
        parentId: argResults?['parent-id'],
      );

      print(commentListResponse);
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
