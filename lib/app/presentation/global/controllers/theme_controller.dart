import 'package:flutter/foundation.dart';

import '../../../domain/repositories/preferences_respository.dart';

class ThemeController extends ChangeNotifier {
  ThemeController(
    this._isDarkModeEnabled, {
    required this.preferencesRepository,
  });

  final PreferencesRepository preferencesRepository;
  bool _isDarkModeEnabled;
  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void onChanged(bool isDarkModeEnabled) {
    _isDarkModeEnabled = isDarkModeEnabled;
    preferencesRepository.setDarkMode(_isDarkModeEnabled);
    notifyListeners();
  }
}
