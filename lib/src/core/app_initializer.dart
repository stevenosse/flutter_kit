import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppInitializer {
  /// Initialize services, plugins, etc. before the app runs.
  Future<void> preAppRun() async {}

  /// Initialize services, plugins, etc. after the app runs.
  Future<void> postAppRun() async {
    // Hide RSOD in release mode.
    if (kReleaseMode) {
      ErrorWidget.builder = (FlutterErrorDetails details) => const SizedBox();
    }
  }
}