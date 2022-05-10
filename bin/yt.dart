import 'package:args/command_runner.dart';
import 'package:universal_io/io.dart';
import 'package:yt/yt.dart';

void main(List<String> arguments) async {
  CommandRunner('yt', 'A command line interface for connecting to Youtube')
    ..addCommand(YoutubeAuthorizeCommand())
    ..addCommand(YoutubeBroadcastCommand())
    ..addCommand(YoutubeChannelsCommand())
    ..addCommand(YoutubeChatCommand())
    ..addCommand(YoutubePlaylistsCommand())
    ..addCommand(YoutubeSearchCommand())
    ..addCommand(YoutubeStreamCommand())
    ..addCommand(YoutubeThumbnailsCommand())
    ..addCommand(YoutubeVideosCommand())
    ..addCommand(YoutubeVideoCategoriesCommand())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;

      print(error);

      exit(64); // Exit code 64 indicates a usage error.
    });
}
