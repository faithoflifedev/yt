import 'package:universal_io/io.dart';
import 'package:yt/yt.dart';

void main() async {
  final yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/upload.yaml'));

  final videos = await yt.videos;

  final body = <String, dynamic>{
    'snippet': {
      'title': 'TEST PLEASE DELETE',
      'description': 'Test',
      'tags': ['tag1', 'tag2'],
      'categoryId': "22"
    },
    'status': {
      'privacyStatus': 'private',
      "embeddable": true,
      "license": "youtube"
    }
  };

  final videoItem = await videos.insert(
      body: body,
      videoFile: File('[the taget video file]'),
      notifySubscribers: false);

  print(videoItem);
}
