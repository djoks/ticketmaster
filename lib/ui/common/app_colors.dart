import 'package:flutter/material.dart';

class AppColors {
  // Primary color
  static const Color primary = Color(0xFF06417E);

// Accent color
  static const Color accent = Color(0xFFC7E5FC);

  // Primary gradient
  static const Color primaryGradientStart = primary;
  static const Color primaryGradientEnd = accent;

  // Background colors
  static const Color backgroundDark = Color(0xFF1C1C1C);
  static const Color backgroundLight = Color(0xFFFFFFFF);

  // Text colors for dark theme
  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Colors.white70;

  // Text colors for light theme
  static const Color textPrimaryLight = Colors.black;
  static const Color textSecondaryLight = Colors.black54;

  // Disabled states
  static const Color backgroundDisabled = Color(0xFF1E1E1E);
  static const Color textDisabled = Color(0xFF292929);

  // Secondary button states
  static const Color secondaryDefault = Color(0xFF3D3D3D);
  static const Color secondaryPressed = primary;
  static const Color secondaryDisabled = backgroundDisabled;

  // Bottom navigation bar
  static const Color secondaryDark = Color(0xFF131313);
  static const Color secondaryLight = Color(0xFF333333);
}
