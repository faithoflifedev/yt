# Youtube REST API Client

[![pub package](https://img.shields.io/pub/v/yt.svg)](https://pub.dartlang.org/packages/yt)

Native [Dart](https://dart.dev/) interface to multiple Google REST APIs, including:

- [YouTube Data API](https://developers.google.com/youtube/v3/docs)
- [YouTube Live Streaming API](https://developers.google.com/youtube/v3/live/docs)

## Table of Contents
- [How does this package differ from the googleapis package?](#how-does-this-package-differ-from-the-googleapis-package)
- [New for version 2.0.0](#new-for-version-200)
- [API Commands Supported](#api-commands-supported)
  - [Data API](#data-api)
  - [Live Streaming API](#live-streaming-api)
  - [Custom Features (experimental)](#custom-features-experimental)
- [Getting Started](#getting-started)
- [Obtaining Authorization Credentials](#obtaining-authorization-credentials)
- [Using of the Data API](#using-of-the-data-api)
- [Upload a Video](#upload-a-video)
- [Using the Live Streaming API](#using-the-live-streaming-api)
- [Download a LiveChat](#download-a-livechat)
- [Experimental Chatbot](#experimental-chatbot)
- [Usage within Flutter](#usage-within-flutter)
- [Available Examples](#available-examples)
- [What's Next?](#whats-next)
- [Breaking change in v2.0.0 from v1.2.x](#breaking-change-in-v200-from-v12x)
- [Breaking change in v1.1.0 from v1.0.x](#breaking-change-in-v110-from-v10x)

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)

## How does this package differ from the [googleapis](https://pub.dev/packages/googleapis) package?

- It's not generated, it's manually coded and limited to a targeted set of just YouTube APIs
- Since it's not generated the package includes additional useful features like a cli (Command Line Interface) and the experimental Chatbot
- A tighter focus to the package means focused documentation and focused examples

## New for version 2.0.0

As of the 2.0.0 release of this package there is a cli utility included that can be used to return data for any API call currently supported by the package. If you want to get started quickly with the cli utility run these commands in a terminal session:

```sh
pub global activate yt

yt --help
```

Please see the cli documentation [README.md](https://github.com/faithoflifedev/yt/tree/main/bin) for more detailed usage information.

**NOTE:** Cloud Vision API support has been permanently removed from this package and will be available as it's own package.  Additionally, cache support has been temporarily removed.

## API Commands Supported

### Data API

- [Channels](https://developers.google.com/youtube/v3/docs/channels) (partial)
- [PlaylistItems](https://developers.google.com/youtube/v3/docs/playlistItems)
- [Playlists](https://developers.google.com/youtube/v3/docs/playlists)
- [Search](https://developers.google.com/youtube/v3/docs/search)
- [Thumbnails](https://developers.google.com/youtube/v3/docs/thumbnails)
- [VideoCategories](https://developers.google.com/youtube/v3/docs/videoCategories)
- [Videos](https://developers.google.com/youtube/v3/docs/videos)

### Live Streaming API

- [LiveBroadcasts](https://developers.google.com/youtube/v3/live/docs/liveBroadcasts)
- [LiveChatMessages](https://developers.google.com/youtube/v3/live/docs/liveChatMessages)
- [LiveStreams](https://developers.google.com/youtube/v3/live/docs/liveStreams)

### Custom Features (experimental)

- download chat history from a LiveChat
- simple chatbot functionality for LiveChat

## Getting Started

To use this package, add the dependency to your pubspec.yaml file:

```yaml
dependencies:
  ...
  yt: ^2.0.6+3
```

## Obtaining Authorization Credentials

YouTube API access requires an access token or API key depending on the API and the type of information being accessed. As a general rule of thumb, read-only public information and be accessed through an API key, otherwise an access token is required.

The yt library supports two mechanisms for authentication. All of the authentication schemes require some configuration in the [Google API console](https://developers.google.com/youtube/v3/live/registering_an_application). The document [Obtaining authorization credentials](https://developers.google.com/youtube/v3/live/registering_an_application) covers authentication with [OAuth 2.0](https://developers.google.com/identity/protocols/OAuth2) which works for both the Data API and the Live Streaming API the same document also covers authenticating with API keys which works only with the Data API.

More in depth documentation on how OAuth2 works within the **yt library** is available in the [OAuth 2.0 for Mobile & Desktop Apps](https://developers.google.com/identity/protocols/oauth2/native-app) document. Overall, for OAuth2 the library takes a provided single use auth code and generates a long lived OAuth2 refresh token that is persisted as a hidden file.

Both of the above authentication methods will work for Flutter apps as well, however you may want to instead allow your app's users to use their own YouTube credentials. Instructions for authenticating this way are included at the end of this document in the _Usage within Flutter_ section.

A number of the examples use OAuth 2.0 for authentication. The examples have the OAuth2 credentials made available to sample the code though a **.json** or **.yaml** file that contains these lines:

```yaml
clientId: [client id from the API console]
clientSecret: [client secret from the API console]
code: [single use auth code]
```

The **.json** version of this file can be generated using the cli utility:

```sh
#make sure you've created an app instance in the Google API console
#make sure you've already activated the cli utility "pub global activate yt"

yt authorize

#follow the prompts to provide clientID, clientSecret, then use a browser to 
#authenticate and generate the one-time code
```

After following the steps provided by the **_cli_** command, your credential file will be auto created as `$HOME/.yt/credentials.json`

Alternatively, if you want to manually create your credentials file, then you will need to use a browser to generate the required one-time **_code_**. Once you have followed the instructions outlined in the YouTube docs for creating the app instance and obtaining the OAuth2 credentials, then the next step is to enter this url into a desktop browser:

```txt
https://accounts.google.com/o/oauth2/auth?client_id=[client_id_from_the_API_console]&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=https://www.googleapis.com/auth/youtube&response_type=code
```

After following the steps to authorize the provided account with the app created in the API console, you will be presented with an single use authorization code. The code is entered as the **_code_** line in the _yaml_ or _json_file referenced above.

## Using of the Data API

Youtube provides multiple methods for API authentication. The Data API can use both API key and OAuth for authentication the example below shows how both of these

```dart
import 'package:yt/yt.dart';

//if you used "yt authorize" to generate a credentials file
final yt = await Yt.withOAuth();

//authenticate using OAuth - manually created file
//final yt = await Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

//some APIs can use an API Key for authentication
//final yt = await Yt.withKey('[youtube api key]');

// List of videos from playlist
var playlistResponse = await yt.playlists.list(
      channelId: '[youtube channel id]', maxResults: 25);

playlistResponse.items
    .forEach((playlist) => print('${playlist.snippet?.title}'));
```

## Upload a Video

```dart
final yt = await Yt.withOAuth();

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
 
final videoItem = await yt.videos.insert(
    body: body,
    videoFile:
        File('[path to a video to upload]'),
    notifySubscribers: false);

print(videoItem);
```

## Using the Live Streaming API

```dart
import 'package:yt/yt.dart';

final yt = await Yt.withOAuth();

///the live streaming broadcast API client
final br = yt.broadcast;

///the thumbnail data API client
final th = yt.thumbnails;

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

## Download a LiveChat

```dart
import 'package:yt/yt.dart';

final yt = await Yt.withOAuth();

var broadcastResponse = await yt.broadcast.list(broadcastStatus: 'active');

if (broadcastResponse.items.isNotEmpty) {
  //will download and output to stdout
  await yt.chat.downloadHistory(liveBroadcastItem: broadcastResponse.items.first);
}
```

## Experimental Chatbot

```dart
final yt = await Yt.withOAuth();

//the live streaming broadcast API client
final br = yt.broadcast;

//look for an active broadcast
var broadcastResponse = await br.list(broadcastStatus: 'active');

//get an upcoming broadcast, if there's no active
if (broadcastResponse.items.isEmpty) {
  broadcastResponse =
      await br.list(broadcastStatus: 'upcoming', maxResults: 1);
}

if (broadcastResponse.items.isNotEmpty) {
  final liveBroadcastItem = broadcastResponse.items.first;

  //setup the chatbot with a custom dialog
  final chatbot = Chatbot.fromYaml(File('chatbot.yaml'));

  //if being run periodically you will want to provide a TimeStore to persist
  //a timestamp that will ensure the chatbot doesn't repeat answers
  await yt.chat
      .answerBot(liveBroadcastItem: liveBroadcastItem, chatbot: chatbot);
}
```

## Usage within Flutter

This library does not include any Flutter dependencies but it can be easily integrated with Flutter code using any of the authentication mechanisms described above. In addition, for some applications there may be a desire to use the user's own YouTube credentials for authentication. The library uses the concept of a [TokenGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/TokenGenerator-class.html) to allow for this. [TokenGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/TokenGenerator-class.html) is an abstract class that is extended within the library through the [JwtGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/JwtGenerator-class.html) and [OAuthGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator//OAuthGenerator-class.html) classes, and generates the authentication token used in API calls to YouTube.

For a Flutter app the [TokenGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/TokenGenerator-class.html) can be extended to allow for auth tokens to be generated through the [google_sign_in](https://pub.dev/packages/google_sign_in) package provided by the [flutter.dev](https://pub.dev/publishers/flutter.dev/packages) team. Keep in mind that you must fulfill all of the requirements for the **google_sign_in** package before attempting to use the code below. The code to use google_sign_in for authentication:

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
  //class definitions for a Flutter app
  ...
  final items = <Playlist>[];

  late final Yt yt;

  Playlists? playlists;

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    yt = await Yt.withGenerator(YtLoginGenerator());
  }

  void _getPlaylists() async {
    items.clear();

    setState(() {
      items.addAll(await yt.playlists.list(mine: true));
    });
  }

    @override
  Widget build(BuildContext context) {
    //ListView.builder
    ...
    floatingActionButton: FloatingActionButton(
        onPressed: _getPlaylists,
        child: Icon(Icons.add),
      )
  }
```

## Available Examples

- [example.dart](https://github.com/faithoflifedev/yt/blob/main/example/example.dart) - (command line) display various YouTube data
- [livechat_example.dart](https://github.com/faithoflifedev/yt/blob/main/example/livechat_example.dart) - (command line) chatbot will answer a set of questions in a liveChat session
- [flutter_playlist](https://github.com/faithoflifedev/yt/tree/main/example/flutter_playlist) - display a YouTube playlist in a ListView

## What's Next?

- ~~A working sample Flutter app~~
- Expanded API Commands

## Breaking change in v2.0.0 from v1.2.x

The `Yt` object now returns a `Future` and the reference to a specific API module is no longer a `Future`.  So now you can use the following code:

```dart
final yt = await Yt.withOAuth(); //uses default credentials file, created with "yt authorize" cli utility

final playlists = yt.playlists;

var playlistResponse = await yt.playlists.list(
      channelId: '[youtube channel id]', maxResults: 25);
```

in place of:

```dart
final yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

final playlists = await yt.playlists;

var playlistResponse = await yt.playlists.list(
      channelId: '[youtube channel id]', maxResults: 25);

```

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

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)
