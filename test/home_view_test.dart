import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketmaster/models/event.dart';
import 'package:ticketmaster/ui/views/home/home_view.dart';
import 'package:ticketmaster/ui/views/home/home_view_model.dart';

import 'utils/pump_localized_widget.dart';
import 'home_view_test.mocks.dart';

/// Generates a mock class for [HomeViewModel].
@GenerateMocks([HomeViewModel])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  // Initialize EasyLocalization before any tests run.
  setUpAll(() async {
    await EasyLocalization.ensureInitialized();
  });

  group('HomeView Widget Tests', () {
    late MockHomeViewModel mockViewModel;

    setUp(() {
      // Create a new instance of the mock view model.
      mockViewModel = MockHomeViewModel();

      // Stub loadMore so it does nothing during init.
      when(mockViewModel.loadMore(reset: anyNamed('reset')))
          .thenAnswer((_) async {});
    });

    testWidgets('displays a list of events when data is loaded',
        (WidgetTester tester) async {
      // Arrange: Create sample events.
      final event1 = Event(
        id: '1',
        name: 'Test Event 1',
        thumbnail: 'https://example.com/thumb1.jpg',
        banner: 'https://example.com/banner1.jpg',
        date: '2025-03-24',
        time: '19:00:00',
        priceRange: null,
        location: 'Test Location 1',
        description: 'Test description 1',
      );
      final event2 = Event(
        id: '2',
        name: 'Test Event 2',
        thumbnail: 'https://example.com/thumb2.jpg',
        banner: 'https://example.com/banner2.jpg',
        date: '2025-03-25',
        time: '20:00:00',
        priceRange: null,
        location: 'Test Location 2',
        description: 'Test description 2',
      );

      // Arrange: Set the view model state to not loading and provide sample events.
      when(mockViewModel.isLoading).thenReturn(false);
      when(mockViewModel.items).thenReturn([event1, event2]);
      when(mockViewModel.hasMore).thenReturn(false);

      // Act: Build the HomeView widget.
      await pumpLocalizedWidget(
        tester,
        ChangeNotifierProvider<HomeViewModel>.value(
          value: mockViewModel,
          child: const HomeView(),
        ),
      );
      await tester.pumpAndSettle();

      // Assert: Verify that the event names are visible.
      expect(find.text('Test Event 1'), findsOneWidget);
      expect(find.text('Test Event 2'), findsOneWidget);
    });
  });
}
