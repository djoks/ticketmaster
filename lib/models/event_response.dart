import 'package:ticketmaster/models/event.dart';

class EventResponse {
  final List<Event> events;

  EventResponse({required this.events});

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    final eventsJson = (json['_embedded']?['events'] as List?) ?? [];
    return EventResponse(
      events: eventsJson.map((e) => Event.fromJson(e)).toList(),
    );
  }
}
