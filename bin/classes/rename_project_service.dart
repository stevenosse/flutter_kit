import 'dart:io';

import 'base_service.dart';

const _filesToRename = 'lib/*.dart';

class RenameProjectService extends Service {
  void run(String name) {
    final files = getFilePaths();

    // Replace package name in files
    const String toReplace = 'package:flutter_kit';
    final String replacement = 'package:$name';

    for (final file in files) {
      final result = Process.runSync('sed', [
        '-i',
        '',
        's/$toReplace/$replacement/g',
        file,
      ]);
      if (result.exitCode != 0) {
        throw Exception('Error while replacing package name: ${result.stderr}');
      }
    }

    final pubspec = File('pubspec.yaml');
    final pubspecContent = pubspec.readAsStringSync();
    final newPubspecContent = pubspecContent.replaceAll('flutter_kit', name);
    pubspec.writeAsStringSync(newPubspecContent);
  }
  
  @override
  Iterable<String> get files => [_filesToRename];
}
