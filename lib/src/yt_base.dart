import 'package:dio/dio.dart';
// import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:yt/yt.dart';

class Yt {
  static final dio = Dio();
  static final DateTime tokenExpiry = DateTime(2010, 0, 0);

  static TokenGenerator? tokenGenerator;
  static String? _token;

  String? _apiKey;
  // CachePolicy? _cachePolicy;
  Broadcast? _broadcast;
  Channels? _channels;
  Chat? _chat;
  LiveStream? _liveStream;
  Playlists? _playlists;
  PlaylistItems? _playlistItems;
  Search? _search;
  Thumbnails? _thumbnails;
  Videos? _videos;
  VideoCategories? _videoCategories;

  set token(String token) => _token = token;
  // set cachePolicy(CachePolicy cachePolicy) => _cachePolicy;

  Broadcast get broadcast => _broadcast!;
  Channels get channels => _channels!;
  Chat get chat => _chat!;
  LiveStream get liveStream => _liveStream!;
  Playlists get playlists => _playlists!;
  PlaylistItems get playlistItems => _playlistItems!;
  Search get search => _search!;
  Thumbnails get thumbnails => _thumbnails!;
  Videos get videos => _videos!;
  VideoCategories get videoCategories => _videoCategories!;

  // Yt();

  static Future<Yt> withGenerator(TokenGenerator generator) async {
    final yt = Yt();

    Yt.tokenGenerator = generator;

    await _confirmToken();

    yt.setModules();

    return yt;
  }

  static Future<Yt> withKey(String apiKey) async {
    final yt = Yt();

    yt._apiKey = apiKey;

    yt.setModules();

    return yt;
  }

  static Future<Yt> withOAuth(
      [OAuthCredentials? oauthCredentials, bool refresh = false]) async {
    final Yt yt = Yt();

    oauthCredentials ??=
        OAuthCredentials.fromJsonFile(Util.defaultCredentialsFile);

    tokenGenerator = OAuthGenerator(
        oauthCredentials: oauthCredentials, dio: dio, refresh: refresh);

    await _confirmToken();

    yt.setModules();

    return yt;
  }

  static Future<void> _confirmToken() async {
    if (tokenGenerator == null) {
      throw Exception();
    } else {
      if (tokenExpiry.isBefore(DateTime.now())) {
        final tokenData = await tokenGenerator!.generate();

        _token = tokenData.accessToken;

        tokenExpiry.add(Duration(seconds: tokenData.expiresIn));
      }
    }
  }

  void setModules() {
    if (_token != null) {
      ///A liveBroadcast resource represents an event that will be streamed, via live video, on YouTube.
      _broadcast = Broadcast(token: _token!, dio: dio);

      ///A liveChatMessage resource represents a chat message in a YouTube live chat. The resource can contain details about several types of messages, including a newly posted text message or fan funding event.
      ///
      ///The live chat feature is enabled by default for live broadcasts and is available while the live event is active. (After the event ends, live chat is no longer available for that event.)
      _chat = Chat(token: _token!, dio: dio);

      ///A liveStream resource contains information about the video stream that you are transmitting to YouTube. The stream provides the content that will be broadcast to YouTube users. Once created, a [LiveStreamItem] resource can be bound to one or more [LiveBroadcastItem] resources.
      _liveStream = LiveStream(token: _token!, dio: dio);

      ///A [Thumbnail] resource identifies different thumbnail image sizes associated with a resource. Please note the following characteristics of thumbnail images:
      ///
      ///- A resource's Snippet.thumbnails property is an object that identifies the thumbnail images available for that resource.
      ///- A thumbnail resource contains a series of objects. The name of each object (default, medium, high, etc.) refers to the thumbnail image size.
      /// - Different types of resources may support different thumbnail image sizes.
      ///- Different types of resources may define different sizes for thumbnail images with the same name. For example, the default thumbnail image for a video resource is typically 120px by 90px, and the default thumbnail image for a channel resource is typically 88px by 88px.
      ///- Resources of the same type may still have different thumbnail image sizes for certain images depending on the resolution of the original image or content uploaded to YouTube. For example, an HD video may support higher resolution thumbnails than non-HD videos.
      ///- Each object that contains information about a thumbnail image size has a width property and a height property. However, the width and height properties may not be returned for that image.
      ///- If an uploaded thumbnail image does not match the required dimensions, the image is resized to match the correct size without changing its aspect ratio. The image is not cropped, but may include black bars so that the size is correct.
      _thumbnails = Thumbnails(token: _token!, dio: dio);

      ///A video resource represents a YouTube video.
      _videos = Videos(token: _token!, dio: dio);

      ///A videoCategory resource identifies a category that has been or could be associated with uploaded videos.
      _videoCategories = VideoCategories(token: _token!, dio: dio);
    }

    ///A channel resource contains information about a YouTube channel.
    _channels = Channels(token: _token, apiKey: _apiKey, dio: dio);

    ///A playlist resource represents a YouTube playlist. A playlist is a collection of videos that can be viewed sequentially and shared with other users. By default, playlists are publicly visible to other users, but playlists can be public or private.
    ///
    ///YouTube also uses playlists to identify special collections of videos for a channel, such as:
    ///
    /// - uploaded videos
    /// - positively rated (liked) videos
    ///To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel.
    ///
    ///You can then use the playlistItems.list method to retrieve any of those lists. You can also add or remove items from those lists by calling the playlistItems.insert and playlistItems.delete methods.
    _playlists = Playlists(token: _token, apiKey: _apiKey, dio: dio);

    ///A playlistItem resource identifies another resource, such as a video, that is included in a playlist. In addition, the playlistItem resource contains details about the included resource that pertain specifically to how that resource is used in that playlist.
    //////
    ///YouTube also uses a playlist to identify a channel's list of uploaded videos, with each playlistItem in that list representing one uploaded video. You can retrieve the playlist ID for that list from the channel resource for a given channel. You can then use the playlistItems.list method to the list.
    _playlistItems = PlaylistItems(token: _token, apiKey: _apiKey, dio: dio);

    ///A search result contains information about a YouTube video, channel, or playlist that matches the search parameters specified in an API request. While a search result points to a uniquely identifiable resource, like a video, it does not have its own persistent data.
    _search = Search(token: _token, apiKey: _apiKey, dio: dio);
  }

  ///Integrates Google Vision features, including image labeling, face, logo, and landmark detection, optical character recognition (OCR), and detection of explicit content, into applications.
  // Future<Vision> get vision async {
  //   await _confirmToken();

  //   return Vision(_token!, dio);
  // }

  // void initCache() {
  //   if (_cachePolicy == null) return;

  //   // Add cache interceptor with global/default options
  //   dio.interceptors.add(
  //     DioCacheInterceptor(
  //       options: CacheOptions(
  //         // A default store is required for interceptor.
  //         store: MemCacheStore(),

  //         // All subsequent fields are optional.

  //         // Default.
  //         policy: _cachePolicy!,
  //         // Returns a cached response on error but for statuses 401 & 403.
  //         // Also allows to return a cached response on network errors (e.g. offline usage).
  //         // Defaults to [null].
  //         hitCacheOnErrorExcept: [401, 403],
  //         // Overrides any HTTP directive to delete entry past this duration.
  //         // Useful only when origin server has no cache config or custom behaviour is desired.
  //         // Defaults to [null].
  //         maxStale: const Duration(days: 7),
  //         // Default. Allows 3 cache sets and ease cleanup.
  //         priority: CachePriority.normal,
  //         // Default. Body and headers encryption with your own algorithm.
  //         cipher: null,
  //         // Default. Key builder to retrieve requests.
  //         keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  //         // Default. Allows to cache POST requests.
  //         // Overriding [keyBuilder] is strongly recommended when [true].
  //         allowPostMethod: false,
  //       ),
  //     ),
  //   );
  // }
}
