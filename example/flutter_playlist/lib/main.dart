import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loggy/loggy.dart';
import 'package:yt/yt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

  late final Yt yt;

  Playlists? playlists;

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    yt = await Yt.withGenerator(
      YtLoginGenerator(),
      logOptions: const LogOptions(
        LogLevel.debug,
        stackTraceLevel: LogLevel.off,
      ),
    );
  }

  void _getPlaylists() async {
    items.clear();

    final playlistResponse = await yt.playlists.list(mine: true);

    setState(() {
      items.addAll(playlistResponse.items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
                title: Text(items[index].snippet!.title),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getPlaylists,
        tooltip: 'PlayLists',
        child: Icon(Icons.add),
      ),
    );
  }
}

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

    _currentUser ??= await _googleSignIn.signIn();

    final token = (await _currentUser!.authentication).accessToken;

    if (token == null) throw Exception();

    return Token(
        accessToken: token, expiresIn: 3599, scope: null, tokenType: '');
  }
}
