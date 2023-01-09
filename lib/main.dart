import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/core/app_initializer.dart';
import 'package:flutter_boilerplate/src/core/application.dart';

void main() {
  final AppInitializer appInitializer = AppInitializer();
  runZonedGuarded(
    () async {
      await appInitializer.preAppRun();

      runApp(const Application());

      await appInitializer.postAppRun();
    },
    (error, stack) {},
  );
}
