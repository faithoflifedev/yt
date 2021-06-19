# Youtube API

Native dart interface to multiple YouTube REST APIs, including:

- [YouTube Data API](https://developers.google.com/youtube/v3/docs)
- [YouTube Live Streaming API](https://developers.google.com/youtube/v3/live/docs)
- [YouTube Cloud Vision API](https://cloud.google.com/vision/docs/reference/rest)

## API's supported

### Data API:

- [Playlists](https://developers.google.com/youtube/v3/docs/playlists)
- [Search](https://developers.google.com/youtube/v3/docs/search)
- [Thumbnails](https://developers.google.com/youtube/v3/docs/thumbnails)
- [Videos](https://developers.google.com/youtube/v3/docs/videos)

### Live Streaming API:

- [LiveBroadcasts](https://developers.google.com/youtube/v3/live/docs/liveBroadcasts)
- [LiveChatMessages](https://developers.google.com/youtube/v3/live/docs/liveChatMessages)
- [LiveStreams](https://developers.google.com/youtube/v3/live/docs/liveStreams)

### Cloud Vision API:

- [v1/images](https://cloud.google.com/vision/docs/reference/rest/v1/images)

## Getting Started

To use this package, add the dependency to your pubspec.yaml file:

```yaml
dependencies:
  ...
  yt: ^{{ version }}
```

## Usage of the Data API

Youtube provides multiple methods for API authentication. The Data API can use both API key and OAuth for authentication the example below shows how both of these

```dart
import 'package:yt/yt.dart';

//authenticate using OAuth
final yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

//alternatively, some APIs can use an API Key for authentication
//final yt = Yt.withKey('[youtube api key]');

///get an instance of the playlists API client
final playlists = await yt.playlist;

// List of videos from playlist
final playlistResponse = await playlists.list(
      channelId: '[youtube channel id]', maxResults: 25);

playlistResponse.items
    .forEach((playlist) => print('${playlist.snippet?.title}'));

// List the next page of videos
playlistResponse = await playlists.list(
    mine: true, pageToken: playlistResponse.nextPageToken);

playlistResponse.items
    .forEach((playlist) => print('${playlist.snippet?.title}'));
```

## Usage of the Live Streaming API

```dart
import 'package:yt/yt.dart';

final yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

///the live streaming broadcast API client
final br = await yt.broadcast;

///the thumbnail data API client
final th = await yt.thumbnail;

///create a private broadcast for 2 hours from now
final broadcastItem = await br.insert(body: {
  'snippet': {
    'title': 'TEST Broadcast',
    'description': 'Test',
    'scheduledStartTime':
        DateTime.now().add(Duration(hours: 2)).toUtc().toIso8601String()
  },
  'status': {'privacyStatus': 'private'},
  'contentDetails': {
    'monitorStream': {
      'enableMonitorStream': false,
      'broadcastStreamDelayMs': 10
    },
    'enableDvr': true,
    'enableContentEncryption': true,
    'enableEmbed': true,
    'recordFromStart': true,
    'startWithSlate': false
  }
}, part: 'snippet,status,contentDetails');

///bind the broadcast to an existing stream
await br.bind(
    broadcastId: broadcastItem.id,
    streamId: '[one of your valid stream ids]');

///get info on where to upload your thumbnail for the broadcast
final locationUrl = await th.location(videoId: broadcastItem.id);

///upload the thumbnail
await th.set(
    videoId: broadcastItem.id,
    uploadId: Uri.parse(locationUrl).queryParameters['upload_id']!,
    thumbnail: File('[path to an image to upload]'));

```

## Usage of the Cloud Vision API

```dart
final yt = Yt.withJwt('example/cloud_vision_auth.json',
    'https://www.googleapis.com/auth/cloud-vision');

await yt.init();

final vision = await yt.vision;

///the original image to be annotated
final image = Image.fromFilePath('[a large image that will be cropped]');

///crop the image to save some processing time
final cropped = image.copyCrop(1060, 410, 460, 340);

///use the API to find faces and objects
final requests = AnnotationRequests(requests: [
  AnnotationRequest(
      image: cropped,
      features: [
        Feature(maxResults: 10, type: DetectionType.FACE_DETECTION.value),
        Feature(maxResults: 10, type: DetectionType.OBJECT_LOCALIZATION.value)
      ])
]);

///make the API request
final annotatedResponses = await vision.annotate(requests: requests);

///loop through any face detection and draw on the image
annotatedResponses.responses.forEach((annotatedResponse) =>
    annotatedResponse.faceAnnotations?.forEach((faceAnnotation) {
      Vision.drawText(
          cropped,
          faceAnnotation.boundingPoly.vertices.first.x + 2,
          faceAnnotation.boundingPoly.vertices.first.y + 2,
          'Face - ${faceAnnotation.detectionConfidence}');

      Vision.drawAnnotations(cropped, faceAnnotation.boundingPoly.vertices);
      // print('confidence: ${faceAnnotation.detectionConfidence}')
    }));

///loop through any object only detections and draw on the image of a "Person"
///if found
annotatedResponses.responses.forEach((annotatedResponse) => annotatedResponse
        .localizedObjectAnnotations
        ?.where((localizedObjectAnnotation) =>
            localizedObjectAnnotation.name == 'Person')
        .toList()
        .forEach((localizedObjectAnnotation) {
      Vision.drawText(
          cropped,
          (localizedObjectAnnotation.boundingPoly.normalizedVertices.first.x *
                  cropped.width)
              .toInt(),
          (localizedObjectAnnotation.boundingPoly.normalizedVertices.first.y *
                      cropped.height)
                  .toInt() -
              16,
          'Person - ${localizedObjectAnnotation.score}');

      Vision.drawAnnotationsNormalized(
          cropped, localizedObjectAnnotation.boundingPoly.normalizedVertices);
    }));

///output the results as a new image file
await cropped.writeAsJpeg('resulting_image.jpg');
```

## Usage within Flutter

Since this library does not include any Flutter dependencies, it can be easily integrated with any Flutter code using any of the authentication mechanisms described above. However, for some applications there may be a desire to use the user's own YouTube credentials for authentication. The library uses the concept of a [TokenGenerator] to allow for this. [TokenGenerator] is an abstract class that is extended within the library through the [JwtGenerator] and [OAuthGenerator] classes, and generates the authentication token used in API calls to YouTube.

For a Flutter app the [TokenGenerator] can be extended to allow for auth tokens to be generated through the [google_sign_in](https://pub.dev/packages/google_sign_in) pacakge provided by the [flutter.dev](https://pub.dev/publishers/flutter.dev/packages) team. The code to do this looks like this:

```dart
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yt/yt.dart';

class YtLoginGenerator implements TokenGenerator {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/youtube',
    ],
  );

  @override
  Future<Token> generate() async {
    var _currentUser = await _googleSignIn.signInSilently();

    if (_currentUser == null) _currentUser = await _googleSignIn.signIn();

    final token = (await _currentUser!.authentication).accessToken;

    if (token == null) throw Exception();

    return Token(
        accessToken: token, expiresIn: 3599, scope: null, tokenType: '');
  }
}
```

With the generator in place, it becomes quite easy to include google sign-in for youtube into your Flutter app. In one of your controllers you would include code like:

```dart
late final Broadcast broadcast;

final Yt yt = Yt();

@override
void onInit() {
  super.onInit();

  yt.tokenGenerator = YtLoginGenerator();

  init();
}

Future<void> init() async {
  await yt.init();

  broadcast = await yt.broadcast;
}

Future<LiveBroadcastItem> getBroadcast(String broadcastStatus) async {
  LiveBroadcastResponse liveBroadcastResponse =
      await broadcast.list(broadcastStatus: broadcastStatus, maxResults: 50);

  return liveBroadcastResponse.items.isNotEmpty
      ? liveBroadcastResponse.items
      : <LiveBroadcastItem>[];
}
```