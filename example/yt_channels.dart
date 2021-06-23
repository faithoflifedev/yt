import 'package:yt/yt.dart';

void main() async {
  var yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

  //var yt = Yt.withKey('[youtube api key]');

  var channels = await yt.channels;

  var channelsResponse =
      await channels.list(id: '[youtube channel id]', part: 'snippet');

  channelsResponse.items.forEach((channels) => print(
      'title: ${channels.snippet?.title}, ${channels.snippet?.thumbnails?.thumbnailsDefault.url}'));
}
