import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/ui/layouts/app_layout.dart';
import 'package:ticketmaster/ui/views/home/home_view.dart';
import 'package:ticketmaster/ui/views/home/home_view_model.dart';

class AppRouter {
  final GoRouter routes = GoRouter(initialLocation: '/', routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppLayout(
          child: child,
        );
      },
      routes: [
        GoRoute(path: '/',  builder: (context, state) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: HomeView(), // This is where the view is used
    );
  },),
      ],
    )
  ]);
}