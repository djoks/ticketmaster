import 'package:get_it/get_it.dart';
import 'package:ticketmaster/repositories/event_repository.dart';
import 'package:ticketmaster/services/api_service.dart';

class AppLocator {
  final GetIt locator = GetIt.instance;

  void setup() {
    // Services
    locator.registerSingleton<ApiService>(ApiService());

    // Repositories
    locator.registerLazySingleton<EventRepository>(() => EventRepository());
  }
}
