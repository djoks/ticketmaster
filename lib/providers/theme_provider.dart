import 'package:flutter/material.dart';
import 'package:ticketmaster/app/app_theme.dart';

/// Provides theme management for the app, allowing toggling between light and dark themes.
///
/// Notifies listeners whenever the theme mode changes.
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  /// Returns `true` if dark mode is active.
  bool get isDarkMode => _isDarkMode;

  /// Returns the current [ThemeData] based on the [isDarkMode] flag.
  ThemeData get currentTheme =>
      _isDarkMode ? AppTheme().darkTheme : AppTheme().lightTheme;

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
