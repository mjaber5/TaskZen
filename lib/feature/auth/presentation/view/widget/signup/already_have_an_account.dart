import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_zen/core/utils/app_router.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: ZTextTheme.lightTextTheme.bodyMedium!.copyWith(
            color: isDark ? ZColors.textOnPrimary : ZColors.textSecondary,
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.loginView);
          },
          child: Text(
            'Login',
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
