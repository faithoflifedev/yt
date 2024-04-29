// import 'dart:convert';

// import 'package:cli_pkg/cli_pkg.dart' as pkg;
import 'package:publish_tools/publish_tools.dart';
// import 'package:universal_io/io.dart';

main(args) async {
  PublishTools.addAllTasks();

  // pkg.humanName.value = "yt";

  // pkg.executables.value = {'yt': 'bin/yt.dart'};

  // pkg.githubUser.fn = () => Platform.environment["GH_USER"];
  // pkg.githubPassword.fn = () => Platform.environment["GH_TOKEN"];

  // pkg.npmPackageJson.fn = () =>
  //     json.decode(File('package/package.json').readAsStringSync())
  //         as Map<String, dynamic>;

  // pkg.addAllTasks();

  grind(args);
}

@DefaultTask('Just keeping it real')
@Depends('pt-commit', 'pt-publish', 'pt-homebrew')
done() {
  log('commit to faithoflifedev/yt complete');
  log('publish to pub.dev/packages complete.');
  log('commit to faithoflifedev/homebrew-yt complete');
}
