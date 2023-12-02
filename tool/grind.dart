import 'package:cli_pkg/cli_pkg.dart' as pkg;
import 'package:grinder/grinder.dart';
import 'package:publish_tools/publish_tools.dart';

main(args) async {
  PublishTools.addAllTasks();

  pkg.executables.value = {'yt': 'bin/yt.dart'};

  pkg.addNpmTasks();

  grind(args);
}

@DefaultTask('Just keeping it real')
@Depends('pt-commit', 'pt-publish', 'pt-homebrew')
done() {
  log('commit to faithoflifedev/yt complete');
  log('publish to pub.dev/packages complete.');
  log('commit to faithoflifedev/homebrew-yt complete');
}
