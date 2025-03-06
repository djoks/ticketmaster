import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/services/connectivity_service.dart';
import 'package:ticketmaster/utils/locator.dart';
import 'package:ticketmaster/app/app_providers.dart';
import 'package:ticketmaster/app/app_router.dart';
import 'package:ticketmaster/app/app_theme.dart';
import 'package:ticketmaster/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await setupLocator();

  final connectivityService = locator<ConnectivityService>();
  connectivityService.startPeriodicNetworkChecks();

  runApp(
    MultiProvider(
      providers: AppProviders().providers,
      child: EasyLocalization(
        supportedLocales: [Locale('en', 'US')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: tr('app'),
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: AppRouter().routes,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
