import 'package:go_router/go_router.dart';
import 'package:task_zen/feature/auth/presentation/view/login_view.dart';
import 'package:task_zen/feature/auth/presentation/view/signup_view.dart';
import 'package:task_zen/feature/home/presentation/view/home_view.dart';
import 'package:task_zen/feature/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String splashRoute = '/';
  static const String loginView = '/loginView';
  static const String signupView = '/signupView';
  static const String homeView = '/homeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: loginView,
        builder:
            (context, state) => const LoginView(), // Placeholder for Login View
      ),
      GoRoute(
        path: signupView,
        builder:
            (context, state) =>
                const SignupView(), // Placeholder for Login View
      ),
      GoRoute(path: homeView, builder: (context, state) => const HomeView()),
    ],
  );
}
