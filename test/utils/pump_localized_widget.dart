import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/app/app_providers.dart';

/// A fake asset loader that supplies minimal translations for testing.
class FakeAssetLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    return {
      'home.title': 'Home',
      'details.search_hint': 'Search...',
    };
  }
}

/// Wraps [widgetUnderTest] with EasyLocalization and MaterialApp for testing.
Future<void> pumpLocalizedWidget(
  WidgetTester tester,
  Widget widgetUnderTest,
) async {
  await tester.pumpWidget(
    MultiProvider(
        providers: AppProviders().providers,
        child: EasyLocalization(
          path:
              'assets/translations', // dummy path; keys come from FakeAssetLoader
          supportedLocales: const [Locale('en', 'US')],
          fallbackLocale: const Locale('en', 'US'),
          startLocale: const Locale('en', 'US'),
          assetLoader: FakeAssetLoader(),
          child: Builder(
            builder: (context) {
              return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                home: widgetUnderTest,
              );
            },
          ),
        )),
  );
  await tester.pumpAndSettle();
}
