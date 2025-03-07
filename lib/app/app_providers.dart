import 'package:provider/provider.dart';
import 'package:ticketmaster/providers/app_provider.dart';
import 'package:ticketmaster/providers/theme_provider.dart';
import 'package:ticketmaster/ui/views/details/details_view_model.dart';
import 'package:ticketmaster/ui/views/home/home_view_model.dart';

class AppProviders {
  final providers = [
    // App Service Provider
    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
    // Theme Service Provider
    ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
    // HomeViewModel Provider
    ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
    // DetailsViewModel Provider
    ChangeNotifierProvider<DetailsViewModel>(create: (_) => DetailsViewModel()),
  ];
}
