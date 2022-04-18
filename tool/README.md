# Youtube REST API Client

Native [Dart](https://dart.dev/) interface to multiple Google REST APIs, including:

- [YouTube Data API](https://developers.google.com/youtube/v3/docs)
- [YouTube Live Streaming API](https://developers.google.com/youtube/v3/live/docs)
- [Cloud Vision API](https://cloud.google.com/vision/docs/reference/rest) (not really a YouTube API but gives some image processing options)

# New for version 2.0.0.dev.1

The new release will include a cli utility that can be used to return data for any API call currently supported by this package. Please see the [README](/bin/README.md) for more information

## API Commands Supported

### Data API:

- [Channels](https://developers.google.com/youtube/v3/docs/channels) (partial)
- [PlaylistItems](https://developers.google.com/youtube/v3/docs/playlistItems)
- [Playlists](https://developers.google.com/youtube/v3/docs/playlists)
- [Search](https://developers.google.com/youtube/v3/docs/search)
- [Thumbnails](https://developers.google.com/youtube/v3/docs/thumbnails)
- [VideoCategoriess](https://developers.google.com/youtube/v3/docs/videoCategories)
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

## Obtaining Authorization Credentials

Youtube API access requires an access token or API key depending on the API and the type of information being accessed. As a general rule of thumb, read-only public information cand be accessed through an API key, otherwise an access token is required.

The yt library supports three mechanisms for authentication. All of the authentication schemes require some configuration in the [Google API console](https://developers.google.com/youtube/v3/live/registering_an_application). The document [Obtaining authorization credentials](https://developers.google.com/youtube/v3/live/registering_an_application) covers authentication with [OAuth 2.0](https://developers.google.com/identity/protocols/OAuth2) which works for both the Data API and the Live Streaming API the same document also covers authenticating with API keys which works only with the Data API.

More in depth documentation on how OAuth2 works within the **yt library** is available in the [OAuth 2.0 for Mobile & Desktop Apps](https://developers.google.com/identity/protocols/oauth2/native-app) document. Overall, for OAuth2 the library takes a provided single use auth code and generates a long lived OAuth2 refresh token that is persisted as a hidden file.

[Authenticating to the Cloud Vision API](https://cloud.google.com/vision/product-search/docs/auth) requires a JSON file with the JWT token information, which you can obtain by [creating a service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating_a_service_account) in the API console.

All of the above authentication methods will work for Flutter apps as well, however you may want to instead allow your app's users to use their own YouTube credentials. Instructions for authenticating this way are included at the end of this document in the _Usage within Flutter_ section.

A number of the examples use OAuth 2.0 for authentication. The examples have the OAuth2 credentials made available to sample the code though a **.yaml** file that contains these lines:

```yaml
url: https://oauth2.googleapis.com/token
clientId: [client id from the API console]
clientSecret: [client secret from the API console]
code: [single use auth code]
```

There is an additional step required to generate the **_code_** needed for the above file. Once you have followed the instructions outlined in the YouTube docs for creating the app instance and obtaining the OAuth2 credentials, then the next step is to enter this url into a desktop browser:

**https://accounts.google.com/o/oauth2/auth?client_id=[client_id_from_the_API_console]&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=https://www.googleapis.com/auth/youtube&response_type=code**

Once you have completed the steps to authorize the provdided account with the app created in the API console, you will be presented with an single use authorization code. The code is entered as the **_code_** line in the _yaml_ file above.

## Usage of the Data API

Youtube provides multiple methods for API authentication. The Data API can use both API key and OAuth for authentication the example below shows how both of these

```dart
import 'package:yt/yt.dart';

//authenticate using OAuth
final yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

//alternatively, some APIs can use an API Key for authentication
//final yt = Yt.withKey('[youtube api key]');

///get an instance of the playlists API client
final playlists = await yt.playlists;

// List of videos from playlist
var playlistResponse = await playlists.list(
      channelId: '[youtube channel id]', maxResults: 25);

playlistResponse.items
    .forEach((playlist) => print('${playlist.snippet?.title}'));
```

## Upload a Video

```dart
final yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

final videos = await yt.videos;

final body = <String, dynamic>{
  'snippet': {
    'title': 'TEST title',
    'description': 'Test Description',
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
    videoFile:
        File('[path to a video to upload]'),
    notifySubscribers: false);

print(videoItem);
```

## Usage of the Live Streaming API

```dart
import 'package:yt/yt.dart';

final yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

///the live streaming broadcast API client
final br = await yt.broadcast;

///the thumbnail data API client
final th = await yt.thumbnails;

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

///upload the thumbnail
await th.set(
    videoId: broadcastItem.id,
    thumbnail: File('[path to an image to upload]'));

```

## Usage of the Cloud Vision API

```dart
final yt = Yt.withJwt('example/cloud_vision_auth.json',
    'https://www.googleapis.com/auth/cloud-vision');

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

This library does not include any Flutter dependencies but it can be easily integrated with Flutter code using any of the authentication mechanisms described above. In addition, for some applications there may be a desire to use the user's own YouTube credentials for authentication. The library uses the concept of a [TokenGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/TokenGenerator-class.html) to allow for this. [TokenGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/TokenGenerator-class.html) is an abstract class that is extended within the library through the [JwtGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/JwtGenerator-class.html) and [OAuthGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator//OAuthGenerator-class.html) classes, and generates the authentication token used in API calls to YouTube.

For a Flutter app the [TokenGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/TokenGenerator-class.html) can be extended to allow for auth tokens to be generated through the [google_sign_in](https://pub.dev/packages/google_sign_in) pacakge provided by the [flutter.dev](https://pub.dev/publishers/flutter.dev/packages) team. Keep in mind that you must fulfill all of the requirements for the **google_sign_in** package before attempting to use the code below. The code to use google_sign_in for authentication this looks like this:

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

With the generator in place, it becomes quite easy to include _google sign-in_ for YouTube into your Flutter app. In one of your controllers you would include code like:

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

## Available Examples

- [flutter_playlist](https://github.com/faithoflifedev/yt/tree/main/example/flutter_playlist) - display a YouTube playlist in a ListView
- [yt_channels.dart](https://github.com/faithoflifedev/yt/blob/main/example/yt_channels.dart) - (command line) display YouTube channels
- [yt_playlistIyems.dart](https://github.com/faithoflifedev/yt/blob/main/example/yt_playlistItems.dart) - (command line) display a list of videos from a playlist
- [yt_chat.dart](https://github.com/faithoflifedev/yt/blob/main/example/yt_chat.dart) - (command line) display the chat history from a running live broadcast
- [yt_playlist.dart](https://github.com/faithoflifedev/yt/blob/main/example/yt_playlist.dart) - (command line) display a YouTube playlist
- [yt_vision.dart](https://github.com/faithoflifedev/yt/blob/main/example/yt_vision.dart) - (command line) draw a box around faces and other objects in a photo

## What's Next?

- ~~A working sample Flutter app~~
- Expanded API Commands
- Improved documentation

## Breaking change in v1.1.0 from v1.0.x

The latest revision has been updated so that it better matches the actual Youtube Data API for thumbnail upload. So, whereas in v1.0.x you would use this code to upload a thumbnail:

```dart
final th = await yt.thumbnails;

///get info on where to upload your thumbnail for the broadcast
final locationUrl = await th.location(videoId: broadcastItem.id);

///upload the thumbnail
await th.set(
    videoId: broadcastItem.id,
    uploadId: Uri.parse(locationUrl).queryParameters['upload_id']!,
    thumbnail: File('[path to an image to upload]'));
```

In v1.1.x the code has been simplified and matches the API definition:

```dart

///upload the thumbnail
final th = await yt.thumbnails;

await th.set(
    videoId: broadcastItem.id,
    thumbnail: File('[path to an image to upload]'));
```
