import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:yt/yt.dart' hide Image;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yt Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Yt Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = <Playlist>[];

  Yt? yt;

  Playlists? playlists;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> init() async {
    final yamlString = await rootBundle.loadString('res/youtube.yaml');

    yt = Yt.withOAuth(OAuthCredentials.fromYamlString(yamlString));

    if (yt == null) throw Exception();

    playlists = await yt!.playlists;
  }

  void _getPlaylists() async {
    if (playlists == null) throw Exception();

    items.clear();

    final playlistResponse = await playlists!.list(mine: true);

    setState(() {
      items.addAll(playlistResponse.items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              if (items[index].snippet == null) throw Exception();
              return ListTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  child: Image.network(
                      items[index].snippet!.thumbnails.thumbnailsDefault.url),
                ),
                title: Text('${items[index].snippet!.title}'),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getPlaylists,
        tooltip: 'PlayLists',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
