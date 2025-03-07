import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticketmaster/models/event.dart';
import 'package:ticketmaster/repositories/event_repository.dart';
import 'package:ticketmaster/utils/locator.dart';
import 'package:ticketmaster/utils/logger.dart';

/// View model for the event details screen.
/// It fetches event details and formats information for display.
class DetailsViewModel extends ChangeNotifier {
  final EventRepository _repository = locator<EventRepository>();

  Event? event;
  String formattedDateTime = '';
  bool isLoading = true;
  String? errorMessage;

  /// Loads event details by the given [eventId].
  Future<void> loadEvent(String eventId) async {
    try {
      isLoading = true;
      notifyListeners();

      event = await _repository.fetchEventDetail(eventId);
      _formatDateTime();
    } catch (e) {
      log.e(e.toString());
      errorMessage = 'Failed to load event details.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Formats the event's date and time into a human-readable string.
  void _formatDateTime() {
    if (event == null) return;
    final dt = DateTime.tryParse('${event!.date}T${event!.time}');
    formattedDateTime = dt != null
        ? DateFormat("MMM d, yyyy, h:mm a").format(dt)
        : '${event!.date} ${event!.time}';
  }
}
