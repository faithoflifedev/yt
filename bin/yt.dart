import 'package:args/command_runner.dart';
import 'package:universal_io/io.dart';
import 'package:yt/yt.dart';

void main(List<String> arguments) async {
  CommandRunner(
      'yt', 'A command line interface for broadcasting to Youtube through OBS')
    // ..argParser.addOption('yt-config',
    //     valueHelp: 'path',
    //     help:
    //         'The path to a .yaml file with the Youtube authentication configuration.',
    //     defaultsTo: '${Util.userHome}/.yt/credentials.json')
    ..addCommand(YoutubeBroadcastCommand())
    ..addCommand(YoutubeChannelsCommand())
    ..addCommand(YoutubeChatCommand())
    ..addCommand(YoutubeLoginCommand())
    ..addCommand(YoutubePlaylistsCommand())
    ..addCommand(YoutubeSearchCommand())
    ..addCommand(YoutubeStreamCommand())
    ..addCommand(YoutubeThumbnailsCommand())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;

      print(error);

      exit(64); // Exit code 64 indicates a usage error.
    });
}
