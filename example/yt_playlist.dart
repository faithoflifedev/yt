import 'package:yt/yt.dart';

void main() async {
  var yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

  // var yt = Yt.withKey('[youtube api key]');

  var playlists = await yt.playlists;

  // var playlistResponse = await playlists.list(mine: true);

  var playlistResponse =
      await playlists.list(channelId: '[youtube channel id]', maxResults: 25);

  playlistResponse.items.forEach((playlist) => print(
      'title: ${playlist.snippet?.title}, ${playlist.snippet?.thumbnails.thumbnailsDefault.url}'));

  // playlistResponse = await playlists.list(
  //     mine: true, pageToken: playlistResponse.nextPageToken);

  // playlistResponse.items
  //     .forEach((playlist) => print('${playlist.snippet?.title}'));
}
