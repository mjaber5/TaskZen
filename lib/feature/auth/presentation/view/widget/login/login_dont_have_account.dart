import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_zen/core/utils/app_router.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: ZTextTheme.lightTextTheme.bodyMedium!.copyWith(
            color: isDark ? ZColors.textOnPrimary : ZColors.textSecondary,
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.signupView);
          },
          child: Text(
            'Sign Up',
            style: ZTextTheme.lightTextTheme.bodyMedium!.copyWith(
              color: ZColors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
