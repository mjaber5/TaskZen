import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Sign Up',
          style: ZTextTheme.lightTextTheme.labelLarge!.copyWith(
            color: ZColors.buttonText,
          ),
        ),
      ),
    );
  }
}
