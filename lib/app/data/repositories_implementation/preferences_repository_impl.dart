import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/enums.dart';
import '../../domain/repositories/preferences_respository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  bool? get isDarkModeEnabled {
    return _preferences.getBool(
      Preference.isDarkModeEnabled.name,
    );
  }

  @override
  Future<void> setDarkMode(bool enableDarkMode) {
    return _preferences.setBool(
      Preference.isDarkModeEnabled.name,
      enableDarkMode,
    );
  }
}
