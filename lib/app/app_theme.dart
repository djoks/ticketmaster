import 'package:flutter/material.dart';
import 'package:ticketmaster/ui/common/app_colors.dart';

class AppTheme {
  // Light theme configuration
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.textPrimaryLight,
      ),
      titleTextStyle: const TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondaryLight,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondaryLight,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.textPrimaryLight),
      displayMedium: TextStyle(color: AppColors.textPrimaryLight),
      displaySmall: TextStyle(color: AppColors.textPrimaryLight),
      headlineLarge: TextStyle(color: AppColors.textPrimaryLight),
      headlineMedium: TextStyle(color: AppColors.textPrimaryLight),
      headlineSmall: TextStyle(color: AppColors.textPrimaryLight),
      titleLarge: TextStyle(color: AppColors.textPrimaryLight),
      titleMedium: TextStyle(color: AppColors.textPrimaryLight),
      titleSmall: TextStyle(color: AppColors.textPrimaryLight),
      bodyLarge: TextStyle(color: AppColors.textSecondaryLight),
      bodyMedium: TextStyle(color: AppColors.textSecondaryLight),
      bodySmall: TextStyle(color: AppColors.textSecondaryLight),
      labelLarge: TextStyle(color: AppColors.textPrimaryLight),
      labelMedium: TextStyle(color: AppColors.textSecondaryLight),
      labelSmall: TextStyle(color: AppColors.textSecondaryLight),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.backgroundLight,
      onPrimary: AppColors.textPrimaryLight,
      onSecondary: AppColors.textPrimaryLight,
      onSurface: AppColors.textPrimaryLight,
      error: Colors.red,
      onError: AppColors.textPrimaryLight,
    ),
  );

  // Dark theme configuration
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.textPrimaryDark,
      ),
      titleTextStyle: const TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondaryDark,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondaryDark,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.textPrimaryDark),
      displayMedium: TextStyle(color: AppColors.textPrimaryDark),
      displaySmall: TextStyle(color: AppColors.textPrimaryDark),
      headlineLarge: TextStyle(color: AppColors.textPrimaryDark),
      headlineMedium: TextStyle(color: AppColors.textPrimaryDark),
      headlineSmall: TextStyle(color: AppColors.textPrimaryDark),
      titleLarge: TextStyle(color: AppColors.textPrimaryDark),
      titleMedium: TextStyle(color: AppColors.textPrimaryDark),
      titleSmall: TextStyle(color: AppColors.textPrimaryDark),
      bodyLarge: TextStyle(color: AppColors.textSecondaryDark),
      bodyMedium: TextStyle(color: AppColors.textSecondaryDark),
      bodySmall: TextStyle(color: AppColors.textSecondaryDark),
      labelLarge: TextStyle(color: AppColors.textPrimaryDark),
      labelMedium: TextStyle(color: AppColors.textSecondaryDark),
      labelSmall: TextStyle(color: AppColors.textSecondaryDark),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.backgroundDark,
      onPrimary: AppColors.textPrimaryDark,
      onSecondary: AppColors.textPrimaryDark,
      onSurface: AppColors.textPrimaryDark,
      error: Colors.red,
      onError: AppColors.textPrimaryDark,
    ),
  );
}
