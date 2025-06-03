import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder:
          (context, _) => SlideTransition(
            position: slidingAnimation,
            child: Text(
              'Simplify tasks, amplify focus.',
              style: ZTextTheme.lightTextTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: ZSizes.fontSizeMd,
                color:
                    isDark
                        ? ZColors.textOnPrimary.withOpacity(0.85)
                        : ZColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
    );
  }
}
