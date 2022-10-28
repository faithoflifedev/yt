# Youtube REST API CLI

A command line interface for broadcasting to Youtube through OBS

To install:

```sh
pub global activate yt
```

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
  channels           A channel resource contains information about a YouTube channel.
  chat               A liveChatMessage resource represents a chat message in a YouTube live chat. The resource can contain details about several types of messages, including a newly posted text message or fan funding event.
  playlists          A playlist resource represents a YouTube playlist. A playlist is a collection of videos that can be viewed sequentially and shared with other users. By default, playlists are publicly visible to other users, but playlists can be public or private.
  search             A search result contains information about a YouTube video, channel, or playlist that matches the search parameters specified in an API request. While a search result points to a uniquely identifiable resource, like a video, it does not have its own persistent data.
  stream             A liveStream resource contains information about the video stream that you are transmitting to YouTube. The stream provides the content that will be broadcast to YouTube users. Once created, a liveStream resource can be bound to one or more liveBroadcast resources.
  subscriptions      A subscription resource contains information about a YouTube user subscription. A subscription notifies a user when new videos are added to a channel or when another user takes one of several actions on YouTube, such as uploading a video, rating a video, or commenting on a video.
  thumbnails         A thumbnail resource identifies different thumbnail image sizes associated with a resource.
  video-categories   A videoCategory resource identifies a category that has been or could be associated with uploaded videos.
  videos             A video resource represents a YouTube video.
```

Available commands:
|command|description|
|--- |--- |
|[authorize](#authorize)|Generate a refresh token used to authenticate the command line API requests|
|[broadcast](#broadcast)|A liveBroadcast resource represents an event that will be streamed, via live video, on YouTube.|
|[channels](#channels)|A channel resource contains information about a YouTube channel.|
|[chat](#chat)|A liveChatMessage resource represents a chat message in a YouTube live chat. The resource can contain details about several types of messages, including a newly posted text message or fan funding event.|
|[playlists](#playlists)|A playlist resource represents a YouTube playlist. A playlist is a collection of videos that can be viewed sequentially and shared with other users. By default, playlists are publicly visible to other users, but playlists can be public or private.|
|[search](#search)|A search result contains information about a YouTube video, channel, or playlist that matches the search parameters specified in an API request. While a search result points to a uniquely identifiable resource, like a video, it does not have its own persistent data.|
|[stream](#stream)|A liveStream resource contains information about the video stream that you are transmitting to YouTube. The stream provides the content that will be broadcast to YouTube users. Once created, a liveStream resource can be bound to one or more liveBroadcast resources.|
|[subscriptions](#subscriptions)|A subscription resource contains information about a YouTube user subscription. A subscription notifies a user when new videos are added to a channel or when another user takes one of several actions on YouTube, such as uploading a video, rating a video, or commenting on a video.|
|[thumbnails](#thumbnails)|A thumbnail resource identifies different thumbnail image sizes associated with a resource.|

Just like the main library, any responses provided by the above commands will be given in the JSON format.  So ideally, you will want to use a command line json parser to interpret the results.  The recommended json parser for this purpose is [_jq_](https://stedolan.github.io/jq/).  With _jq_ you can process the results of a command as follows:

## Quick start

```sh
#step 1
onvif authorize
#follow prompts

#step 2
yt playlists list --part snippet,contentDetails --id PLjxrf2q8roU3BopVma21AnrhDD_12Bu1w | jq -r '.items[] | "title: " + .snippet.title + "\nthumbnail: " + .snippet.thumbnails.default.url'
#output would be
title: Get ready for Flutter at Google I/O
thumbnail: https://i.ytimg.com/vi/IdrCyS7EF8M/default.jpg
```

## authorize

```sh
prompt>yt authorize --help
```

```text
Generate a refresh token used to authenticate the command line API requests

Usage: yt authorize [arguments]
-h, --help    Print this usage information.
```

Use this command to generate a refresh token that will allow authentication for future command line API requests. You will be required to supply a **clientId** and **clientSecret** as generated through the [Obtaining authorization credentials](https://developers.google.com/youtube/v3/live/registering_an_application) in the YouTube docs.

## broadcast

```sh
prompt>yt broadcast --help
```

```text
A liveBroadcast resource represents an event that will be streamed, via live video, on YouTube.

Usage: yt broadcast <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  bind         Binds a YouTube broadcast to a stream or removes an existing binding between a broadcast and a stream. A broadcast can only be bound to one video stream, though a video stream may be bound to more than one broadcast.
  delete       Deletes a broadcast.
  insert       Creates a broadcast.
  list         Returns a list of YouTube broadcasts that match the API request parameters.
  transition   Changes the status of a YouTube live broadcast and initiates any processes associated with the new status. For example, when you transition a broadcast's status to testing, YouTube starts to transmit video to that broadcast's monitor stream. Before calling this method, you should confirm that the value of the status.streamStatus property for the stream bound to your broadcast is active.
```

### broadcast bind

```sh
prompt>yt broadcast bind --help
```

```text
Binds a YouTube broadcast to a stream or removes an existing binding between a broadcast and a stream. A broadcast can only be bound to one video stream, though a video stream may be bound to more than one broadcast.

Usage: yt broadcast bind [arguments]
-h, --help                     Print this usage information.
    --id=<id> (mandatory)      The id parameter specifies the unique ID of the broadcast that is being bound to a video stream.
    --part                     The part parameter specifies a comma-separated list of one or more liveBroadcast resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, contentDetails, and status.
                               (defaults to "id,snippet,contentDetails,status")
    --stream-id=<stream-id>    The streamId parameter specifies the unique ID of the video stream that is being bound to a broadcast. If this parameter is omitted, the API will remove any existing binding between the broadcast and a video stream.
```

### broadcast delete

```sh
prompt>yt broadcast delete --help
```

```text
Deletes a broadcast.

Usage: yt broadcast delete [arguments]
-h, --help                   Print this usage information.
    --id=<id> (mandatory)    The id parameter specifies the YouTube live broadcast ID for the resource that is being deleted.
```

### broadcast insert

```sh
prompt>yt help broadcast insert
```

```text
Creates a broadcast.

Usage: yt broadcast insert [arguments]
-h, --help                Print this usage information.
    --part                The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.

                                        The part properties that you can include in the parameter value are id, snippet, contentDetails, and status.
                          (defaults to "snippet,contentDetails,status")
    --body (mandatory)    Provide a liveBroadcast resource [https://developers.google.com/youtube/v3/live/docs/liveBroadcasts#resource] in the request body
```

### broadcast list

```sh
prompt>yt broadcast list --help
```

```text
Returns a list of YouTube broadcasts that match the API request parameters.

Usage: yt broadcast list [arguments]
-h, --help                         Print this usage information.
    --part                         The type of a pre-built template for the broadcast to start
                                   (defaults to "snippet,status,contentDetails")
    --broadcast-status=<status>    The broadcastStatus parameter filters the API response to only include broadcasts with the specified status.

          [active]                 Return current live broadcasts.
          [all] (default)          Return all broadcasts.
          [completed]              Return broadcasts that have already ended.
          [upcoming]               Return broadcasts that have not yet started.

    --id=<id>                      The id parameter specifies a comma-separated list of YouTube broadcast IDs that identify the broadcasts being retrieved. In a liveBroadcast resource, the id property specifies the broadcast's ID.
    --broadcast-type=<event>       The broadcastType parameter filters the API response to only include broadcasts with the specified type. The parameter should be used in requests that set the mine parameter to true or that use the broadcastStatus parameter. The default value is event.

          [all]                    Return all broadcasts.
          [event] (default)        Return only scheduled event broadcasts.
          [persistent]             Return only persistent broadcasts.

    --max-results=<number>         The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 5.
                                   (defaults to "5")
```

### broadcast transition

```sh
prompt>yt broadcast transition --help
```

```text
Changes the status of a YouTube live broadcast and initiates any processes associated with the new status.

Usage: yt broadcast transition [arguments]
-h, --help                            Print this usage information.
    --broadcast-status (mandatory)    The broadcastStatus parameter identifies the state to which the broadcast is changing. Note that to transition a broadcast to either the testing or live state, the status.streamStatus must be active for the stream that the broadcast is bound to.

          [complete]                  The broadcast is over. YouTube stops transmitting video.
          [live]                      The broadcast is visible to its audience. YouTube transmits video to the broadcast's monitor stream and its broadcast stream.
          [testing]                   Start testing the broadcast. YouTube transmits video to the broadcast's monitor stream. Note that you can only transition a broadcast to the testing state if its contentDetails.monitorStream.enableMonitorStream property is set to true.

    --part                            The part parameter specifies a comma-separated list of one or more liveBroadcast resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, contentDetails, and status.
                                      (defaults to "id,snippet,contentDetails,status")
    --id=<id> (mandatory)             The id parameter specifies the unique ID of the broadcast that is transitioning to another status.
```

## channels

```sh
prompt>yt channels --help
```

```text
A channel resource contains information about a YouTube channel.

Usage: yt channels <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  list     Returns a collection of zero or more channel resources that match the request criteria.
  update   Updates a channel's metadata. Note that this method currently only supports updates to the channel resource's brandingSettings, invideoPromotion, and localizations objects and their child properties.
```

### channels list

```sh
prompt>yt channels list --help
```

```text
Updates a channel's metadata. Note that this method currently only supports updates to the channel resource's brandingSettings, invideoPromotion, and localizations objects and their child properties.

Usage: yt channels list [arguments]
-h, --help                               Print this usage information.
    --part (mandatory)                   The part parameter specifies a comma-separated list of one or more channel resource properties that the API response will include.

                                         If the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a channel resource, the contentDetails property contains other properties, such as the uploads properties. As such, if you set part=contentDetails, the API response will also contain all of those nested properties.

                                         The following list contains the part names that you can include in the parameter value:
                                         auditDetails, brandingSettings, contentDetails, contentOwnerDetails, id, localizations, snippet, statistics, status, topicDetails
    --for-username=<YouTube username>    The forUsername parameter specifies a YouTube username, thereby requesting the channel associated with that username.
    --id=<id>                            The id parameter specifies a comma-separated list of the YouTube channel ID(s) for the resource(s) that are being retrieved. In a channel resource, the id property specifies the channel's YouTube channel ID.
```

### channels update

```sh
prompt>yt channels update --help
```

```text
Updates a channel's metadata. Note that this method currently only supports updates to the channel resource's brandingSettings, invideoPromotion, and localizations objects and their child properties.

Usage: yt channels update [arguments]
-h, --help                Print this usage information.
    --part (mandatory)    The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.

                          The API currently only allows the parameter value to be set to either brandingSettings, invideoPromotion, or localizations. (You can only update any one of those parts with a single request.)

                          Note that this method overrides the existing values for all of the mutable properties that are contained in the part that the parameter value specifies.
    --body (mandatory)    Provide a liveBroadcast resource [https://developers.google.com/youtube/v3/live/docs/liveBroadcasts#resource] in the request body
```

## chat

```sh
prompt>yt chat --help
```

```text
A liveChatMessage resource represents a chat message in a YouTube live chat. The resource can contain details about several types of messages, including a newly posted text message or fan funding event.

The live chat feature is enabled by default for live broadcasts and is available while the live event is active. (After the event ends, live chat is no longer available for that event.)

Usage: yt chat <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  answer   Process chat messages and provided canned answers to set questions (not part of the documented API).
  delete   Deletes a chat message. The API request must be authorized by the channel owner or a moderator of the live chat associated with the ban.
  insert   Adds a message to a live chat. The API currently supports the ability to insert text messages only.
  list     Lists live chat messages for a specific chat.
```

### chat answer

```sh
prompt>yt chat answer --help
```

```text
Process chat messages and provided canned answers to set questions (not part of the documented API).

Usage: yt chat answer [arguments]
-h, --help                     Print this usage information.
    --chatbot-config=<path>    The path to a "yaml" file with the Chatbot configuration.
                               (defaults to "$HOME/.yt/chatbot.yaml")
```

### chat delete

```sh
prompt>yt chat delete --help
```

```text
Deletes a chat message. The API request must be authorized by the channel owner or a moderator of the live chat associated with the ban.

Usage: yt chat delete [arguments]
-h, --help                   Print this usage information.
    --id=<id> (mandatory)    The id parameter specifies the YouTube chat message ID of the resource that is being deleted.
```

### chat insert

```sh
prompt>yt chat insert --help
```

```text
Adds a message to a live chat. The API currently supports the ability to insert text messages only.

Usage: yt chat insert [arguments]
-h, --help                Print this usage information.
    --part                The part parameter serves two purposes. It identifies the properties that the write operation will set as well as the properties that the API response will include. Set the parameter value to snippet.
                          (defaults to "snippet")
    --body (mandatory)    Provide a liveChatMessage resource [https://developers.google.com/youtube/v3/live/docs/liveChatMessages#resource] in the request body.
```

### chat list

```sh
prompt>yt chat list --help
```

```text
Lists live chat messages for a specific chat.

Usage: yt chat list [arguments]
-h, --help                                   Print this usage information.
    --liveChatId=<liveChatId> (mandatory)    The liveChatId parameter specifies the ID of the chat whose messages will be returned. The live chat ID associated with a broadcast is returned in the liveBroadcast resource's snippet.liveChatId property.
    --part                                   The part parameter specifies the liveChatMessage resource parts that the API response will include. Supported values are id, snippet, and authorDetails.
                                             (defaults to "id,snippet,authorDetails")
    --max-results=<number>                   The maxResults parameter specifies the maximum number of messages that should be returned in the result set. Acceptable values are 200 to 2000, inclusive. The default value is 500.
                                             (defaults to "500")
    --page-token=<token>                     The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken property identify other pages that could be retrieved.
    --profile-image-size=<number>            The profileImageSize parameter specifies the size of the user profile pictures that should be returned in the result set. The images are square. The default value is 88, meaning pictures will be 88px by 88px. Acceptable values are in the range 16 to 720, inclusive.
                                             (defaults to "88")
```

## playlists

```sh
prompt>yt playlists --help
```

```text
A playlist resource represents a YouTube playlist. A playlist is a collection of videos that can be viewed sequentially and shared with other users. By default, playlists are publicly visible to other users, but playlists can be public or private.

Usage: yt playlists <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  delete   Deletes a playlist.
  insert   Creates a broadcast.
  list     Returns a collection of playlists that match the API request parameters. For example, you can retrieve all playlists that the authenticated user owns, or you can retrieve one or more playlists by their unique IDs.
  update   Modifies a playlist. For example, you could change a playlist's title, description, or privacy status.
```

### playlists delete

```sh
prompt>yt playlists delete --help
```

```text
Deletes a playlist.

Usage: yt playlists delete [arguments]
-h, --help                   Print this usage information.
    --id=<id> (mandatory)    The id parameter specifies the YouTube playlist ID for the playlist that is being deleted. In a playlist resource, the id property specifies the playlist's ID.
```

### playlists insert

```sh
prompt>yt playlists insert --help
```

```text
Creates a playlist.

Usage: yt playlists insert [arguments]
-h, --help                Print this usage information.
    --part                The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.

                                        The part properties that you can include in the parameter value are id, snippet, contentDetails, and status.
                          (defaults to "snippet,contentDetails,status")
    --body (mandatory)    Provide a liveBroadcast resource [https://developers.google.com/youtube/v3/live/docs/liveBroadcasts#resource] in the request body.
```

### playlists list

```sh
prompt>yt playlists list --help
```

```text
Returns a collection of playlists that match the API request parameters. For example, you can retrieve all playlists that the authenticated user owns, or you can retrieve one or more playlists by their unique IDs.

Usage: yt playlists list [arguments]
-h, --help                             Print this usage information.
    --part (mandatory)                 The part parameter specifies a comma-separated list of one or more playlist resource properties that the API response will include.

                                       If the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a playlist resource, the snippet property contains properties like author, title, description, and timeCreated. As such, if you set part=snippet, the API response will contain all of those properties.

                                       The following list contains the part names that you can include in the parameter value:
                                       contentDetails, id, localizations, player, snippet, status
    --channel-id=<YouTube username>    This value indicates that the API should only return the specified channel's playlists.
    --id=<id>                          The id parameter specifies a comma-separated list of the YouTube playlist ID(s) for the resource(s) that are being retrieved. In a playlist resource, the id property specifies the playlist's YouTube playlist ID.
    --mine                             This parameter can only be used in a properly authorized request. Set this parameter's value to true to instruct the API to only return playlists owned by the authenticated user.
    --max-results=<number>             The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 5.
                                       (defaults to "5")
    --page-token=<token>               The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.
```

### playlists update

```sh
prompt>yt playlists update --help
```

```text
Modifies a playlist. For example, you could change a playlist\'s title, description, or privacy status.

Usage: yt playlists update [arguments]
-h, --help                Print this usage information.
    --part (mandatory)    The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.

                          Note that this method will override the existing values for mutable properties that are contained in any parts that the request body specifies. For example, a playlist's description is contained in the snippet part, which must be included in the request body. If the request does not specify a value for the snippet.description property, the playlist's existing description will be deleted.

                          The following list contains the part names that you can include in the parameter value:
                          contentDetails, id, localizations, player, snippet, status
    --body (mandatory)    Provide a liveBroadcast resource [https://developers.google.com/youtube/v3/live/docs/liveBroadcasts#resource] in the request body.
```

## search

```sh
prompt>yt search --help
```

```text
A search result contains information about a YouTube video, channel, or playlist that matches the search parameters specified in an API request. While a search result points to a uniquely identifiable resource, like a video, it does not have its own persistent data.

Usage: yt search <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  list   Returns a collection of search results that match the query parameters specified in the API request. By default, a search result set identifies matching video, channel, and playlist resources, but you can also configure queries to only retrieve a specific type of resource.
```

### search list

```sh
prompt>yt search list --help
```

```text
Returns a collection of search results that match the query parameters specified in the API request. By default, a search result set identifies matching video, channel, and playlist resources, but you can also configure queries to only retrieve a specific type of resource.

Usage: yt search list [arguments]
-h, --help                                      Print this usage information.
    --part                                      The part parameter specifies a comma-separated list of one or more search resource properties that the API response will include. Set the parameter value to snippet.
                                                (defaults to "snippet")
    --for-mine                                  This parameter can only be used in a properly authorized request. The forMine parameter restricts the search to only retrieve videos owned by the authenticated user. If you set this parameter to true, then the type parameter's value must also be set to video. In addition, none of the following other parameters can be set in the same request: videoDefinition, videoDimension, videoDuration, videoLicense, videoEmbeddable, videoSyndicated, videoType.
    --related-to-video-id=<YouTube video id>    The relatedToVideoId parameter retrieves a list of videos that are related to the video that the parameter value identifies. The parameter value must be set to a YouTube video ID and, if you are using this parameter, the type parameter must be set to video.

                                                Note that if the relatedToVideoId parameter is set, the only other supported parameters are part, maxResults, pageToken, regionCode, relevanceLanguage, safeSearch, type (which must be set to video), and fields.
    --channel-id=<YouTube channel id>           The channelId parameter indicates that the API response should only contain resources created by the channel.

                                                Note: Search results are constrained to a maximum of 500 videos if your request specifies a value for the channelId parameter and sets the type parameter value to video, but it does not also set one of the forContentOwner, forDeveloper, or forMine filters.
    --channel-type=<Channel type>               The channelType parameter lets you restrict a search to a particular type of channel.

          [any]                                 Return all channels.
          [show]                                Only retrieve shows.

    --event-type=<Event type>                   The eventType parameter restricts a search to broadcast events. If you specify a value for this parameter, you must also set the type parameter's value to video.

          [completed]                           Only include completed broadcasts.
          [live]                                Only include active broadcasts.
          [upcoming]                            Only include upcoming broadcasts.

    --max-results=<number>                      The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 5.
                                                (defaults to "5")
    --order
          [date]                                Resources are sorted in reverse chronological order based on the date they were created.
          [rating]                              Resources are sorted from highest to lowest rating.
          [relevance]                           Resources are sorted based on their relevance to the search query. This is the default value for this parameter.
          [title]                               Resources are sorted alphabetically by title.
          [videoCount]                          Channels are sorted in descending order of their number of uploaded videos.
          [viewCount]                           Resources are sorted from highest to lowest number of views. For live broadcasts, videos are sorted by number of concurrent viewers while the broadcasts are ongoing.

    --page-token=<token>                        The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.
    --published-after=<date>                    The publishedAfter parameter indicates that the API response should only contain resources created at or after the specified time. The value is an RFC 3339 formatted date-time value (1970-01-01T00:00:00Z).
    --published-before=<date>                   The publishedBefore parameter indicates that the API response should only contain resources created before or at the specified time. The value is an RFC 3339 formatted date-time value (1970-01-01T00:00:00Z).
    --q=<search term>                           The q parameter specifies the query term to search for.

                                                Your request can also use the Boolean NOT (-) and OR (|) operators to exclude videos or to find videos that are associated with one of several search terms. For example, to search for videos matching either "boating" or "sailing", set the q parameter value to boating|sailing. Similarly, to search for videos matching either "boating" or "sailing" but not "fishing", set the q parameter value to boating|sailing -fishing. Note that the pipe character must be URL-escaped when it is sent in your API request. The URL-escaped value for the pipe character is %7C.
    --safe-search                               The safeSearch parameter indicates whether the search results should include restricted content as well as standard content.

          [moderate]                            YouTube will filter some content from search results and, at the least, will filter content that is restricted in your locale. Based on their content, search results could be removed from search results or demoted in search results. This is the default parameter value.
          [none]                                YouTube will not filter the search result set.
          [strict]                              YouTube will try to exclude all restricted content from the search result set. Based on their content, search results could be removed from search results or demoted in search results.

    --type                                      The type parameter restricts a search query to only retrieve a particular type of resource. The value is a comma-separated list of resource types. The default value is video,channel,playlist.
                                                (defaults to "video")
    --video-caption                             The videoCaption parameter indicates whether the API should filter video search results based on whether they have captions. If you specify a value for this parameter, you must also set the type parameter's value to video.

          [any]                                 Do not filter results based on caption availability.
          [closedCaption]                       Only include videos that have captions.
          [none]                                Only include videos that do not have captions.

    --video-category-id                         The videoCategoryId parameter filters video search results based on their category. If you specify a value for this parameter, you must also set the type parameter's value to video.
    --video-definition                          The videoDefinition parameter lets you restrict a search to only include either high definition (HD) or standard definition (SD) videos. HD videos are available for playback in at least 720p, though higher resolutions, like 1080p, might also be available. If you specify a value for this parameter, you must also set the type parameter's value to video.

          [any]                                 Return all videos, regardless of their resolution.
          [high]                                Only retrieve HD videos.
          [standard]                            Only retrieve videos in standard definition.

    --video-dimension                           The videoDimension parameter lets you restrict a search to only retrieve 2D or 3D videos. If you specify a value for this parameter, you must also set the type parameter's value to video.

          [2d]                                  Restrict search results to exclude 3D videos.
          [3d]                                  Restrict search results to only include 3D videos.
          [any]                                 Include both 3D and non-3D videos in returned results. This is the default value.

    --video-duration                            The videoDuration parameter filters video search results based on their duration. If you specify a value for this parameter, you must also set the type parameter's value to video.

          [any]                                 Do not filter video search results based on their duration. This is the default value.
          [long]                                Only include videos longer than 20 minutes.
          [medium]                              Only include videos that are between four and 20 minutes long (inclusive).
          [short]                               Only include videos that are less than four minutes long.

    --video-embeddable                          The videoEmbeddable parameter lets you to restrict a search to only videos that can be embedded into a webpage. If you specify a value for this parameter, you must also set the type parameter's value to video.

          [any]                                 Return all videos, embeddable or not.
          [true]                                Only retrieve embeddable videos.

    --video-license                             The videoLicense parameter filters search results to only include videos with a particular license. YouTube lets video uploaders choose to attach either the Creative Commons license or the standard YouTube license to each of their videos. If you specify a value for this parameter, you must also set the type parameter's value to video.

          [any]                                 Return all videos, regardless of which license they have, that match the query parameters.
          [creativeCommon]                      Only return videos that have a Creative Commons license. Users can reuse videos with this license in other videos that they create.
          [youtube]                             Only return videos that have the standard YouTube license.

    --video-syndicated                          The videoSyndicated parameter lets you to restrict a search to only videos that can be played outside youtube.com. If you specify a value for this parameter, you must also set the type parameter's value to video.

          [any]                                 Return all videos, syndicated or not.
          [true]                                Only retrieve syndicated videos.

    --video-type=<type>                         The videoType parameter lets you restrict a search to a particular type of videos. If you specify a value for this parameter, you must also set the type parameter's value to video.

          [any]                                 Return all videos.
          [episode]                             Only retrieve episodes of shows.
          [movie]                               Only retrieve movies.
```

## stream

```sh
prompt>yt stream --help
```

```text
A liveStream resource contains information about the video stream that you are transmitting to YouTube. The stream provides the content that will be broadcast to YouTube users. Once created, a liveStream resource can be bound to one or more liveBroadcast resources.

Usage: yt stream <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  delete   Deletes a video stream.
  insert   Creates a video stream. The stream enables you to send your video to YouTube, which can then broadcast the video to your audience.
  list     Returns a list of video streams that match the API request parameters.
  update   Updates a video stream. If the properties that you want to change cannot be updated, then you need to create a new stream with the proper settings.
```

### stream delete

```sh
prompt>yt stream delete --help
```

```text
Deletes a video stream.

Usage: yt stream delete [arguments]
-h, --help                   Print this usage information.
    --id=<id> (mandatory)    The id parameter specifies the YouTube live stream ID for the resource that is being deleted.
```

### stream insert

```sh
prompt>yt stream insert --help
```

```text
Creates a video stream. The stream enables you to send your video to YouTube, which can then broadcast the video to your audience.

Usage: yt stream insert [arguments]
-h, --help                Print this usage information.
    --part                The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.
                          (defaults to "id,snippet,cdn,contentDetails,status")
    --body (mandatory)    Provide a liveBroadcast resource [https://developers.google.com/youtube/v3/live/docs/liveBroadcasts#resource] in the request body.
```

### stream list

```sh
prompt>yt stream list --help
```

```text
Returns a list of video streams that match the API request parameters.

Usage: yt stream list [arguments]
-h, --help                    Print this usage information.
    --part                    The part parameter specifies a comma-separated list of one or more liveStream resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, cdn, and status.
                              (defaults to "id,snippet,cdn,status")
    --id=<id>                 The id parameter specifies a comma-separated list of YouTube stream IDs that identify the streams being retrieved. In a liveStream resource, the id property specifies the stream's ID.
    --[no-]mine               This parameter can only be used in a properly authorized request. The mine parameter can be used to instruct the API to only return streams owned by the authenticated user. Set the parameter value to true to only retrieve your own streams.
                              (defaults to on)
    --max-results=<number>    The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 5.
                              (defaults to "5")
    --page-token=<token>      The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.
```

### stream update

```sh
prompt>yt stream update --help
```

```text
Updates a video stream. If the properties that you want to change cannot be updated, then you need to create a new stream with the proper settings.

Usage: yt stream update [arguments]
-h, --help                Print this usage information.
    --part                The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.

                          The part properties that you can include in the parameter value are id, snippet, cdn, and status.

                          Note that this method will override the existing values for all of the mutable properties that are contained in any parts that the parameter value specifies. If the request body does not specify a value for a mutable property, the existing value for that property will be removed.
                          (defaults to "id,snippet,cdn,status")
    --body (mandatory)    Provide a liveBroadcast resource [https://developers.google.com/youtube/v3/live/docs/liveBroadcasts#resource] in the request body.
```

### subscriptions

```sh
prompt>yt subscriptions --help
```

```text
A subscription resource contains information about a YouTube user subscription. A subscription notifies a user when new videos are added to a channel or when another user takes one of several actions on YouTube, such as uploading a video, rating a video, or commenting on a video.

Usage: yt subscriptions <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  delete   Deletes a subscription.
  insert   Adds a subscription for the authenticated user's channel.
  list     Returns subscription resources that match the API request criteria.
```

## subscriptions list

```sh
prompt>yt subscriptions list --help
```

```text
Returns subscription resources that match the API request criteria.

Usage: yt subscriptions list [arguments]
-h, --help                             Print this usage information.
    --part                             The part parameter specifies a comma-separated list of one or more subscription resource properties that the API response will include.
                                       
                                       If the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a subscription resource, the snippet property contains other properties, such as a display title for the subscription. If you set part=snippet, the API response will also contain all of those nested properties.
                                       
                                       The following list contains the part names that you can include in the parameter value:
                                       - contentDetails
                                       - id
                                       - snippet
                                       - subscriberSnippet
                                       (defaults to "id,snippet,contentDetails,subscriberSnippet")
    --channel-id=<YouTube username>    The channelId parameter specifies a YouTube channel ID. The API will only return that channel's subscriptions.
    --id=<id>                          The id parameter specifies a comma-separated list of the YouTube subscription ID(s) for the resource(s) that are being retrieved. In a subscription resource, the id property specifies the YouTube subscription ID.
    --mine                             This parameter can only be used in a properly authorized request. Set this parameter's value to true to retrieve a feed of the authenticated user's subscriptions.
    --[no-]myRecentSubscribers         This parameter can only be used in a properly authorized request. Set this parameter's value to true to retrieve a feed of the subscribers of the authenticated user in reverse chronological order (newest first).
                                       
                                       Note that the maximum number of subscribers returned through this API might be limited.
    --[no-]mySubscribers               This parameter can only be used in a properly authorized request. Set this parameter's value to true to retrieve a feed of the subscribers of the authenticated user in no particular order. Note that the maximum number of subscribers returned through this API might be limited.
    --forChannelId                     The forChannelId parameter specifies a comma-separated list of channel IDs. The API response will then only contain subscriptions matching those channels.
    --max-results=<number>             The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 5.
                                       (defaults to "5")
    --order                            The order parameter specifies the method that will be used to sort resources in the API response. The default value is SUBSCRIPTION_ORDER_RELEVANCE.

          [alphabetical]               Sort alphabetically.
          [relevance] (default)        Sort by relevance.
          [unread]                     Sort by order of activity.
```

## subscriptions insert

```sh
prompt>yt subscriptions insert --help
```

```text
Adds a subscription for the authenticated user's channel.

Usage: yt subscriptions insert [arguments]
-h, --help                               Print this usage information.
    --part                               The part parameter specifies a comma-separated list of one or more subscription resource properties that the API response will include.
                                         
                                         If the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a subscription resource, the snippet property contains other properties, such as a display title for the subscription. If you set part=snippet, the API response will also contain all of those nested properties.
                                         
                                         The following list contains the part names that you can include in the parameter value:
                                         - contentDetails
                                         - id
                                         - snippet
                                         - subscriberSnippet
                                         (defaults to "snippet")
    --kind=<string>                      The type of the API resource.
                                         (defaults to "youtube#channel")
    --channel-id=<string> (mandatory)    The value that YouTube uses to uniquely identify the channel that the user subscribed to.
```

## subscriptions delete

```sh
prompt>yt subscriptions delete --help
```

```text
Deletes a subscription.

Usage: yt subscriptions delete [arguments]
-h, --help                   Print this usage information.
    --id=<resource id> (mandatory)    The id parameter specifies the YouTube subscription ID for the resource that is being deleted. In a subscription resource, the id property specifies the YouTube subscription ID.
```

## thumbnails

```sh
prompt>yt thumbnails --help
```

```text
A thumbnail resource identifies different thumbnail image sizes associated with a resource.

Usage: yt thumbnails <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  set   Uploads a custom video thumbnail to YouTube and sets it for a video.
```

### thumbnails set

```sh
prompt>yt thumbnails set --help
```

```text
Uploads a custom video thumbnail to YouTube and sets it for a video.

Usage: yt thumbnails set [arguments]
-h, --help                                       Print this usage information.
    --video-id=<YouTube video id> (mandatory)    The videoId parameter specifies a YouTube video ID for which the custom video thumbnail is being provided.
    --file=<file name> (mandatory)               The file name that contains the thumbnail image that you are uploading.
```

## version


```sh
prompt>yt version --help
```

```text
Display the package name and version

Usage: yt version [arguments]
-h, --help    Print this usage information.
```