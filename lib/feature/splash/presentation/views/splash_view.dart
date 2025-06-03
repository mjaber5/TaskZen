import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/feature/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? ZColors.black : ZColors.white,
      body: const SafeArea(child: SplashViewBody()),
    );
  }
}
