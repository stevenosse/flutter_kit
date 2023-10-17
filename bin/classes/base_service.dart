import 'dart:io';

abstract class Service {
  Iterable<String> get  files;

  Iterable<String> getFilePaths() sync* {
    for (final file in files) {
      final result = Process.runSync('git', ['ls-files', file]);
      if (result.exitCode != 0) {
        throw Exception('Error while getting files: ${result.stderr}');
      }

      final files = result.stdout.toString().split('\n');
      for (final file in files) {
        if (file.isNotEmpty) {
          yield file;
        }
      }
    }
  }
}
