import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/core/app_initializer.dart';
import 'package:flutter_boilerplate/src/core/application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  final AppInitializer appInitializer = AppInitializer();

  runZonedGuarded(
    () async {
      await appInitializer.preAppRun();

      runApp(Application());

      appInitializer.postAppRun();
    },
    (error, stack) {},
  );
}
