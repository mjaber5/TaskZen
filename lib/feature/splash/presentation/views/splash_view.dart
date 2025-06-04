import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_zen/core/utils/app_router.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/feature/auth/model/data/repositories/auth_repositiory.dart';
import 'package:task_zen/feature/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:task_zen/feature/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:task_zen/feature/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = RepositoryProvider.of<AuthRepository>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create:
          (context) =>
              AuthCubit(authRepository: authRepository)..checkAuthStatus(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          Future.delayed(const Duration(milliseconds: 3000), () {
            if (!context.mounted) return;
            if (state is AuthSuccess) {
              GoRouter.of(context).pushReplacement(AppRouter.layoutView);
            } else if (state is AuthInitial || state is AuthError) {
              GoRouter.of(context).pushReplacement(AppRouter.loginView);
            }
          });
        },
        child: Scaffold(
          backgroundColor: isDark ? ZColors.black : ZColors.white,
          body: SplashViewBody(),
        ),
      ),
    );
  }
}
