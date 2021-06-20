import 'package:dio/dio.dart';
import 'package:yt/util/tokenGenerator.dart';
import 'package:yt/yt.dart';

class Yt {
  static final dio = Dio();

  final DateTime tokenExpiry = DateTime(2010, 0, 0);

  bool _useToken = true;

  String? _token;

  TokenGenerator? tokenGenerator;

  String? _apiKey;

  void set token(String token) => _token = token;

  Yt();

  factory Yt.withKey(String apiKey) {
    final yt = Yt();

    yt._apiKey = apiKey;

    yt._useToken = false;

    return yt;
  }

  factory Yt.withOAuth(OAuthCredentials oauthCredentials) {
    Yt yt = Yt();

    yt.tokenGenerator =
        OAuthGenerator(oauthCredentials: oauthCredentials, dio: dio);

    return yt;
  }

  factory Yt.withJwt(String credentialsFile, String scope) {
    Yt yt = Yt();

    yt.tokenGenerator =
        JwtGenerator(credentialsFile: credentialsFile, scope: scope, dio: dio);

    return yt;
  }

  Future<void> _confirmToken() async {
    if (tokenGenerator == null) throw Exception();

    if (tokenExpiry.isBefore(DateTime.now())) {
      final tokenData = await tokenGenerator!.generate();

      _token = tokenData.accessToken;

      tokenExpiry.add(Duration(seconds: tokenData.expiresIn));
    }
  }

  ///A liveBroadcast resource represents an event that will be streamed, via live video, on YouTube.
  Future<Broadcast> get broadcast async {
    await _confirmToken();

    return Broadcast(_token!, dio);
  }

  ///A liveChatMessage resource represents a chat message in a YouTube live chat. The resource can contain details about several types of messages, including a newly posted text message or fan funding event.
  ///
  ///The live chat feature is enabled by default for live broadcasts and is available while the live event is active. (After the event ends, live chat is no longer available for that event.)
  Future<Chat> get chat async {
    await _confirmToken();

    return Chat(_token!, dio);
  }

  ///A playlist resource represents a YouTube playlist. A playlist is a collection of videos that can be viewed sequentially and shared with other users. By default, playlists are publicly visible to other users, but playlists can be public or private.
  ///
  ///YouTube also uses playlists to identify special collections of videos for a channel, such as:
  ///
  /// - uploaded videos
  /// - positively rated (liked) videos
  ///To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel.
  ///
  ///You can then use the playlistItems.list method to retrieve any of those lists. You can also add or remove items from those lists by calling the playlistItems.insert and playlistItems.delete methods.
  Future<Playlists> get playlists async {
    if (_useToken) await _confirmToken();

    return Playlists(token: _token, apiKey: _apiKey, dio: dio);
  }

  ///A search result contains information about a YouTube video, channel, or playlist that matches the search parameters specified in an API request. While a search result points to a uniquely identifiable resource, like a video, it does not have its own persistent data.
  Future<Search> get search async {
    if (_useToken) await _confirmToken();

    return Search(token: _token, apiKey: _apiKey, dio: dio);
  }

  ///A liveStream resource contains information about the video stream that you are transmitting to YouTube. The stream provides the content that will be broadcast to YouTube users. Once created, a [LiveStreamItem] resource can be bound to one or more [LiveBroadcastItem] resources.
  Future<LiveStream> get stream async {
    await _confirmToken();

    return LiveStream(_token!, dio);
  }

  ///A [Thumbnail] resource identifies different thumbnail image sizes associated with a resource. Please note the following characteristics of thumbnail images:
  ///
  ///- A resource's Snippet.thumbnails property is an object that identifies the thumbnail images available for that resource.
  ///- A thumbnail resource contains a series of objects. The name of each object (default, medium, high, etc.) refers to the thumbnail image size.
  /// - Different types of resources may support different thumbnail image sizes.
  ///- Different types of resources may define different sizes for thumbnail images with the same name. For example, the default thumbnail image for a video resource is typically 120px by 90px, and the default thumbnail image for a channel resource is typically 88px by 88px.
  ///- Resources of the same type may still have different thumbnail image sizes for certain images depending on the resolution of the original image or content uploaded to YouTube. For example, an HD video may support higher resolution thumbnails than non-HD videos.
  ///- Each object that contains information about a thumbnail image size has a width property and a height property. However, the width and height properties may not be returned for that image.
  ///- If an uploaded thumbnail image does not match the required dimensions, the image is resized to match the correct size without changing its aspect ratio. The image is not cropped, but may include black bars so that the size is correct.
  Future<SetThumbnail> get thumbnail async {
    await _confirmToken();

    return SetThumbnail(_token!, dio);
  }

  ///A video resource represents a YouTube video.
  Future<Videos> get videos async {
    await _confirmToken();

    return Videos(_token!, dio);
  }

  ///Integrates Google Vision features, including image labeling, face, logo, and landmark detection, optical character recognition (OCR), and detection of explicit content, into applications.
  Future<Vision> get vision async {
    await _confirmToken();

    return Vision(_token!, dio);
  }
}
