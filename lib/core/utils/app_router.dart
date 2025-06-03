import 'package:go_router/go_router.dart';
import 'package:task_zen/feature/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String splashRoute = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
