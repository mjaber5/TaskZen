import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';

class ForgotPassword extends StatelessWidget {
  final VoidCallback? onPressed;

  const ForgotPassword({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Forgot Password?',
          style: ZTextTheme.lightTextTheme.bodySmall!.copyWith(
            color: ZColors.secondary,
          ),
        ),
      ),
    );
  }
}
