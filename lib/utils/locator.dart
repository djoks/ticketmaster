import 'package:get_it/get_it.dart';
import 'package:ticketmaster/repositories/event_repository.dart';
import 'package:ticketmaster/services/api_service.dart';
import 'package:ticketmaster/services/connectivity_service.dart';

/// Global service locator instance.
final GetIt locator = GetIt.instance;

/// Registers all services and repositories with the service locator.
///
/// This function should be called during app initialization before the app runs.
Future<void> setupLocator() async {
  // Register the connectivity service as a singleton.
  locator.registerSingleton<ConnectivityService>(ConnectivityService());

  // Register the API service as an asynchronous singleton.
  locator.registerSingletonAsync<ApiService>(() => ApiService.create());

  // Register the event repository as a lazy singleton.
  locator.registerLazySingleton<EventRepository>(() => EventRepository());
}
