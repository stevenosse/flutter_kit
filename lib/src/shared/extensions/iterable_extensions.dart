import 'package:flutter/material.dart';

extension ListUtil on Iterable<Widget> {
  Iterable<Widget> divide({required Widget separator}) sync* {
    for (int i = 0; i < length; i++) {
      yield elementAt(i);
      if (last != elementAt(i)) {
        yield separator;
      }
    }
  }
}
