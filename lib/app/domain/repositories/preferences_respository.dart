abstract class PreferencesRepository {
  bool? get isDarkModeEnabled;

  Future<void> setDarkMode(bool enableDarkMode);
}
