import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: Implement forgot password logic
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Forgot Password clicked')),
          );
        },
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
