import 'dart:developer';
import 'dart:io';

import 'classes/rename_package_service.dart';
import 'classes/rename_project_service.dart';

const packageNameKey = 'package-name';
const projectNameKey = 'name';

// ignore_for_file: avoid_print
void main(List<String> args) {
  late final Map<String, String> parsedArgs;

  try {
    parsedArgs = _parseArgs(args);
  } catch (e) {
    log('', error: e);
    exit(1);
  }

  if (parsedArgs.containsKey(packageNameKey)) {
    final String newPackageName = parsedArgs[packageNameKey]!;
    RenamePackageService().run(newPackageName);
    
    print('\x1B[32m✓\x1B[0m Package name replaced with $newPackageName');
  }
  if (parsedArgs.containsKey(projectNameKey)) {
    final String newProjectName = parsedArgs[projectNameKey]!;

    RenameProjectService().run(newProjectName);
    print('\x1B[32m✓\x1B[0m Project name replaced with $newProjectName');
  }
}

Map<String, String> _parseArgs(List<String> args) {
  final map = <String, String>{};
  for (final arg in args) {
    final split = arg.split('=');
    if (split.length != 2) {
      throw Exception('''
Please make sure that arguments use the format: --arg=value
''');
    }
    map[split[0].substring(2)] = split[1];
  }

  return map;
}
