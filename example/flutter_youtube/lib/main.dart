// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:desktop_webview_auth/desktop_webview_auth.dart';
// import 'package:desktop_webview_auth/google.dart';
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
      title: 'Yt Search Demo',
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
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final items = <SearchResult>[];

  late final Yt yt;

  SearchResult? searchResult;

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    yt = await Yt.withGenerator(
      // kIsWeb ? YtLoginGenerator() : DesktopLoginGenerator(),
      YtLoginGenerator(),
      logOptions: const LogOptions(
        LogLevel.debug,
        stackTraceLevel: LogLevel.off,
      ),
    );
  }

  Future<void> _getVideos(String query) async {
    items.clear();

    final searchListResponse =
        await yt.search.list(q: query, part: 'snippet', type: 'video');

    setState(() {
      items.addAll(searchListResponse.items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                // border: InputBorder.none,
                labelText: 'Search for',
                hintText: 'keywords',
              ),
              onChanged: _getVideos,
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
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
                      child: Image.network(items[index]
                          .snippet!
                          .thumbnails
                          .thumbnailsDefault
                          .url),
                    ),
                    title: Text(items[index].snippet!.title),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}

// class DesktopLoginGenerator implements TokenGenerator {
//   final googleSignInArgs = GoogleSignInArgs(
//     clientId:
//         '[a Google OAUTH client ID]',
//     redirectUri: 'https://localhost:5544',
//     scope: 'https://www.googleapis.com/auth/youtube.force-ssl',
//   );

//   @override
//   Future<Token> generate() async {
//     AuthResult? result;
//     try {
//       result = await DesktopWebviewAuth.signIn(googleSignInArgs);
//     } catch (err) {
//       // something went wrong
//     }

//     if (result == null) throw Exception();

//     return Token(
//         accessToken: result.accessToken!,
//         expiresIn: 3599,
//         scope: null,
//         tokenType: '');
//   }
// }

class YtLoginGenerator implements TokenGenerator {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/youtube.force-ssl',
    ],
  );

  @override
  Future<Token> generate() async {
    var currentUser = await _googleSignIn.signInSilently();

    currentUser ??= await _googleSignIn.signIn();

    final token = (await currentUser!.authentication).accessToken;

    if (token == null) throw Exception();

    return Token(
        accessToken: token, expiresIn: 3599, scope: null, tokenType: '');
  }
}
