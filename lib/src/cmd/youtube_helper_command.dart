import 'package:args/command_runner.dart';
import 'package:universal_io/io.dart';
import 'package:yt/yt.dart';

abstract class YtHelperCommand extends Command {
  Yt? _yt;

  Broadcast get broadcast => _yt!.broadcast;

  Chat get chat => _yt!.chat;

  LiveStream get liveStream => _yt!.liveStream;

  Channels get channels => _yt!.channels;

  Playlists get playlists => _yt!.playlists;

  Search get search => _yt!.search;

  Thumbnails get thumbnails => _yt!.thumbnails;

  Videos get videos => _yt!.videos;

  VideoCategories get videoCategories => _yt!.videoCategories;

  Future<void> initializeYt() async {
    final File configFile = File('${Util.userHome}/.yt/credentials.json');

    if (!configFile.existsSync()) {
      throw Exception(
          'File: ${configFile.path} could not be found.  This is a required file.');
    }

    _yt = await Yt.withOAuth(OAuthCredentials.fromJsonFile(configFile));
  }
}
