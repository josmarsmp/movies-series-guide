import 'package:flutter/material.dart';

extension BuilContextExt on BuildContext {
  bool get isDarkModeEnabled {
    return Theme.of(this).brightness == Brightness.dark;
  }

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
}
