import 'package:flutter/foundation.dart';

class ThemeController extends ChangeNotifier {
  ThemeController(this._isDarkModeEnabled);

  bool _isDarkModeEnabled;
  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void onChanged(bool isDarkModeEnabled) {
    _isDarkModeEnabled = isDarkModeEnabled;
    notifyListeners();
  }
}
