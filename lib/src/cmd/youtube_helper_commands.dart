import 'package:args/command_runner.dart';
import 'package:universal_io/io.dart';
import 'package:yt/yt.dart';

abstract class YtHelperCommand extends Command {
  Yt? _yt;

  Broadcast? _broadcast;

  Chat? _chat;

  LiveStream? _stream;

  Channels? _channels;

  Playlists? _playlists;

  Search? _search;

  Thumbnails? _thumbnails;

  Broadcast get broadcast => _broadcast!;

  Chat get chat => _chat!;

  LiveStream get stream => _stream!;

  Channels get channels => _channels!;

  Playlists get playlists => _playlists!;

  Search get search => _search!;

  Thumbnails get thumbnails => _thumbnails!;

  Future<void> initializeYt() async {
    //yt-config has a default parameter set so will never be null
    final File configFile = File('${Util.userHome}/.yt/credentials.json');

    if (!configFile.existsSync()) {
      throw Exception(
          'File: ${configFile.path} could not be found.  This is a required file.');
    }

    _yt = Yt.withOAuth(OAuthCredentials.fromJsonFile(configFile));

    _broadcast = await _yt?.broadcast;

    _chat = await _yt?.chat;

    _stream = await _yt?.stream;

    _channels = await _yt?.channels;

    _playlists = await _yt?.playlists;

    _search = await _yt?.search;

    _thumbnails = await _yt?.thumbnails;
  }

  // Map<String, dynamic> getBody() {
  //   if (argResults?['template'] == null && argResults?['body'] == null) {
  //     throw Exception('A template file or a json body must be specified');
  //   }

  //   if (argResults?['body'] != null) {
  //     return json.decode(argResults!['body']) as Map<String, dynamic>;
  //   }

  //   final templateFile = File(argResults!['template']);

  //   if (!templateFile.existsSync()) {
  //     throw Exception(
  //         'Template file ${argResults!['template']} colud not be loacted in the file system.');
  //   }

  //   final mustache =
  //       Mustache(map: argResults?['template'] ?? <String, dynamic>{});

  //   return json.decode(mustache.convert(templateFile.readAsStringSync()));
  // }
}
