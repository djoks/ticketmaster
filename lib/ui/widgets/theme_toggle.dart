import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/providers/theme_provider.dart';

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
      activeThumbImage: const AssetImage('assets/images/moon.png'),
      inactiveThumbImage: const AssetImage('assets/images/sun.png'),
      activeTrackColor: Colors.grey,
      inactiveTrackColor: Colors.grey[300],
    );
  }
}
