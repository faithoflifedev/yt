import 'package:yt/yt.dart';

void main() async {
  final yt = Yt.withOAuth(OAuthCredentials.fromYaml('example/youtube.yaml'));

  final br = await yt.broadcast;

  final chat = await yt.chat;

  final liveBroadcastResponse = await br.list(broadcastStatus: 'active');

  final chatMessage = <String, dynamic>{
    'snippet': {
      'type': 'textMessageEvent',
      'liveChatId': liveBroadcastResponse.items.first.snippet?.liveChatId,
      'textMessageDetails': {'messageText': 'I need something here'}
    }
  };

  await chat.insert(body: chatMessage);
}
