# Youtube REST API Client

Native [Dart](https://dart.dev/) interface to multiple Google REST APIs, including:

- [YouTube Data API](https://developers.google.com/youtube/v3/docs)
- [YouTube Live Streaming API](https://developers.google.com/youtube/v3/live/docs)

[![pub package](https://img.shields.io/pub/v/yt_cli.svg)](https://pub.dartlang.org/packages/yt_cli) 
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://raw.githubusercontent.com/faithoflifedev/yt/refs/heads/main/packages/yt_cli/LICENSE)

## Table of Contents
- [Youtube REST API Client](#youtube-rest-api-client)
  - [Table of Contents](#table-of-contents)
  - [Youtube REST API cli (Youtube at the command prompt)](#youtube-rest-api-cli-youtube-at-the-command-prompt)
    - [dart pub install](#dart-pub-install)
  - [API Commands Supported](#api-commands-supported)
    - [Data API](#data-api)
    - [Live Streaming API](#live-streaming-api)
    - [Custom Features (experimental)](#custom-features-experimental)
  - [What's Next?](#whats-next)
  - [Contributing](#contributing)

[![Build Status](https://github.com/faithoflifedev/yt/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/yt/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/yt)](https://shields.io/github/last-commit/faithoflifedev/yt) [![github build](https://img.shields.io/github/actions/workflow/status/faithoflifedev/yt/dart.yml?branch=main)](https://shields.io/github/workflow/status/faithoflifedev/yt/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/yt)](https://shields.io/github/issues/faithoflifedev/yt)

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)

## Youtube REST API cli (Youtube at the command prompt)

A command line interface for broadcasting to Youtube through OBS

### dart pub install

To install using `dart pub`:

```sh
pub global activate yt
```

If the above shows an error like:

```text
-bash: webdev: command not found
```

Then this section of the Dart SDK doc might fix the problem - [running-a-script-from-your-path](https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path)

Usage:

```sh
prompt>yt --help
A command line interface for connecting to Youtube

Usage: yt <command> [arguments]

Global options:
-h, --help    Print this usage information.
    --log-level    [all, debug, info, warning, error, off (default)]
    
Available commands:
  authorize          Generate a refresh token used to authenticate the command line API requests
  broadcast          A liveBroadcast resource represents an event that will be streamed, via live video, on YouTube.
  captions           A caption resource represents a YouTube caption track. A caption track is associated with exactly one YouTube video.
  channels           A channel resource contains information about a YouTube channel.
  chat               A liveChatMessage resource represents a chat message in a YouTube live chat. The resource can contain details about several types of messages, including a newly posted text message or fan funding event.
  playlists          A playlist resource represents a YouTube playlist. A playlist is a collection of videos that can be viewed sequentially and shared with other users. By default, playlists are publicly visible to other users, but playlists can be public or private.
  search             A search result contains information about a YouTube video, channel, or playlist that matches the search parameters specified in an API request. While a search result points to a uniquely identifiable resource, like a video, it does not have its own persistent data.
  stream             A liveStream resource contains information about the video stream that you are transmitting to YouTube. The stream provides the content that will be broadcast to YouTube users. Once created, a liveStream resource can be bound to one or more liveBroadcast resources.
  subscriptions      A subscription resource contains information about a YouTube user subscription. A subscription notifies a user when new videos are added to a channel or when another user takes one of several actions on YouTube, such as uploading a video, rating a video, or commenting on a video.
  thumbnails         A thumbnail resource identifies different thumbnail image sizes associated with a resource.
  version            Display the package name and version.
  video-categories   A videoCategory resource identifies a category that has been or could be associated with uploaded videos.
  videos             A video resource represents a YouTube video.
  watermarks         A watermark resource identifies an image that displays during playbacks of a specified channel's videos.
```

## API Commands Supported

### Data API

- [Captions](https://developers.google.com/youtube/v3/docs/captions)
- [Channels](https://developers.google.com/youtube/v3/docs/channels)
- [Comments](https://developers.google.com/youtube/v3/docs/comments) (partial)
- [PlaylistItems](https://developers.google.com/youtube/v3/docs/playlistItems)
- [Playlists](https://developers.google.com/youtube/v3/docs/playlists)
- [Search](https://developers.google.com/youtube/v3/docs/search)
- [Thumbnails](https://developers.google.com/youtube/v3/docs/thumbnails)
- [VideoCategories](https://developers.google.com/youtube/v3/docs/videoCategories)
- [Videos](https://developers.google.com/youtube/v3/docs/videos)
- [Watermarks](https://developers.google.com/youtube/v3/docs/watermarks)

### Live Streaming API

- [LiveBroadcasts](https://developers.google.com/youtube/v3/live/docs/liveBroadcasts)
- [LiveChatMessages](https://developers.google.com/youtube/v3/live/docs/liveChatMessages)
- [LiveStreams](https://developers.google.com/youtube/v3/live/docs/liveStreams)

### Custom Features (experimental)

- download chat history from a LiveChat
- simple chatbot functionality for LiveChat

## What's Next?

- Expanded API Commands

## Contributing

Any help from the open-source community is always welcome and needed:
- Found an issue?
    - Please fill a bug report with details.
- Need a feature?
    - Open a feature request with use cases.
- Are you using and liking the project?
    - Promote the project: create an article or post about it
    - Make a donation
- Do you have a project that uses this package
    - let's cross promote, let me know and I'll add a link to your project
- Are you a developer?
    - Fix a bug and send a pull request.
    - Implement a new feature.
    - Improve the Unit Tests.
- Have you already helped in any way?
    - **Many thanks from me, the contributors and everybody that uses this project!**

*If you donate 1 hour of your time, you can contribute a lot, because others will do the same, just be part and start with your 1 hour.*