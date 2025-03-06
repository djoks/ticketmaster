import 'package:ticketmaster/models/event.dart';
import 'package:ticketmaster/utils/locator.dart';
import 'package:ticketmaster/providers/pagination_provider.dart';
import 'package:ticketmaster/repositories/event_repository.dart';
import 'package:ticketmaster/utils/logger.dart';

/// A ViewModel for managing paginated events.
///
/// This class extends [PaginationProvider] to fetch events from the
/// [EventRepository]. The [keyword] property can be used to filter results.
class HomeViewModel extends PaginationProvider<Event> {
  final EventRepository _repository = locator<EventRepository>();

  /// Optional search keyword used to filter the events.
  String? keyword;

  @override
  Future<List<Event>> fetchItems({required int page}) {
    return _repository
        .fetchEvents(page: page, keyword: keyword)
        .catchError((e) {
      log.e(e.toString());
      return <Event>[];
    });
  }
}
