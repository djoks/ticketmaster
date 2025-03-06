import 'package:ticketmaster/models/event_response.dart';
import 'package:ticketmaster/utils/locator.dart';
import 'package:ticketmaster/models/event.dart'; // Updated import to the new model.
import 'package:ticketmaster/services/api_service.dart';
import 'package:ticketmaster/utils/logger.dart';

/// Repository class responsible for fetching event data from the API.
class EventRepository {
  final ApiService _apiService = locator<ApiService>();

  /// Creates an instance of [EventRepository].
  EventRepository();

  /// Fetches a list of events from the API.
  ///
  /// [page] and [size] control pagination. Optionally, you can provide a [keyword]
  /// to filter events.
  ///
  /// Returns a [Future] that resolves to a list of [Event] objects.
  Future<List<Event>> fetchEvents({
    int page = 0,
    int size = 15,
    String? keyword,
  }) async {
    try {
      final response = await _apiService.get(
        url: '/events.json',
        queryParameters: {
          'page': page,
          'size': size,
          if (keyword != null && keyword.isNotEmpty) 'keyword': keyword,
        },
      );
      final data = response.data;
      final eventResponse = EventResponse.fromJson(data);
      return eventResponse.events;
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}
