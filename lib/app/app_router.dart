import 'package:go_router/go_router.dart';
import 'package:ticketmaster/ui/layouts/app_layout.dart';
import 'package:ticketmaster/ui/views/details_view.dart';
import 'package:ticketmaster/ui/views/home/home_view.dart';

/// The router configuration for the Ticketmaster app using GoRouter.
///
/// This router defines the main navigation routes:
/// - The home page at `/`
/// - The event details page at `/events/:id`
///
/// Both routes are wrapped in an [AppLayout] provided by a [ShellRoute],
/// which supplies a common layout for all screens.
class AppRouter {
  /// The [GoRouter] instance that manages app navigation.
  final GoRouter routes = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => HomeView(),
          ),
          GoRoute(
            path: '/events/:id',
            builder: (context, state) => DetailsView(),
          ),
        ],
      ),
    ],
  );
}
