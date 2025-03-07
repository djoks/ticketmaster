import 'package:flutter/material.dart';
import 'package:ticketmaster/app/app_theme.dart';

/// Provides theme management for the app, allowing toggling between light and dark themes.
///
/// By default, the theme is initialized to match the device's current theme.
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode;

  /// Returns `true` if dark mode is active.
  bool get isDarkMode => _isDarkMode;

  /// Returns the current [ThemeData] based on the [_isDarkMode] flag.
  ThemeData get currentTheme =>
      _isDarkMode ? AppTheme().darkTheme : AppTheme().lightTheme;

  /// Initializes the provider with the device's current theme setting.
  ThemeProvider()
      : _isDarkMode = WidgetsBinding.instance.window.platformBrightness ==
            Brightness.dark;

  /// Toggles between light and dark themes.
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  /// Sets the theme mode.
  ///
  /// [isDark] should be `true` for dark mode or `false` for light mode.
  void setDarkMode(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }
}
