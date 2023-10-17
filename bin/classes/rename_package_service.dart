import 'dart:io';

import 'base_service.dart';

final _replacePackageInfiles = ['*.kt', '*.xml', 'build.gradle', 'project.pbxproj', '*/*.xcodeproj/project.pbxproj'];
const _androidDefaultPackageName = 'com.stevenosse.flutter_kit';
const _iosDefaultPackageName = 'com.stevenosse.flutter-kit';

class RenamePackageService extends Service {
  @override
  Iterable<String> get files => _replacePackageInfiles;

  void run(String packageName) {
    _replacePackageName(getFilePaths(), _androidDefaultPackageName, packageName);
    _replacePackageName(getFilePaths(), _iosDefaultPackageName, packageName);

    Directory('android/app/src/main/kotlin/com/stevenosse/flutter_kit')
        .renameSync('android/app/src/main/kotlin/${packageName.replaceAll('.', '/')}');
  }

  void _replacePackageName(
    Iterable<String> files,
    String oldPackageName,
    String newPackageName,
  ) {
    for (final file in files) {
      final result = Process.runSync('sed', [
        '-i',
        '',
        's/$oldPackageName/$newPackageName/g',
        file,
      ]);
      if (result.exitCode != 0) {
        throw Exception('Error while replacing package name: ${result.stderr}');
      }
    }
  }
}
