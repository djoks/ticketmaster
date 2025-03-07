import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/providers/theme_provider.dart';
import 'package:ticketmaster/ui/common/app_colors.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch(
      value: themeProvider.isDarkMode,
      onChanged: (bool value) {
        themeProvider.toggleTheme();
      },
      thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
          if (themeProvider.isDarkMode) {
            return const Icon(Icons.nightlight_round);
          }
          return const Icon(Icons.wb_sunny);
        },
      ),
      activeColor: AppColors.secondaryDark,
      activeTrackColor: AppColors.primary,
      inactiveThumbColor: Colors.amber,
      inactiveTrackColor: Colors.amber[100],
    );
  }
}
