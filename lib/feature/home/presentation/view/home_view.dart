import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_zen/core/utils/app_router.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/feature/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:task_zen/feature/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? ZColors.black : ZColors.white,
      appBar: AppBar(
        backgroundColor: isDark ? ZColors.black : ZColors.white,
        title: const Text('TaskZen Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthCubit>().logout();
              GoRouter.of(context).go(AppRouter.loginView);
            },
          ),
        ],
      ),
      body: HomeViewBody(),
    );
  }
}
