import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:yt/yt.dart';

/// A commentThread resource contains information about a YouTube comment thread, which comprises a top-level comment and replies, if any exist, to that comment. A commentThread resource can represent comments about either a video or a channel.
class YoutubeCommentThreadsCommand extends YtHelperCommand {
  @override
  String get description =>
      'A commentThread resource contains information about a YouTube comment thread, which comprises a top-level comment and replies, if any exist, to that comment.';

  @override
  String get name => 'comment-threads';

  YoutubeCommentThreadsCommand() {
    addSubcommand(YoutubeListCommentThreadsCommand());
  }
}

/// Returns a list of comment threads that match the API request parameters.
class YoutubeListCommentThreadsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Returns a list of comment threads that match the API request parameters. ';
  @override
  String get name => 'list';

  YoutubeListCommentThreadsCommand() {
    argParser
      ..addOption('part',
          defaultsTo: 'id,snippet',
          help:
              '''The part parameter specifies a comma-separated list of one or more commentThread resource properties that the API response will include.

The following list contains the part names that you can include in the parameter value:
id, replies, snippet''')
      ..addOption('all-threads-related-to-channel-id',
          valueHelp: 'string',
          help:
              'The allThreadsRelatedToChannelId parameter instructs the API to return all comment threads associated with the specified channel. The response can include comments about the channel or about the channel\'s videos.')
      ..addOption('channel-id',
          valueHelp: 'string',
          help:
              'The channelId parameter instructs the API to return comment threads containing comments about the specified channel. (The response will not include comments left on videos that the channel uploaded.)')
      ..addOption('id',
          valueHelp: 'string',
          help:
              'The id parameter specifies a comma-separated list of comment thread IDs for the resources that should be retrieved.')
      ..addOption('video-id',
          valueHelp: 'string',
          help:
              'The videoId parameter instructs the API to return comment threads associated with the specified video ID.')
      ..addOption('max-results',
          valueHelp: 'number',
          defaultsTo: '5',
          help:
              '''The maxResults parameter specifies the maximum number of items that should be returned in the result set.

Note: This parameter is not supported for use in conjunction with the id parameter. Acceptable values are 1 to 100, inclusive. The default value is 20.''')
      ..addOption('moderation-status',
          valueHelp: 'string',
          allowed: ['heldForReview', 'likelySpam', 'published'],
          help:
              '''This parameter can only be used in a properly authorized request. Set this parameter to limit the returned comment threads to a particular moderation state.

Note: This parameter is not supported for use in conjunction with the id parameter. The default value is published.''')
      ..addOption('order',
          valueHelp: 'string',
          allowed: ['time', 'relevance'],
          help:
              'The order parameter specifies the order in which the API response should list comment threads.')
      ..addOption('page-token',
          valueHelp: 'string',
          help:
              '''The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken property identifies the next page of the result that can be retrieved.

Note: This parameter is not supported for use in conjunction with the id parameter.''')
      ..addOption('search-terms',
          valueHelp: 'string',
          help:
              '''The searchTerms parameter instructs the API to limit the API response to only contain comments that contain the specified search terms.

Note: This parameter is not supported for use in conjunction with the id parameter.''')
      ..addOption('text-format',
          valueHelp: 'string',
          allowed: ['html', 'plainText'],
          help:
              'Set this parameter\'s value to html or plainText to instruct the API to return the comments left by users in html formatted or in plain text. The default value is html.');
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final commentThreadListResponse = await commentThreads.list(
        part: argResults!['part'],
        allThreadsRelatedToChannelId:
            argResults?['all-threads-related-to-channel-id'],
        channelId: argResults?['channel-id'],
        id: argResults?['id'],
        videoId: argResults?['video-id'],
        maxResults: int.parse(argResults!['max-results']),
        moderationStatus: argResults?['moderation-status'],
        order: argResults?['order'],
        pageToken: argResults?['page-token'],
        searchTerms: argResults?['search-terms'],
        textFormat: argResults?['text-format'],
      );

      print(commentThreadListResponse);
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
