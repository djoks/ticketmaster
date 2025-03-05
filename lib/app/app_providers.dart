import 'package:provider/provider.dart';
import 'package:ticketmaster/providers/app_provider.dart';
import 'package:ticketmaster/providers/theme_provider.dart';

class AppProviders {
  final providers = [
    // App Service Provider
    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
    // Theme Service Provider
    ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
  ];
}