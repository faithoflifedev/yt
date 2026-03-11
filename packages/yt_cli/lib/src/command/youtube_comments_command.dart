import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:yt/yt.dart';

import 'youtube_helper_command.dart';

/// A comment resource contains information about a single YouTube comment.
class YoutubeCommentsCommand extends YtHelperCommand {
  @override
  String get description =>
      'A comment resource contains information about a single YouTube comment.';

  @override
  String get name => 'comments';

  YoutubeCommentsCommand() {
    addSubcommand(YoutubeListCommentsCommand());
    addSubcommand(YoutubeListByIdsCommentsCommand());
    addSubcommand(YoutubeListByIdCommentsCommand());
    addSubcommand(YoutubeListByParentIdCommentsCommand());
    addSubcommand(YoutubeInsertCommentsCommand());
    addSubcommand(YoutubeAddCommentsCommand());
    addSubcommand(YoutubeUpdateCommentsCommand());
    addSubcommand(YoutubeChangeCommentsCommand());
    addSubcommand(YoutubeSetModerationStatusCommentsCommand());
    addSubcommand(YoutubeDeleteCommentsCommand());
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
      ..addOption(
        'part',
        defaultsTo: 'id,snippet',
        help:
            '''The part parameter specifies a comma-separated list of one or more comment resource properties that the API response will include.

The following list contains the part names that you can include in the parameter value:
id, snippet''',
      )
      ..addOption(
        'id',
        abbr: 'i',
        aliases: ['ID', 'Id'],
        valueHelp: 'string',
        help:
            'The id parameter specifies a comma-separated list of comment IDs for the resources that are being retrieved. In a comment resource, the id property specifies the comment\'s ID.',
      )
      ..addOption(
        'parent-id',
        valueHelp: 'string',
        help:
            'The parentId parameter specifies the ID of the comment for which replies should be retrieved.',
      );
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

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

class YoutubeListByIdsCommentsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Returns a list of comments that match the API request parameters.';
  @override
  String get name => 'listByIds';

  YoutubeListByIdsCommentsCommand() {
    argParser
      ..addOption(
        'ids',
        abbr: 'i',
        aliases: ['ID', 'Id', 'IDS', 'Ids'],
        valueHelp: 'string (comma-separated)',
        help:
            'The id parameter specifies a comma-separated list of comment IDs for the resources that are being retrieved. In a comment resource, the id property specifies the comment\'s ID.',
      )
      ..addOption(
        'max-results',
        valueHelp: 'number',
        defaultsTo: '5',
        help:
            '''The maxResults parameter specifies the maximum number of items that should be returned in the result set.

Note: This parameter is not supported for use in conjunction with the id parameter. Acceptable values are 1 to 100, inclusive. The default value is 20.''',
      )
      ..addOption(
        'page-token',
        valueHelp: 'string',
        help:
            '''The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken property identifies the next page of the result that can be retrieved.

Note: This parameter is not supported for use in conjunction with the id parameter.''',
      )
      ..addOption(
        'text-format',
        valueHelp: 'string',
        allowed: ['html', 'plainText'],
        help:
            'Set this parameter\'s value to html or plainText to instruct the API to return the comments left by users in html formatted or in plain text. The default value is html.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final commentListResponse = await comments.listByIds(
        ids: argResults!['ids'],
        maxResults: argResults?['max-results'],
        pageToken: argResults?['page-token'],
        textFormat: argResults?['text-format'],
      );

      print(commentListResponse);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

class YoutubeListByIdCommentsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Returns a list of comments that match the API request parameters.';
  @override
  String get name => 'listById';

  YoutubeListByIdCommentsCommand() {
    argParser
      ..addOption(
        'id',
        abbr: 'i',
        aliases: ['ID', 'Id'],
        valueHelp: 'string',
        mandatory: true,
        help:
            'The id parameter specifies an ID for the resource that is to be retrieved. In a comment resource, the id property specifies the comment\'s ID.',
      )
      ..addOption(
        'max-results',
        valueHelp: 'number',
        defaultsTo: '5',
        help:
            '''The maxResults parameter specifies the maximum number of items that should be returned in the result set.

Note: This parameter is not supported for use in conjunction with the id parameter. Acceptable values are 1 to 100, inclusive. The default value is 20.''',
      )
      ..addOption(
        'page-token',
        valueHelp: 'string',
        help:
            '''The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken property identifies the next page of the result that can be retrieved.

Note: This parameter is not supported for use in conjunction with the id parameter.''',
      )
      ..addOption(
        'text-format',
        valueHelp: 'string',
        allowed: ['html', 'plainText'],
        help:
            'Set this parameter\'s value to html or plainText to instruct the API to return the comments left by users in html formatted or in plain text. The default value is html.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final commentListResponse = await comments.listById(
        id: argResults!['id'],
        textFormat: argResults?['text-format'],
      );

      print(commentListResponse.items.first);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

class YoutubeListByParentIdCommentsCommand extends YtHelperCommand {
  @override
  String get description => 'Returns a list of replies to an existing comment.';
  @override
  String get name => 'listByParentId';

  YoutubeListByParentIdCommentsCommand() {
    argParser
      ..addOption(
        'parent-id',
        mandatory: true,
        valueHelp: 'string',
        help:
            'The parentId parameter specifies the ID of the comment for which replies should be retrieved.\n\nNote: YouTube currently supports replies only for top-level comments.',
      )
      ..addOption(
        'max-results',
        valueHelp: 'number',
        defaultsTo: '20',
        help:
            'The maxResults parameter specifies the maximum number of items that should be returned. Acceptable values are 1 to 100, inclusive. The default value is 20.',
      )
      ..addOption(
        'page-token',
        valueHelp: 'string',
        help:
            'The pageToken parameter identifies a specific page in the result set that should be returned.',
      )
      ..addOption(
        'text-format',
        valueHelp: 'string',
        allowed: ['html', 'plainText'],
        help:
            "Set this parameter's value to html or plainText to instruct the API to return the comments in HTML or plain text format. The default value is html.",
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final commentListResponse = await comments.listByParentId(
        parentId: argResults!['parent-id'],
        maxResults: int.tryParse(argResults?['max-results'] ?? ''),
        pageToken: argResults?['page-token'],
        textFormat: argResults?['text-format'],
      );

      print(commentListResponse);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

class YoutubeInsertCommentsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Creates a reply to an existing comment. Note: To create a top-level comment, use the commentThreads insert method.';
  @override
  String get name => 'insert';

  YoutubeInsertCommentsCommand() {
    argParser
      ..addOption(
        'part',
        defaultsTo: 'snippet',
        help:
            'The part parameter identifies the properties that the API response will include. Set the parameter value to snippet. The snippet part has a quota cost of 2 units.',
      )
      ..addOption(
        'body',
        mandatory: true,
        valueHelp: 'json',
        help:
            'Provide a comment resource https://developers.google.com/youtube/v3/docs/comments#resource in the request body.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final comment = await comments.insert(
        part: argResults!['part'],
        body: json.decode(argResults!['body']),
      );

      print(comment);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

class YoutubeAddCommentsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Helper that creates a reply to an existing comment using parentId and text.';
  @override
  String get name => 'add';

  YoutubeAddCommentsCommand() {
    argParser
      ..addOption(
        'parent-id',
        mandatory: true,
        valueHelp: 'string',
        help: 'The unique ID of the parent comment this reply is for.',
      )
      ..addOption(
        'text-original',
        mandatory: true,
        valueHelp: 'string',
        help: 'The original, raw text of the comment.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final comment = await comments.add(
        parentId: argResults!['parent-id'],
        textOriginal: argResults!['text-original'],
      );

      print(comment);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

class YoutubeUpdateCommentsCommand extends YtHelperCommand {
  @override
  String get description => 'Modifies a comment.';
  @override
  String get name => 'update';

  YoutubeUpdateCommentsCommand() {
    argParser
      ..addOption(
        'part',
        defaultsTo: 'id,snippet',
        help:
            'The part parameter identifies the properties that the API response will include. You must at least include the snippet part, since that part contains all of the properties that the API request can update.',
      )
      ..addOption(
        'body',
        mandatory: true,
        valueHelp: 'json',
        help:
            'Provide a comment resource https://developers.google.com/youtube/v3/docs/comments#resource in the request body.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final comment = await comments.update(
        part: argResults!['part'],
        body: json.decode(argResults!['body']),
      );

      print(comment);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

class YoutubeChangeCommentsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Helper that modifies a comment text by comment ID.';
  @override
  String get name => 'change';

  YoutubeChangeCommentsCommand() {
    argParser
      ..addOption(
        'comment-id',
        mandatory: true,
        valueHelp: 'string',
        help: 'The ID of the comment to modify.',
      )
      ..addOption(
        'text-original',
        mandatory: true,
        valueHelp: 'string',
        help: 'The new raw text for the comment.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      final comment = await comments.change(
        commentId: argResults!['comment-id'],
        textOriginal: argResults!['text-original'],
      );

      print(comment);

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

class YoutubeSetModerationStatusCommentsCommand extends YtHelperCommand {
  @override
  String get description =>
      'Sets the moderation status of one or more comments. The API request must be authorized by the owner of the channel or video associated with the comments.';
  @override
  String get name => 'set-moderation-status';

  YoutubeSetModerationStatusCommentsCommand() {
    argParser
      ..addOption(
        'id',
        mandatory: true,
        valueHelp: 'string',
        help:
            'The id parameter specifies a comma-separated list of IDs that identify the comments for which you are updating the moderation status.',
      )
      ..addOption(
        'moderation-status',
        mandatory: true,
        valueHelp: 'string',
        allowed: ['heldForReview', 'published', 'rejected'],
        help:
            'Identifies the new moderation status of the specified comments. Valid values: heldForReview, published, rejected.',
      )
      ..addFlag(
        'ban-author',
        defaultsTo: false,
        help:
            'The banAuthor parameter indicates whether to automatically reject any additional comments by the comment author. Only valid when moderation-status is rejected.',
      );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      await comments.setModerationStatus(
        id: argResults!['id'],
        moderationStatus: ModerationStatus.values.byName(
          argResults!['moderation-status'],
        ),
        banAuthor: argResults?['ban-author'],
      );

      print('Moderation status updated.');

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}

class YoutubeDeleteCommentsCommand extends YtHelperCommand {
  @override
  String get description => 'Deletes a comment.';
  @override
  String get name => 'delete';

  YoutubeDeleteCommentsCommand() {
    argParser.addOption(
      'id',
      mandatory: true,
      valueHelp: 'string',
      help:
          'The id parameter specifies the comment ID for the comment that is being deleted.',
    );
  }

  @override
  void run() async {
    await initializeYt();

    try {
      await comments.delete(id: argResults!['id']);

      print('Comment deleted.');

      close();
    } on DioException catch (err) {
      throw UsageException('API usage error:', err.usage);
    }
  }
}
