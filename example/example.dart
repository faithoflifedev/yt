import 'dart:io';

import 'package:yt/yt.dart';

void main() async {
  final yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

  final br = await yt.broadcast;

  final th = await yt.thumbnails;

  final broadcastItem = await br.insert(body: {
    'snippet': {
      'title': 'TEST AGAIN',
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

  await br.bind(
      broadcastId: broadcastItem.id,
      streamId: 'nryUpLOoYOYhjAwN6E4Wvw1589352667178384');

  print(broadcastItem);

  final locationUrl = await th.location(videoId: broadcastItem.id);

  print(locationUrl);

  await th.set(
      videoId: broadcastItem.id,
      uploadId: getUploadId(locationUrl),
      thumbnail: File(
          '/Users/chris/projects/skc/broadcast/broadcast_cli/thumbnail/pre-iftar.jpg'));

  print('image uploaded');
}

String getUploadId(String locationUrl) {
  final locationUri = Uri.parse(locationUrl);

  if (!locationUri.queryParameters.containsKey('upload_id'))
    throw Exception('The uplaod ID has not been found.');

  return locationUri.queryParameters['upload_id']!;
}
