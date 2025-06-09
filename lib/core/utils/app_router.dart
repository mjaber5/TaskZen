import 'package:go_router/go_router.dart';
import 'package:task_zen/feature/auth/presentation/view/login_view.dart';
import 'package:task_zen/feature/auth/presentation/view/signup_view.dart';
import 'package:task_zen/feature/home/presentation/view/ai_view.dart';
import 'package:task_zen/feature/home/presentation/view/focus_timer_view.dart';
import 'package:task_zen/feature/home/presentation/view/home_view.dart';
import 'package:task_zen/feature/layout/presentation/view/layout_view.dart';
import 'package:task_zen/feature/profile/presentation/view/profile_view.dart';
import 'package:task_zen/feature/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String splashRoute = '/';
  static const String loginView = '/loginView';
  static const String signupView = '/signupView';
  static const String layoutView = '/layoutView';
  static const String homeView = '/homeView';
  static const String profileView = '/profileView';
  static const String aiView = '/aiView';
  static const String focusTimerView = '/focusTimerView';

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
      GoRoute(
        path: layoutView,
        builder: (context, state) => const LayoutView(),
      ),
      GoRoute(path: homeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: profileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(path: aiView, builder: (context, state) => const AiView()),
      GoRoute(
        path: focusTimerView,
        builder: (context, state) => const FocusTimerView(),
      ),
    ],
  );
}
