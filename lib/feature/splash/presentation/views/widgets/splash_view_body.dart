import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_zen/core/utils/app_router.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';
import 'package:task_zen/feature/splash/presentation/views/widgets/custom_splash_view.dart';
import 'package:task_zen/feature/splash/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _rotationAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    Future.delayed(const Duration(milliseconds: 4000), () {
      GoRouter.of(context).pushReplacement(AppRouter.loginView);
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: RotationTransition(
                turns: _rotationAnimation,
                child: const CustomView(),
              ),
            ),
          ),
          SizedBox(height: ZSizes.lg),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'T',
                  style: ZTextTheme.lightTextTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: ZColors.secondary,
                    fontSize: ZSizes.iconXl,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'askZen',
                  style: ZTextTheme.lightTextTheme.displayLarge!.copyWith(
                    fontSize: ZSizes.iconXl,
                    fontWeight: FontWeight.w900,
                    color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: ZSizes.sm),
          SlidingText(slidingAnimation: _slidingAnimation),
          SizedBox(height: ZSizes.xl),
          CircularProgressIndicator(
            color: ZColors.secondary,
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(ZColors.secondary),
          ),
        ],
      ),
    );
  }
}
